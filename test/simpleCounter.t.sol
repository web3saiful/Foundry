// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test,console} from "forge-std/Test.sol";
import{stdError} from "forge-std/stdError.sol";
import {SimpleCounter} from "../src/SimpleCounter.sol";

contract CounterTest is Test {
    SimpleCounter public counter;

    function setUp() public {
        counter = new SimpleCounter();
        counter.setCount(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.getCount(), 1);
    }

    function testFuzz_SetCount(uint256 x) public {
        counter.setCount(x);
        assertEq(counter.count(), x);
    }

    function testRevert_Decrement()public{
        counter.setCount(0);
        vm.expectRevert(bytes("Underflow"));
        counter.decrement();
    }
}
