// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

import "./libstring.sol";

contract library_demo {
    // xian use library 
    using libstring for string;
    
    // isEqual(string memory a, string memory b)
    
    function isMyEqual(string memory a, string memory b) public pure returns (bool) {
        return a.isEqual(b); // isEqual(a, b)
    }
}