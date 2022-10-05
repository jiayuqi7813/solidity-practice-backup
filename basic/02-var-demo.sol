// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; //solidity<=0.8.7 && >= 0.6.0;

contract var_demo {
    // 作者姓名  world state 
    string public authorName;
    uint8 public authorAge;
    bytes32 public authorHash; 
    uint256 authorSal;
    
    // gou zao han shu 
    constructor(string memory _name, uint8 _age, uint256 _sal) {
        authorName = _name;
        authorAge  = _age;
        authorSal  = _sal;
        //hash code 
        authorHash = keccak256(abi.encode(_name, _age, _sal));
    }
}