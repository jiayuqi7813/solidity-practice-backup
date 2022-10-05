pragma solidity^0.8.7;

contract Goods{
    struct TraceData{
        address operator;
        uint8 status; // 0: created, 1: in transit, 2: uploadd 3.consumer
        uint256 timestamp;
        string remark;
    }
    uint256 goodsID;
    uint8 currentStatus;
    TraceData[] traceDatas;
    uint8 constant STATUS_CREATE = 0;

    event NewStatus(address _operator, uint8 _status, uint256 _timestamp, string _remark);

    constructor(uint256 _goodID){
        goodsID = _goodID;
        traceDatas.push(TraceData(msg.sender,STATUS_CREATE, block.timestamp, "create"));
        currentStatus = STATUS_CREATE;
        emit NewStatus(msg.sender, STATUS_CREATE, block.timestamp, "create");
    }

    function changeStatus(uint8 _status, string memory _remark) public returns (bool){
        currentStatus = _status;
        traceDatas.push(TraceData(msg.sender, _status, block.timestamp, _remark));
        emit NewStatus(msg.sender, _status, block.timestamp, _remark);
        return true;
    }

    function getStatus() public view returns (uint8){
        return currentStatus;
    }

    function getTranceInfo() public view returns (TraceData[] memory){
        return traceDatas;
    }

}