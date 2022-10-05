// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract A {
    string  myname;
    
    function setName(string memory _name) public {
        myname = _name;
    }
    
    function getName() public view returns (string memory) {
        return myname;
    }
    
}

contract call_demo {
    A a;
    
    constructor(address addr) {
        a = A(addr);
    }
    
    function setName(string memory _name) public {
        a.setName(_name);
    }
    
    function getName() public view returns (string memory) {
        return a.getName();
    }
}