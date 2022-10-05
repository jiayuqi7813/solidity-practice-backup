pragma solidity^0.8.7;

import "./role.sol";

contract Character {
    using Role for Role.PersonRole;
    
    Role.PersonRole characters;
    address[] allCharacters; //[1,2,3,4,5] - [3] => ([1,2,4,5]) ([1,2,5,4])
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can do");
        _;
    }
    
    function isCharacter(address _person) public view returns (bool) {
        return characters.isRole(_person);
    }
    
    function addCharacter(address _person, string memory _summary) public onlyOwner returns (bool) {
        bool ok = characters.addRole(_person, _summary);
        require(ok, "add role failed");
        allCharacters.push(_person);
        return true;
    }
    
    function removeCharacter(address _person) public onlyOwner returns (bool) {
        bool ok = characters.removeRole(_person);
        require(ok, "remove role failed");
        // delete arrary[]
        uint256 index = 0;
        for(; index < allCharacters.length; index ++) {
            if(_person == allCharacters[index]) {
                break;
            }
        }
        
        if(index < allCharacters.length - 1) {
            allCharacters[index] = allCharacters[allCharacters.length - 1];
            allCharacters.pop();
        } else if (index == allCharacters.length - 1) {
            allCharacters.pop();
        }
        
        
        return true;
    }
    
    function resetCharacter(address _person, string memory _summary) public onlyOwner returns (bool) {
        bool ok = characters.resetRole(_person, _summary);
        require(ok, "reset role failed");
        
        return true;
    }
    
}