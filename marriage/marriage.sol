pragma solidity^0.8.7;

import "./character.sol";
import "./factory.sol";

contract Marriage is Character{
    EvidenceFactory eviFactory;
    constructor(address _eviFactory) Character(){
        addCharacter(msg.sender,"witness1");
        eviFactory = EvidenceFactory(_eviFactory);
    }
    //颁发结婚证
    function newMarriageEvidence(string memory _evi,string memory _key,address _a,address _b) public returns(address){
        require(isCharacter(msg.sender),"sender is not a witness");
        eviFactory.newMarriageEvidence(_evi, _key, _a, _b);
    }

    //签名
    function sign(string memory _key) public returns(bool){
        eviFactory.sign(_key);
        return true;
    }

    function getEvidence(string memory _key) public view returns(string memory, address[] memory, address[] memory){
        return eviFactory.getEvidence(_key);
    }


}

