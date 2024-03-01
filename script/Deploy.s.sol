// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import "../src/MyNFT.sol";

contract Deploy is Script {
    MyNFT co;

    function run() public {
        uint256 sysAdminPK = vm.envUint("DEV_PRIVATE_KEY");
        address sysAdminAddress = vm.addr(sysAdminPK);

        vm.startBroadcast(sysAdminPK);

        address proxy = Upgrades.deployUUPSProxy(
            "MyNFT.sol", abi.encodeCall(MyNFT.initialize, (sysAdminAddress))
        );
        console.log(proxy);

        vm.stopBroadcast();
    }
}
