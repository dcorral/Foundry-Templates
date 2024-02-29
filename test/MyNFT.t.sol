// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT public myNFT;
    address minterAddress;

    error NotOwner();

    // Setup function - Runs before each test
    function setUp() public {
        minterAddress = address(3);
        vm.prank(minterAddress);
        myNFT = new MyNFT(minterAddress);
    }

    // --- Tests start here ---

    function testConstructor() public {
        assertEq(myNFT.name(), "MyNFT");
        assertEq(myNFT.symbol(), "MNFT");
    }

    function testMintNFT() public {
        address testAccount = address(0x1); // Sample address for testing

        // Mint an NFT to the test account
        vm.prank(minterAddress);
        myNFT.safeMint(testAccount);

        // Assert that the NFT is owned by the test account
        assertEq(myNFT.ownerOf(0), testAccount);  // Assuming tokenId is 1
    }

    function testMintOnlyOwner() public {
        // Attempt to mint from a non-owner account (make this address different from the owner)
        address nonOwnerAccount = address(0x2);
        vm.prank(nonOwnerAccount);

        // Expect the safeMint transaction to revert
        vm.expectRevert(NotOwner.selector);
        myNFT.safeMint(nonOwnerAccount);
    }
}
