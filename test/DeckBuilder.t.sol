// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {DeckBuilder} from "src/DeckBuilder.sol";
import "lib/forge-std/src/Test.sol";
import "lib/forge-std/src/Vm.sol";
import "lib/forge-std/src/console.sol";
import "lib/openzeppelin-contracts/contracts/mocks/ERC1155Mock.sol";

contract DeckBuilderTest is Test{
    DeckBuilder deckbuilder;
    ERC1155Mock erc1155;

    address public alice = address(0x1337);

    function setUp() public {

        uint256[] memory ids = new uint256[](40);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;
        ids[5] = 6;
        ids[6] = 7;
        ids[7] = 8;
        ids[8] = 9;
        ids[9] = 10;
        ids[10] = 11;
        ids[11] = 12;
        ids[12] = 13;
        ids[13] = 14;
        ids[14] = 15;
        ids[15] = 16;
        ids[16] = 17;
        ids[17] = 18;
        ids[18] = 19;
        ids[19] = 20;
        ids[20] = 21;
        ids[21] = 22;
        ids[22] = 23;
        ids[23] = 24;
        ids[24] = 25;
        ids[25] = 26;
        ids[26] = 27;
        ids[27] = 28;
        ids[28] = 29;
        ids[29] = 30;
        ids[30] = 31;
        ids[31] = 32;
        ids[32] = 33;
        ids[33] = 34;
        ids[34] = 35;
        ids[35] = 36;
        ids[36] = 37;
        ids[37] = 38;
        ids[38] = 39;
        ids[39] = 40;


        uint256[] memory amounts = new uint256[](40);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;
        amounts[5] = 4;
        amounts[6] = 4;
        amounts[7] = 4;
        amounts[8] = 4;
        amounts[9] = 4;
        amounts[10] = 4;
        amounts[11] = 4;
        amounts[12] = 4;
        amounts[13] = 4;
        amounts[14] = 4;
        amounts[15] = 4;
        amounts[16] = 4;
        amounts[17] = 4;
        amounts[18] = 4;
        amounts[19] = 4;
        amounts[20] = 4;
        amounts[21] = 4;
        amounts[22] = 4;
        amounts[23] = 4;
        amounts[24] = 4;
        amounts[25] = 4;
        amounts[26] = 4;
        amounts[27] = 4;
        amounts[28] = 4;
        amounts[29] = 4;
        amounts[30] = 4;
        amounts[31] = 4;
        amounts[32] = 4;
        amounts[33] = 4;
        amounts[34] = 4;
        amounts[35] = 4;
        amounts[36] = 4;
        amounts[37] = 4;
        amounts[38] = 4;
        amounts[39] = 4;

        deckbuilder = new DeckBuilder();
        erc1155 = new ERC1155Mock("URI");
        erc1155.mintBatch(alice, ids, amounts, "");
        console.log(address(erc1155));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
    }

    function testSetDeckRootCalldata() public {
        vm.startPrank(alice);

        uint256[] memory ids = new uint256[](60);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;
        ids[5] = 6;
        ids[6] = 7;
        ids[7] = 8;
        ids[8] = 9;
        ids[9] = 10;
        ids[10] = 11;
        ids[11] = 12;
        ids[12] = 13;
        ids[13] = 14;
        ids[14] = 15;
        ids[15] = 16;
        ids[16] = 17;
        ids[17] = 18;
        ids[18] = 19;
        ids[19] = 20;
        ids[20] = 21;
        ids[21] = 22;
        ids[22] = 23;
        ids[23] = 24;
        ids[24] = 25;
        ids[25] = 26;
        ids[26] = 27;
        ids[27] = 28;
        ids[28] = 29;
        ids[29] = 30;
        ids[30] = 31;
        ids[31] = 32;
        ids[32] = 33;
        ids[33] = 34;
        ids[34] = 35;
        ids[35] = 36;
        ids[36] = 37;
        ids[37] = 38;
        ids[38] = 39;
        ids[39] = 40;

        uint256[] memory amounts = new uint256[](60);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;
        amounts[5] = 4;
        amounts[6] = 4;
        amounts[7] = 4;
        amounts[8] = 4;
        amounts[9] = 4;
        amounts[10] = 4;
        amounts[11] = 4;
        amounts[12] = 4;
        amounts[13] = 4;
        amounts[14] = 4;
        amounts[15] = 4;
        amounts[16] = 4;
        amounts[17] = 4;
        amounts[18] = 4;
        amounts[19] = 4;
        amounts[20] = 4;
        amounts[21] = 4;
        amounts[22] = 4;
        amounts[23] = 4;
        amounts[24] = 4;
        amounts[25] = 4;
        amounts[26] = 4;
        amounts[27] = 4;
        amounts[28] = 4;
        amounts[29] = 4;
        amounts[30] = 4;
        amounts[31] = 4;
        amounts[32] = 4;
        amounts[33] = 4;
        amounts[34] = 4;
        amounts[35] = 4;
        amounts[36] = 4;
        amounts[37] = 4;
        amounts[38] = 4;
        amounts[39] = 4;

        

        deckbuilder.setDeckRootCalldata(ids, amounts);

    }

    function testSetDeckRootCalldata1() public {
        vm.startPrank(alice);

        uint256[] memory ids = new uint256[](60);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;
        ids[5] = 6;
        ids[6] = 7;
        ids[7] = 8;
        ids[8] = 9;
        ids[9] = 10;
        ids[10] = 11;
        ids[11] = 12;
        ids[12] = 13;
        ids[13] = 14;
        ids[14] = 15;
        ids[15] = 16;
        ids[16] = 17;
        ids[17] = 18;
        ids[18] = 19;
        ids[19] = 20;
        ids[20] = 21;
        ids[21] = 22;
        ids[22] = 23;
        ids[23] = 24;
        ids[24] = 25;
        ids[25] = 26;
        ids[26] = 27;
        ids[27] = 28;
        ids[28] = 29;
        ids[29] = 30;
        ids[30] = 31;
        ids[31] = 32;
        ids[32] = 33;
        ids[33] = 34;
        ids[34] = 35;
        ids[35] = 36;
        ids[36] = 37;
        ids[37] = 38;
        ids[38] = 39;
        ids[39] = 40;

        uint256[] memory amounts = new uint256[](60);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;
        amounts[5] = 4;
        amounts[6] = 4;
        amounts[7] = 4;
        amounts[8] = 4;
        amounts[9] = 4;
        amounts[10] = 4;
        amounts[11] = 4;
        amounts[12] = 4;
        amounts[13] = 4;
        amounts[14] = 4;
        amounts[15] = 4;
        amounts[16] = 4;
        amounts[17] = 4;
        amounts[18] = 4;
        amounts[19] = 4;
        amounts[20] = 4;
        amounts[21] = 4;
        amounts[22] = 4;
        amounts[23] = 4;
        amounts[24] = 4;
        amounts[25] = 4;
        amounts[26] = 4;
        amounts[27] = 4;
        amounts[28] = 4;
        amounts[29] = 4;
        amounts[30] = 4;
        amounts[31] = 4;
        amounts[32] = 4;
        amounts[33] = 4;
        amounts[34] = 4;
        amounts[35] = 4;
        amounts[36] = 4;
        amounts[37] = 4;
        amounts[38] = 4;
        amounts[39] = 4;

        uint256[] memory ids1 = new uint256[](60);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;
        ids[5] = 6;
        ids[6] = 7;
        ids[7] = 8;
        ids[8] = 9;
        ids[9] = 10;
        ids[10] = 11;
        ids[11] = 12;
        ids[12] = 13;
        ids[13] = 14;
        ids[14] = 15;
        ids[15] = 16;
        ids[16] = 17;
        ids[17] = 18;
        ids[18] = 19;
        ids[19] = 20;
        ids[20] = 21;
        ids[21] = 22;
        ids[22] = 23;
        ids[23] = 24;
        ids[24] = 25;
        ids[25] = 26;
        ids[26] = 27;
        ids[27] = 28;
        ids[28] = 29;
        ids[29] = 30;
        ids[30] = 31;
        ids[31] = 32;
        ids[32] = 33;
        ids[33] = 34;
        ids[34] = 35;
        ids[35] = 36;
        ids[36] = 37;
        ids[37] = 38;
        ids[38] = 39;
        ids[39] = 40;

        uint256[] memory amounts1 = new uint256[](60);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;
        amounts[5] = 4;
        amounts[6] = 4;
        amounts[7] = 4;
        amounts[8] = 4;
        amounts[9] = 4;
        amounts[10] = 4;
        amounts[11] = 4;
        amounts[12] = 4;
        amounts[13] = 4;
        amounts[14] = 4;
        amounts[15] = 4;
        amounts[16] = 4;
        amounts[17] = 4;
        amounts[18] = 4;
        amounts[19] = 4;
        amounts[20] = 4;
        amounts[21] = 4;
        amounts[22] = 4;
        amounts[23] = 4;
        amounts[24] = 4;
        amounts[25] = 4;
        amounts[26] = 4;
        amounts[27] = 4;
        amounts[28] = 4;
        amounts[29] = 4;
        amounts[30] = 4;
        amounts[31] = 4;
        amounts[32] = 4;
        amounts[33] = 4;
        amounts[34] = 4;
        amounts[35] = 4;
        amounts[36] = 4;
        amounts[37] = 4;
        amounts[38] = 4;
        amounts[39] = 4;

        

        deckbuilder.setDeckRootCalldata(ids, amounts);
        deckbuilder.setDeckRootCalldata(ids1, amounts1);

    }

    function testCreateRoot() public {

        vm.startPrank(alice);

        uint256[] memory ids = new uint256[](5);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;

        uint256[] memory amounts = new uint256[](5);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;

        deckbuilder.createRoot(ids, amounts);
        

        //assertEq(deckbuilder.createRoot(ids, amounts), keccak256(abi.encodePacked(ids, amounts)));
    }

    function testMerkleDeck() public {
        deckbuilder.setDeckRoot(bytes32(0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00));
    }

    function testCalldata() public {

        uint256[] memory ids = new uint256[](5);
        

        uint256[] memory amounts = new uint256[](60);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;
        amounts[5] = 4;
        amounts[6] = 4;
        amounts[7] = 4;
        amounts[8] = 4;
        amounts[9] = 4;
        amounts[10] = 4;
        amounts[11] = 4;
        amounts[12] = 4;
        amounts[13] = 4;
        amounts[14] = 4;
        amounts[15] = 4;
        amounts[16] = 4;
        amounts[17] = 4;
        amounts[18] = 4;
        amounts[19] = 4;
        amounts[20] = 4;
        amounts[21] = 4;
        amounts[22] = 4;
        amounts[23] = 4;
        amounts[24] = 4;

        deckbuilder.setDeckCalldata(ids, amounts);


    }
    function testMemory() public {
        uint256[] memory ids = new uint256[](60);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;

        uint256[] memory amounts = new uint256[](60);
        amounts[0] = 4;
        amounts[1] = 4;
        amounts[2] = 4;
        amounts[3] = 4;
        amounts[4] = 4;

        deckbuilder.setDeckMemory(ids, amounts);


    }
}