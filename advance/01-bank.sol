// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;
/*
    1. 3 ability 
    2. bank name 
    3. zhang ben jian ce 
*/

contract bank_demo {
    string public bankName; // name 
    uint256 totalAmount;    // cun kuan shu liang 
    address public admin;
    mapping(address=>uint256) balances; // user's balance 
    constructor(string memory _name) {
        bankName = _name;
        admin    = msg.sender;
    }
    
    function getBalance() public view returns (uint256, uint256) {
        return (address(this).balance, totalAmount);
    }
    
    // cun kuan款 
    function deposit(uint256 _amount) public payable {
        require(_amount > 0, "amount must > 0");
        require(msg.value == _amount, "msg.value must equal amount");
        balances[msg.sender] += _amount;  // a += b; a= a + b;
        totalAmount += _amount;
        require(address(this).balance == totalAmount, "bank's balance must ok");
    }
    // ti xian 
    function withdraw(uint256 _amount) public payable {
        require(_amount > 0, "amount must > 0");
        require(balances[msg.sender] >= _amount, "user's balance not enough");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        totalAmount -= _amount;
        require(address(this).balance == totalAmount, "bank's balance must ok");
    }
    // from = msg.sender, to, value : from -= amount, to += amount
    function transfer(address _to, uint256 _amount) public {
        require(_amount > 0, "amount must > 0");
        require(address(0) != _to, "to address must valid");
        require(balances[msg.sender] >= _amount, "user's balance not enough");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        require(address(this).balance == totalAmount, "bank's balance must ok");
    }
    
    function balanceOf(address _who) public view returns (uint256) {
        return balances[_who];
    }
}

