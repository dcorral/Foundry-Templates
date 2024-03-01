// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT myNFT;
    address deployer;

    function setUp() public {
        deployer = address(0x3);
        myNFT = new MyNFT();
        myNFT.initialize(deployer);
    }

    function testSafeMint() public {
        vm.startPrank(deployer);

        uint256 initialTokenId = myNFT.tokenId();

        address reciever = address(0x1);
        myNFT.safeMint(reciever);

        uint256 newTokenId = myNFT.tokenId();
        assertEq(newTokenId, initialTokenId + 1, "Token ID did not increment correctly");

        address ownerOfNewToken = myNFT.ownerOf(newTokenId);
        assertEq(ownerOfNewToken, reciever, "Deployer is not the owner of the minted token");

        vm.stopPrank();
    }
}

