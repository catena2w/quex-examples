// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Script.sol";
import "../src/PublicDataStructures.sol"; // Adjust path based on your project structure

contract RequestScript is Script {
    function run() external {
        vm.createSelectFork("arbitrum-sepolia");
        uint256 privateKey = vm.envUint("SECRET"); // Load private key from env
        address contractAddress = vm.envAddress("CONTRACT_ADDRESS"); // Load contract address
        uint256 inputValue = vm.envUint("FLOW_ID"); // Load input value from env

        PublicDataStructures target = PublicDataStructures(payable(contractAddress));

        vm.startBroadcast(privateKey);
        target.request{value: 4000000000000000}(inputValue);
        vm.stopBroadcast();
    }
}