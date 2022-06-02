// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    ABC public abc;

    function setUp() public {
        abc = new ABC();
    }

    function testExample() public {
        assertTrue(abc.number() == 0);

        abc.setNumber(108);

        assertTrue(abc.number() == 108);
    }
}
