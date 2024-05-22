// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Privacy} from "../src/Privacy.sol";
import {Script, console} from "forge-std/Script.sol";

contract PrivacyScript is Script {
    Privacy public privacy;

    function run() public {
        console.log("Solving Privacy...");
        //amoy polygon testnet
        privacy = Privacy(0xB3772EaE4c35f3Ae4C778199Aa6c072cE9A50137); //Instance getted from ethernaut deployment
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("locked value before", privacy.locked());
        bytes32 storedPassword = vm.load(
            0xB3772EaE4c35f3Ae4C778199Aa6c072cE9A50137,
            bytes32(uint256(5)) // slot 3 + 2 pour accéder à la variable data[2]
        );
        console.log("storedPassword:");
        console.logBytes32(storedPassword);
        bytes16 key = bytes16(storedPassword);
        privacy.unlock(key);
        console.log("locked value after", privacy.locked());
        console.log("Privacy solved!");
        vm.stopBroadcast();
    }
}

// forge script script/Privacy.s.sol
// forge script script/Privacy.s.sol --rpc-url $AMOY_RPC_URL --private-key $PRIVATE_KEY
// forge script script/Privacy.s.sol --rpc-url $AMOY_RPC_URL --private-key $PRIVATE_KEY --broadcast
