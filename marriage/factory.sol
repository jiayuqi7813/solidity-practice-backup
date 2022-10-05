pragma solidity^0.8.7;

import "./evidence.sol";

contract EvidenceFactory {
    
    mapping(string=>address) evi_keys;
    
    event NewEvidence(string  _evi, string _key, address _sender);
    
    
    function newMarriageEvidence(string memory _evi, string memory _key, address _a, address _b) public returns (address) {
        MarriageEvidence evidence = new MarriageEvidence(_evi, _a, _b);
        
        evi_keys[_key] = address(evidence);
        
        emit NewEvidence(_evi, _key, msg.sender);
        
        return address(evidence);
    }
    
    function getEvidence(string memory _key) public view returns (string memory, address[] memory, address[] memory) {
        address addr = evi_keys[_key];
        return MarriageEvidence(addr).getEvidence();
    }
    
    function sign(string memory _key) public returns (bool) {
        address addr = evi_keys[_key];
        return MarriageEvidence(addr).sign();
    }
    
    function isAllSigned(string memory _key) public view returns (bool, string memory) {
        address addr = evi_keys[_key];
        return MarriageEvidence(addr).isAllSigned();
    }
    
}