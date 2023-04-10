// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";


contract PackOpener is ERC1155{

    error IncorrectMsgValueForDesiredNumberOfPacks();
    error UnauthorizedUser();
    error UserQuedOpeningLocked();
    error DesiredPackSizeTooGreat();
    error UserHasNotInitiatedPackOpen();
    error UnlockBlocked();

    uint256 public cost;
    uint256 public blockLock = 12;
    uint256 public maxPackSize = 100;
    uint256 public setSize = 100;

//  User => Unlock Block
    mapping(address => UserLimbo) public quedByUser;

    mapping(address => uint256) public packSize;
    mapping(address => uint256) public unlockBlock;

    struct UserLimbo{
        uint256 unlockBlock;
        uint256 packSize;
        bool locked;
    }

    constructor(string memory uri_)ERC1155("uri_"){}



    /* Function to initiate a pack openeing
        - Take in a number from user > 15(?) and < 25(?) 
          This is the block number the user will be able to 
          open the pack
            - Maybe just always have a 15 block timelock??
                Would this be exploitable?
            - Maybe have this optional - other option is using chainlink VRF
                - UX difference: 
                    - either pay for immediate pack openeing (Chainlink VRF)
                    - Or dont pay and wait 15 ish blocks (Non-chainlink VRF)
        - Maybe have a user specified pack size
            - Have a minimum 
            - Higher pack size will take longer to unlock, due to randomness coming from blocks
                needing to be different for each card
            - Minimum pack size is 12(?) taking 12 blocks to unlock 

    */

    function initiatePackOpen(
        address _user,
        uint256 _packSize
    ) public payable {
        if(msg.value < cost * _packSize) revert IncorrectMsgValueForDesiredNumberOfPacks();
        if(_user != msg.sender) revert UnauthorizedUser();
        if(quedByUser[_user].locked) revert UserQuedOpeningLocked();
        if(_packSize > maxPackSize) revert DesiredPackSizeTooGreat();

        quedByUser[_user] = UserLimbo(block.number + blockLock, _packSize, true);
        packSize[_user] = _packSize;
        unlockBlock[_user] = block.number + blockLock;

        // Transfer funds to contract/treasury
    }

    function fulfillInitiatedPackOpen(
        address _user
    ) public {
        if(_user != msg.sender) revert UnauthorizedUser();
        if(!quedByUser[msg.sender].locked) revert UserHasNotInitiatedPackOpen();
        if(block.number - 1 < quedByUser[msg.sender].unlockBlock) revert UnlockBlocked();

        uint256 packSize = quedByUser[msg.sender].packSize;
        _mintBatch(_user, _randomnessLoop(packSize), _notRandomnessLoop(packSize), "");

        quedByUser[msg.sender].locked = false;
    }

    function _notRandomnessLoop(
        uint256 _packSize
    ) internal pure returns(uint256[] memory) {
        uint256[] memory packAmounts = new uint256[](_packSize);
        for(uint256 i = 0; i < _packSize; ++i){
            packAmounts[i] = 1;
        }
        return packAmounts;
    }

    function _randomnessLoop(
        uint256 _packSize
    ) internal view returns(uint256[] memory) {
        uint256[] memory packIds = new uint256[](_packSize);
        for(uint256 i = 0; i < _packSize; ++i){
            packIds[i] = uint256(keccak256(abi.encodePacked(blockhash(quedByUser[msg.sender].unlockBlock - i)))) % setSize;
        }

        return packIds;
    }
}