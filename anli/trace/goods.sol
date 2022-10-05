pragma solidity^0.8.7;

contract Goods {
    struct TraceData {
        address operator;
        uint8   status; // {0 - create, 1 - transfer , 2 - upload, 3 - consumer}
        uint256 timestamp;
        string  remark;
    }
    uint256 goodsID;
    uint8   currentStatus;
    TraceData[] traceDatas;
    uint8 constant STATUS_CREATE = 0;
    uint8 constant STATUS_INVALID = 255;
    
    event NewStatus(address _operator, uint8 _status, uint256 _time, string _remark);
    
    constructor(uint256 _goodsID) {
        goodsID = _goodsID;
        traceDatas.push(TraceData(tx.origin, STATUS_CREATE, block.timestamp, "create"));
        currentStatus = STATUS_CREATE;
        emit NewStatus(tx.origin, STATUS_CREATE, block.timestamp, "create");
    }
    
    function changeStatus(uint8 _status, string memory _remark) public returns (bool) {
        currentStatus = _status;
        traceDatas.push(TraceData(tx.origin, _status, block.timestamp, _remark));
        emit NewStatus(tx.origin, _status, block.timestamp, _remark);
        return true;
    }
    
    function getStatus() public view returns (uint8) {
        return currentStatus;
    }
    
    function getTraceInfo() public view returns (TraceData[] memory) {
        return traceDatas;
    }
}