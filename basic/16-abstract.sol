// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

// dao ru qi ta wen jian
import "./IUser.sol";

// ji cheng 
abstract contract absUser is IUser{
    //override reload
    /*function addUser(string memory _name, uint8 _age) override external {
        
    }*/
    function getUser(string memory _name) override external view returns (string memory, uint8) {
        
    }

}

contract User is absUser {
    function addUser(string memory _name, uint8 _age) override external {
        
    }
}

