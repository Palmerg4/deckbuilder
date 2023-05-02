/// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC1155} from "lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";

contract DeckBuilder {

    /* Store user deck ID input - store IDS/Amounts arrays on FE - check arrays against hash via checkKeccak()
                                                                     when a user selects a deck to use

        Retrieve stored deck IDs
            - Using a subgraph query on FE to retreive the Ids and Amounts then check the users balance is correct to use the deck
                - Could just have an off-chain DB storing the ids and amounts and assigning them to a users 'Deck Collection'; This would introduce a 
                - Same checks would apply; Using checkKeccak() to verify the users deck hash and ids/amounts are correct and available 
    

            -'Shuffle' the stored deck IDs and output a hash; FE will submit this hash on-chain for provability


            - Maybe have a 'global' deck ID, incrementing each time a user creates a deck. This will be useful for querying from the subgraph,
                - Would need to check for exact hash already set                           as the users personal index could change due to user 
                 (I.E same exact deck ids and amounts)                                        removing decks in future
                  and assign the deck accordingly                                                                             


    */

    uint256 deckSize = 60;

    address _erc1155 = address(0x2e234DAe75C793f67A35089C9d99245E1C58470b);

    error InsufficientBalance();
    error ZeroAmountInArray();
    error MsgSenderIsNotApprovedOrOwner();
    error ArrayLengthMismatch();
    error IncorrectDeckSize();

    event DeckCreated(address indexed _user, uint256[] indexed _ids, uint256[] indexed _amounts, bytes32 _hash);

    mapping(address => Deck[]) usersDecks;

// TODO: add more elements to the Deck struct. i.e wins/losses/price(?)
    struct Deck{
        bytes32 _hash;
    }

    function setDeckHashEvent(address _user, uint256[] calldata _ids, uint256[] calldata _amounts) public {
        bytes32 _hash = createhash(_user, _ids, _amounts);
        _checkArrayAmounts(_ids, _amounts);
        _setDeckhash(_hash);
        emit DeckCreated(_user, _ids, _amounts, _hash);
    }

    function setDeckHash(address _user, uint256[] calldata _ids, uint256[] calldata _amounts) public {
        bytes32 _hash = createhash(_user, _ids, _amounts);
        _checkArrayAmounts(_ids, _amounts);
        _setDeckhash(_hash);
    }

    function _checkArrayAmounts(uint256[] calldata _ids, uint256[] calldata _amounts) internal view{
        uint256 length = _ids.length;
        uint256 total;
        if(length != _amounts.length) revert ArrayLengthMismatch();
        
        for(uint256 i=0; i < length; i++){
            total += _amounts[i];
        }
        if(total != deckSize) revert IncorrectDeckSize();
    } 

    function _setDeckhash(bytes32 _hash) internal {
        Deck memory deck1337 = Deck(_hash);
        usersDecks[msg.sender].push(deck1337);
    }

    function checkKeccak(
        address _user, 
        uint256[] calldata _ids, 
        uint256[] calldata _amounts, 
        bytes32 _hash
    ) public view returns(bool) {
        checkUserBalance(_user, _ids, _amounts);
        if(keccak256(abi.encodePacked(_ids, _amounts)) != _hash) return false;
        return true;
    }

    function createhash(
        address _user, 
        uint256[] calldata _ids, 
        uint256[] calldata _amounts
    ) public view returns(bytes32){
        checkUserBalance(_user, _ids, _amounts);
        bytes32 _hash = keccak256(abi.encodePacked(_ids, _amounts));
        return _hash;
    }

    function checkUserBalance(
        address _user, 
        uint256[] calldata _ids, 
        uint256[] calldata _amounts
    ) public view returns(bool){
        ERC1155 erc1155 = ERC1155(_erc1155);

        for(uint256 i=0; i < _ids.length; i++){
            if(erc1155.balanceOf(_user, _ids[i]) < _amounts[i]) revert InsufficientBalance();
            if(_ids[i] == 0 || _amounts[i] == 0) revert ZeroAmountInArray();
        }

        return true;
    }

    function retrieveDeck(address _user, uint256 _index) public view returns(Deck memory){
        return usersDecks[_user][_index];
    }
}
