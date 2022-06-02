// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {

    error AddressCantBeZero();
    constructor(/**address _user */) ERC20("MyToken", "MT") {
        // if(_user == address(0)) revert AddressCantBeZero();
        _mint(msg.sender, 100e18);
    }
}