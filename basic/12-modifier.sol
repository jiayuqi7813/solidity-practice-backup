// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

contract modifier_demo {
    address public admin;
    uint256 public amount;
    
    constructor() {
        admin = msg.sender;
        amount = 101;
    }
    
    modifier onlyadmin() {
        require(msg.sender == admin, "only admin can do");
        require(amount > 100, "amount must > 100");
        _;
    }
    
    function setCount(uint256 _amount) public onlyadmin {
        amount = _amount;
    }
}