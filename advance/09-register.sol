// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

struct ContractInfo {
    address builder;
    address crtAddr;
    string  version;
}

contract register_demo {
    
    mapping(string=>ContractInfo) contracts;
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function addContract(string memory _nameKey, address _addr, string memory _ver) public {
        if(contracts[_nameKey].crtAddr == address(0)) {
            contracts[_nameKey].builder = msg.sender;
            contracts[_nameKey].crtAddr = _addr;
            contracts[_nameKey].version = _ver;
        } else {
            contracts[_nameKey].crtAddr = _addr;
            contracts[_nameKey].version = _ver;
        }
    }
    
    function getInfo(string memory _nameKey) public view returns (ContractInfo memory) {
        return contracts[_nameKey];
    }
}