// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {PackOpener} from "src/PackOpener.sol";
import "lib/forge-std/src/Test.sol";
import "lib/forge-std/src/Vm.sol";
import "lib/forge-std/src/console.sol";
import "lib/openzeppelin-contracts/contracts/mocks/ERC1155Mock.sol";

contract PackOpenerTest is Test{
    PackOpener pack;

    address public alice = address(0x1337);

    function setUp() public {
        pack = new PackOpener("URI");
        vm.startPrank(alice);
    }

    /*function testGasInitiateOneCardPackOpening() public {
        pack.initiatePackOpen(alice, 1);
    }

    function testGasInitiateTenCardPackOpening() public {
        pack.initiatePackOpen(alice, 1);
    }

    function testGasInitiateAndFulfillOneCardPackOpening() public {
        vm.roll(10000000);
        pack.initiatePackOpen(alice, 1);
        vm.roll(10000015);
        pack.fulfillInitiatedPackOpen(alice);
    }

    function testGasInitiateAndFullfillTenCardPackOpening() public {
        vm.roll(10000000);
        pack.initiatePackOpen(alice, 10);
        vm.roll(10000015);
        pack.fulfillInitiatedPackOpen(alice);
    }*/


    function testInitiatePackOpening() public {
        //vm.startPrank(alice);

        console.log(pack.packSize(alice));
        vm.roll(10000500);
        pack.initiatePackOpen(alice, 10);
        console.log(pack.userLocked(alice));
        console.log(pack.packSize(alice));
        console.log(pack.unlockBlock(alice));
        console.log(block.number);
        vm.roll(10000515);
        console.log(block.number);



        pack.fulfillInitiatedPackOpen(alice);
        //console.log(pack.packSize(alice));
        //assertEq(pack.packSize(alice), 12);
    }

    // Test 




}