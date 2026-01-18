// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    Token public token;

    function setUp() public {
        token = new Token();
    }

    function testMint() public {
        token.mint(address(this), 100);
        assertEq(token.balanceOf(address(this)), 100);
    }
}
