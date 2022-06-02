// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ABC {
    uint256 public number;

    function setNumber(uint256 _newNumber) public {
        number = _newNumber;
    }
}
