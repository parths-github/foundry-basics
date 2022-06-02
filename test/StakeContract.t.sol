// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Stake.sol";
import "./mocks/MockERC20.sol";

contract StakeContractTest is Test {
    Stake public stakeContract;
    MockERC20 public token;
    uint256 public constant AMOUNT = 1e18;

    function setUp() public {
        stakeContract = new Stake();
        token = new MockERC20();
    }

    // Should e ale to stake 
    function testStakingToken() public {
        token.approve(address(stakeContract), AMOUNT);
        bool success = stakeContract.stake(AMOUNT, address(token));
        assertTrue(success);
    }

    // Fuzz test
    // Send random data to our function - if its uint8 - function will be called with different random values
    // In case of uint256 it will fail as uint256 is really high number and we have minted limited quantity in movkERC20
    // We can increase the number of time fuzz runs in .toml file
    function testFuzzStakingToken(uint16 _amount) public {
        token.approve(address(stakeContract), _amount);
        bool success = stakeContract.stake(_amount, address(token));
        assertTrue(success);
    }

    // function testShouldBeReverted() public {
    //     // Same in require statement, you can use "vm.expectRevert(<Rquire Error>)"
    //     vm.expectRevert(MockERC20.AddressCantBeZero.selector);
    //     new MockERC20(address(0));
    // }

    // To change the msg.sender - "vm.startPrank(AddressOfOwnerToBe)" and to stop it - "vm.stopPrank()"
    // vm.label(variableName, "String"); => If variable is addresss then in trace it will print the address so to print the name instead you label it with desired string value
}
