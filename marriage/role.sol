pragma solidity^0.8.7;

library Role{
    struct PersonRole{
        mapping(address=>bool) isExists;
        mapping(address=>string) summary;
    }

    function isRole(PersonRole storage _role,address _person ) internal view returns(bool){
        if(_person == address(0)){
            return false;
        }
        return _role.isExists[_person];
    }

    function addRole(PersonRole storage _role,address _person,string memory _summary) internal returns(bool){
        if(isRole(_role, _person)){
            return false;
        }
        _role.isExists[_person] = true;
        _role.summary[_person] = _summary;
        return true;
    }

    function removeRole(PersonRole storage _role,address _person) internal returns(bool){
        if(!isRole(_role, _person)){
            return false;
        }
        delete _role.isExists[_person];
        delete _role.summary[_person];
        return true;
    }

    function resetRole(PersonRole storage _role,address _person,string memory _summary) internal returns(bool){
        if(!isRole(_role, _person)){
            return false;
        }
        _role.summary[_person] = _summary;
        return true;

    }

}