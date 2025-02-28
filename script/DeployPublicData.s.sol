// SPDX-License-Identifier : MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";
import {PublicDataStructures} from "../src/PublicDataStructures.sol";

contract DeployPublicData is Script {
    
    function run() external {
        vm.createSelectFork("local");
        vm.startBroadcast();
        new PublicDataStructures();
        vm.stopBroadcast();
    }
}