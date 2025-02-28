// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Script.sol";
import "../src/PublicDataStructures.sol";

contract GetLastBidScript is Script {
    function run() external {
        vm.createSelectFork("arbitrum-sepolia");

        address contractAddress = vm.envAddress("CONTRACT_ADDRESS");

        PublicDataStructures target = PublicDataStructures(payable(contractAddress));

        Order memory lastBid = target.getLastBid();

        console.log("Last Bid Price:", lastBid.price);
        console.log("Last Bid Quantity:", lastBid.quantity);
    }
}