// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

contract receive_demo {
    
    uint256 totalAmount;
    address[] public addrs;
    
    /*
    receive() external payable {
        totalAmount += msg.value;
        addrs.push(msg.sender);
    } */
    
    function getBalance() public view returns (uint256, uint256) {
        return (totalAmount, address(this).balance);
    }
    
    fallback() external payable {
        totalAmount += msg.value;
        addrs.push(msg.sender); 
    }
}