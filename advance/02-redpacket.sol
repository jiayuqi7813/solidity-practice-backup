// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

/*
    1. sendpacket : Type (avg = true, rand)
    2. stakepacket 
*/


contract redpacket {
    bool public rType;
    uint8 public rCount;
    uint256 public rTotalAmount;
    address payable public tuhao;
    mapping(address=>bool) isStake;
    
    constructor(bool isAvg, uint8 _count, uint256 _amount) payable {
        rType = isAvg;
        rCount = _count;
        rTotalAmount = _amount;
        tuhao = payable(msg.sender);
        require(_amount == msg.value, "redpacket's balance is ok");
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    // 抢红包 
    function stakePacket() public payable {
        require(rCount > 0, "red packet must left");
        require(getBalance() > 0, "contratc's balance must enough");
        require(!isStake[msg.sender], "user already stake");
        
        isStake[msg.sender] = true;
        if(rType) {
            // deng zhi 
            uint256 amount = getBalance() / rCount;
            payable(msg.sender).transfer(amount);
            
        } else {
            // rand 
            if (rCount == 1) {
                payable(msg.sender).transfer(getBalance());
            } else {
                uint256 randnum = uint256(keccak256(abi.encode(tuhao, rTotalAmount, rCount, block.timestamp, msg.sender))) % 10;
            
                uint256 amount = getBalance() * randnum / 10 ;
            
                payable(msg.sender).transfer(amount);
            }
            
            
        }
        rCount --;
    }
    
    function kill() public payable {
        selfdestruct(tuhao);
    }
    
}