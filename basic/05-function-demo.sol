// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; //solidity<=0.8.7 && >= 0.6.0;

contract func_demo2 {
    uint256 count;
    
    constructor(uint256 _c) {
        count = _c;
    }
    
    function setCount(uint256 _c) public {
        count = _c;
    }
    
    function getCount() external view returns (uint256) {
        return count;
    }
    
    function deposit() external payable {
        
    }
    
    function isEqual(string memory a, string memory b) private pure returns (bool) {
        //return a == b;
        // hash(a) == hash(b)  ==>  a == b?
        bytes32 hashA = keccak256(abi.encode(a));
        bytes32 hashB = keccak256(abi.encode(b));
        return hashA == hashB;
    } 
}