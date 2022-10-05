// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; //solidity<=0.8.7 && >= 0.6.0;

contract hello {
    string public hellomsg;
    uint256[] datas;
    
    constructor(string memory _msg)  {
        hellomsg = _msg;
    }
    
}