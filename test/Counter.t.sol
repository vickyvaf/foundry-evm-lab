// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_Decrement() public {
        counter.decrement();
        assertEq(counter.number(), -1);
    }

    function test_MultiplyByTwo() public {
        counter.multiplyByTwo();
        assertEq(counter.number(), 2);
    }

    function test_DivideByTwo() public {
        counter.divideByTwo();
        assertEq(counter.number(), 0);
    }

    function test_Reset() public {
        counter.reset();
        assertEq(counter.number(), 0);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
