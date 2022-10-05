pragma solidity^0.8.7;

// define interface 
interface IEvdence {
    function verify(address _signer) external view returns (bool);
    function sign() external  returns(bool);
    function getEvidence() external view returns (string memory, address[] memory, address[] memory);
}

contract MarriageEvidence is IEvdence {
    // data define 
    string evidence;
    address[] needSigners;// nedd qian ming list 
    address[] signers;// qian guo ming list 
    
    //event define 
    event NewMarriageEvidence(string _evi, address _sender, address _a, address _b);
    event AddRepeatSignaturesEvidence(string _evi, address _sender);
    event AddSignaturesEvidence(string _evi, address _sender);
    

    // function 
    constructor(string memory _evi, address _a, address _b) {
        require(address(0) != _a, "_a is a invalid address");
        require(address(0) != _b, "_b is a invalid address");
        require(_a != tx.origin, "_a can not verifier");
        require(_b != tx.origin, "_b can not verifier");
        needSigners.push(tx.origin);
        needSigners.push(_a);
        needSigners.push(_b);
        signers.push(tx.origin);
        evidence = _evi;

        emit NewMarriageEvidence(_evi, tx.origin, _a, _b);
    }
    
    // query 
    function getEvidence() override external view returns (string memory, address[] memory, address[] memory) {
        
        return (evidence, needSigners, signers);
    }
    
    // sign 
    function sign() override external  returns(bool) {
        require(_verify(tx.origin), "_signer is not valid");
        if(isSigned(tx.origin)) {
            emit AddRepeatSignaturesEvidence(evidence, tx.origin);
            return true;
        }
        signers.push(tx.origin);
        emit AddSignaturesEvidence(evidence, tx.origin);
        return true;
    }
    
    function verify(address _signer) override external view returns (bool) {
        return _verify(_signer);
    }
    function _verify(address _signer) internal view returns (bool) {
        for(uint256 i = 0; i < needSigners.length; i ++) {
            if (needSigners[i] == _signer) {
                return true;
            }
        }
        
        return false;
    }
    
    // query is signed 
    function isSigned(address _signer) internal view returns (bool) {
        for(uint256 i = 0; i < signers.length; i ++) {
            if (signers[i] == _signer) {
                return true;
            }
        }
        
        return false;
    }
    
    function isAllSigned() public view returns (bool, string memory) {
        
        for(uint256 i = 0; i < needSigners.length; i ++) {
            if(!isSigned(needSigners[i])) {
                return (false, "");
            }
        }
        
        return (true, evidence);
    }
    
    
}
