// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

library libstring {
    function isEqual(string memory a, string memory b) internal pure returns (bool) {
        //return a == b;
        // hash(a) == hash(b)  ==>  a == b?
        bytes32 hashA = keccak256(abi.encode(a));
        bytes32 hashB = keccak256(abi.encode(b));
        return hashA == hashB;
    }
}