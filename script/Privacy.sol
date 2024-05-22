// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Privacy} from "../src/Privacy.sol";
import {Script, console} from "forge-std/Script.sol";

contract PrivacyScript is Script {
    Privacy public privacy;

    function run() public {
        console.log("Solving King...");
        //amoy polygon testnet
        privacy = Privacy(0x33b7fC4795b45240FC3C1AD6b088a3e49662eF17); //Instance getted from ethernaut deployment
    }
}

// forge script script/King.s.sol
// forge script script/King.s.sol --rpc-url $AMOY_RPC_URL --private-key $PRIVATE_KEY
// forge script script/King.s.sol --rpc-url $AMOY_RPC_URL --private-key $PRIVATE_KEY --broadcast
