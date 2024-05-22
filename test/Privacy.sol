// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Privacy} from "../src/Privacy.sol";

contract PrivacyTest is Test {
    Privacy public privacy;

    function setUp() public {
        privacy = new Privacy([bytes32("fzf"), bytes32(0), bytes32(0)]);
    }
}
