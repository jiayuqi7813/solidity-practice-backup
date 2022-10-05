pragma solidity^0.8.7;

import "./role.sol";

contract Character{
    using Role for Role.PersonRole;
    Role.PersonRole character;
    address[] allCharacters; 
    address owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"only owner can do this");
        _;
    }

    function isCharacter(address _person) public view returns(bool){
        return character.isRole(_person);
    }

    function addCharacter(address _person,string memory _summary) public onlyOwner returns(bool){
        bool ok = character.addRole(_person, _summary);
        require(ok,"add character failed");
        allCharacters.push(_person);
        return true;

    }

    function removeCharacter(address _person) public onlyOwner returns(bool){
        bool ok = character.removeRole(_person);
        require(ok,"remove character failed");
        uint256 index = 0;
        for(;index<allCharacters.length;index++){
            if(_person == allCharacters[index]){
                break;
            }
        }
        if(index<allCharacters.length -1){
            allCharacters[index] = allCharacters[allCharacters.length -1]; 
            allCharacters.pop();
        }else{
            allCharacters.pop();
        }

        return true;
    }
    
    function resetCharacter(address _person,string memory _summary) public onlyOwner returns(bool){
        bool ok = character.resetRole(_person, _summary);
        require(ok,"reset character failed");
        return true;
    }


}