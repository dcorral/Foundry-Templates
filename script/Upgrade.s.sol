// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import "../src/MyNFTV2.sol";

contract Upgrade is Script {
    function run() public {
        address proxyAddress = vm.envAddress("PROXY_ADDRESS");
        uint256 sysAdminPK = vm.envUint("DEV_PRIVATE_KEY");

        vm.startBroadcast(sysAdminPK);

        // Upgrade the existing proxy to the new implementation
        Upgrades.upgradeProxy(proxyAddress, "MyNFTV2.sol", "");

        console.log("Upgraded Proxy Address:", proxyAddress);

        vm.stopBroadcast();
    }
}
