// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import "forge-std/Test.sol";
import "../src/MyNFT.sol";
import "../src/MyNFTV2.sol";

contract Upgrade is Test {
    MyNFT myNFT;
    MyNFTV2 myNFTv2;

    function setUp() public {}

    function testUpgrade() public {
        address adminAddress = address(1);
        vm.startPrank(adminAddress);

        address proxyAddress = Upgrades.deployUUPSProxy("MyNFT.sol", abi.encodeCall(MyNFT.initialize, (adminAddress)));
        myNFT = MyNFT(proxyAddress);

        string memory name = myNFT.name();
        assertEq(name, "MyNFT");

        uint256 tokenId = myNFT.tokenId();
        assertEq(tokenId, 0);

        myNFT.safeMint(address(1));
        assertEq(myNFT.ownerOf(myNFT.tokenId()), address(1));

        tokenId = myNFT.tokenId();
        assertEq(tokenId, 1);

        // Upgrade
        Upgrades.upgradeProxy(proxyAddress, "MyNFTV2.sol", "");
        console.log("Upgraded Proxy Address:", proxyAddress);

        tokenId = myNFT.tokenId();
        assertEq(tokenId, 1);

        myNFT.safeMint(address(1));
        assertEq(myNFT.ownerOf(myNFT.tokenId()), address(1));

        tokenId = myNFT.tokenId();
        assertEq(tokenId, 3);

        vm.stopPrank();
    }
}
