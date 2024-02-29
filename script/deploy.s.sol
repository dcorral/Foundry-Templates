// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/MyNFT.sol";

contract Deploy is Script {
    MyNFT co;
    function run() public {
        uint256 pk = vm.envUint("DEV_PRIVATE_KEY");

        vm.startBroadcast(pk);
        co = new MyNFT();
        vm.stopBroadcast();
    }
}
