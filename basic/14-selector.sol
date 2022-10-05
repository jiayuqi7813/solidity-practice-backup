// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

// dao ru qi ta wen jian
import "./IUser.sol";

contract selector_demo {
    
    function getSelector() public pure returns (bytes32, bytes4, bytes4) {
        //addUser(string memory _name, uint8 _age)
        bytes32 hash;
        //hash = keccak256(abi.encode("addUser(string,uint8)"));
        hash = keccak256("addUser(string,uint8)");
        return (hash, bytes4(hash), IUser.addUser.selector);
    }
    
    function getInterfaceID() public pure returns (bytes4) {
        
        return IUser.addUser.selector ^ IUser.getUser.selector;
    }
}