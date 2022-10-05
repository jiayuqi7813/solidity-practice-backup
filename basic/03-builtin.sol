// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; //solidity<=0.8.7 && >= 0.6.0;

contract builtin_demo {
    address public admin;
    bytes32 public hash;
    uint256 public random;
    
    constructor() {
        admin = msg.sender;
        hash = blockhash(0);
        random = uint256(keccak256(abi.encode(block.timestamp, admin, hash))) % 100;
    }
}