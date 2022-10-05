pragma solidity^0.8.7;

import "./goods.sol";

contract Category{
    bytes32 currentCategory;
    // goodsid =>Goods
    struct GoodsData{
        Goods traceData;
        bool isExist;
    }
    mapping(uint256 => GoodsData) goods;
    event NewGoods(uint256 _goodsID, address _operator);

    constructor(bytes32 _category){
        currentCategory = _category;
    }

    function createGoods(uint256 _goodsID) public returns (Goods){
        require(!goods[_goodsID].isExist, "goods is exist");
        goods[_goodsID].isExist = true;
        Goods newgoods = new Goods(_goodsID);
        goods[_goodsID].traceData = newgoods;
        emit NewGoods(_goodsID, msg.sender);
        return newgoods;
    }

    function getStatus(uint256 _goodsID) public view returns (uint8){
        require(goods[_goodsID].isExist, "goods is not exist");
        return goods[_goodsID].traceData.getStatus();
    }

    function changeStatus(uint256 _goodsID, uint8 _status, string memory _remark) public returns (bool){
        require(goods[_goodsID].isExist, "goods is not exist");
        return goods[_goodsID].traceData.changeStatus(_status, _remark);
    }

    function getGoods(uint256 _goodsID) public view returns (Goods){
        require(goods[_goodsID].isExist, "goods is not exist");
        return goods[_goodsID].traceData;
    }   


}