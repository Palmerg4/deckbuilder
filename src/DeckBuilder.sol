// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC1155} from "lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";

contract DeckBuilder {
    ERC1155 erc1155;

    address _erc1155 = address(0x2e234DAe75C793f67A35089C9d99245E1C58470b);

    error InsufficientBalance();
    error ZeroAmountInArray();

    // Store user deck ID input

    // Retrieve stored deck IDs

    // 'Shuffle' the stored deck IDs and output a ZK hash



    mapping(address => Deck[]) usersDecks;
    mapping(address => Deck1[]) usersDeck1s;

    struct Deck1{
        bytes32 merkleRoot;
    }

    struct Deck{
        uint256[] ids;
        uint256[] amounts;
    }

    function setDeckMemory(uint256[] memory _ids, uint256[] memory _amounts) public {
        Deck memory deck1 = Deck(_ids, _amounts);
        usersDecks[msg.sender].push(deck1);
    }

    function setDeckCalldata(uint256[] calldata _ids, uint256[] calldata _amounts) public {
        Deck memory deck2 = Deck(_ids, _amounts);
        usersDecks[msg.sender].push(deck2);

    }

    function setDeckRootCalldata(uint256[] calldata _ids, uint256[] calldata _amounts) public {
        bytes32 root = createRoot(_ids, _amounts);
        Deck1 memory deck1337 = Deck1(root);
        usersDeck1s[msg.sender].push(deck1337);
    }

    function setDeckRoot(bytes32 _merkleRoot) public {
        Deck1 memory deck1337 = Deck1(_merkleRoot);
        usersDeck1s[msg.sender].push(deck1337);
    }

    function checkKeccak(uint256[] calldata _ids, uint256[] calldata _amounts, bytes32 _merkleRoot) public view returns(bool) {



        /*for(uint256 i=0; i < _ids.length; ++i){
            if(erc1155(_erc1155).balanceOf(msg.sender, _ids[i]) < _amounts[i]) revert InsufficientBalance();
        }*/

        if(keccak256(abi.encodePacked(_ids, _amounts)) != _merkleRoot) return false;
        return true;
    }

    function createRoot(uint256[] calldata _ids, uint256[] calldata _amounts) public view returns(bytes32){

        ERC1155 erc1155 = ERC1155(_erc1155);

        for(uint256 i=0; i < _ids.length; i++){
            if(erc1155.balanceOf(msg.sender, _ids[i]) < _amounts[i]) revert InsufficientBalance();
            if(_ids[i] == 0 || _amounts[i] == 0) revert ZeroAmountInArray();
        }

        bytes32 root = keccak256(abi.encodePacked(_ids, _amounts));

        return root;
    }

    function retrieveDecks(address _user) public {

    }




}