pragma solidity^0.8.7;

import "./factory.sol";
import "./character.sol";

contract Marriage is Character {
    EvidenceFactory eviFactory;
    
    constructor() {
        
        addCharacter(msg.sender, "witness1");
        eviFactory = new EvidenceFactory();
    }
    
    //ban fa zheng shu 
    function newMarriageEvidence(string memory _evi, string memory _key, address _a, address _b) public {
        require(isCharacter(msg.sender), "sender is not witness");
        eviFactory.newMarriageEvidence(_evi, _key, _a, _b);
    }
    
    // qian ming 
    function sign(string memory _key) public returns (bool) {
        return eviFactory.sign(_key);
    }
    
    // get 
    function getEvidence(string memory _key) public view returns (string memory, address[] memory, address[] memory) {
        return eviFactory.getEvidence(_key);
    }
    
    function isAllSigned(string memory _key) public view returns (bool, string memory) {
        return eviFactory.isAllSigned(_key);
    }
}