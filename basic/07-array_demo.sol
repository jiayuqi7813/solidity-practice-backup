// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; //solidity<=0.8.7 && >= 0.6.0;

/*
    mames : ["zhangsan", "lisi", "yekai"]
    ages  : [20, 30, 40, 50, 60 ]
*/

contract array_demo {
    string[5] public names;
    uint8[] public ages;
    
    constructor() {
        names[0] = "zhangsan";
        names[1] = "lisi";
        names[2] = "yekai";
        
        // ages[0] = 20;
        //ages[1] = 30;
        ages.push(20);
    }
    
    function addAge(uint8 _age) public {
        ages.push(_age);
    }
    
    function getLength() public view returns (uint256, uint256) {
        return (names.length, ages.length);
    }
    
    /*function addName(string memory _name) public {
        names.push(_name);
    }*/
}