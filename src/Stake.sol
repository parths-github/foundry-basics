// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error StakeCotract_TransferFailed();

contract Stake {

    mapping(address => uint) public s_balances;

    function stake(uint256 _amount, address _token) public returns (bool) {
        s_balances[msg.sender] += _amount;
        bool success = IERC20(_token).transferFrom(msg.sender, address(this), _amount);
        if(!success) revert StakeCotract_TransferFailed();
        return success;
    }
}