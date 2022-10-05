// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; //solidity<=0.8.7 && >= 0.6.0;

contract func_demo {
    
    function getSum() public view returns (uint256 ) {
        uint256 sum = 0;
        //for(init;cond;post)
        for(uint256 i = 1; i <= 100; i ++) {
            sum += i;
        }
        
        return sum;
    }
    
    function getSum2() public view returns (uint256 sum) {
        //for(init;cond;post)
        uint256 i = 0;
        while(i <= 100) {
            sum += i;
            i ++;
        }
        
        //return sum;
    }
    
    function isEqual(string memory a, string memory b) public view returns (bool) {
        //return a == b;
        // hash(a) == hash(b)  ==>  a == b?
        bytes32 hashA = keccak256(abi.encode(a));
        bytes32 hashB = keccak256(abi.encode(b));
        return hashA == hashB;
    }
}