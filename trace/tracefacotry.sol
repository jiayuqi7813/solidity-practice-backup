pragma solidity^0.8.7;

import "./category.sol";

contract TraceFactory{
    struct GoodsCategory{
        Category categoryData;
        bool isExist;
    }
    mapping(bytes32 => GoodsCategory) goodsCategorys;
    event NewCategory(address _operator,bytes32 _category );

    function newGoods(bytes32 _category,uint256 _goodsID) public returns (Goods){
        require(!goodsCategorys[_category].isExist, "category is exist");
        Category _newCategory = getCategory(_category);
        return _newCategory.createGoods(_goodsID);
    }


    function newCategory(bytes32 _category) public returns(Category){
        require(!goodsCategorys[_category].isExist, "category is exist");
        goodsCategorys[_category].isExist = true;
        Category _newcategory = new Category(_category);
        goodsCategorys[_category].categoryData = _newcategory;
        emit NewCategory(msg.sender, _category);
        return _newcategory;
    }

    function getCategory(bytes32 _category) public view returns(Category){
        require(goodsCategorys[_category].isExist, "category is not exist");
        return goodsCategorys[_category].categoryData;
    }

    function getStatus(bytes32 _category, uint256 _goodsID) public view returns (uint8){
        Category _categoryData = getCategory(_category);
        return _categoryData.getStatus(_goodsID);
    }

    function changeStatus(bytes32 _category, uint256 _goodsID, uint8 _status, string memory _remark) public returns (bool){
        Category _categoryData = getCategory(_category);
        return _categoryData.changeStatus(_goodsID, _status, _remark);
    }


}