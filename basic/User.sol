// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

// dao ru qi ta wen jian
import "./IUser.sol";
import "./11-require.sol";

// ji cheng 
contract User is IUser, money_demo(msg.sender) {
    //override reload
    function addUser(string memory _name, uint8 _age) override external {
        
    }
    function getUser(string memory _name) override external view returns (string memory, uint8) {
        
    }

}