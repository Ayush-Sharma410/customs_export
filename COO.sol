// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract COO_1 {
    uint256 public certificateNumber;
    string sender;
    string manuAdd;
    string ItemTariff;
    string itemDes;
    uint256 qty;
    uint256 weight;
    string cntryCd;
    string validityUpto;
    string date;

    constructor() {}

    function getRequest(
        string memory _manuAdd,
        string memory _ItemTariff,
        string memory _itemDes,
        uint256 _qty,
        uint256 _weight,
        string memory _cntryCd,
        string memory _validityUpto
    ) public returns (uint256) {
        
        manuAdd=_manuAdd;
        ItemTariff = _ItemTariff;
        itemDes = _itemDes;
        qty = _qty;
        weight = _weight;
        cntryCd = _cntryCd;
        validityUpto = _validityUpto;

        return certificateNumber += 1;

    }
    
    function validate(uint256 _certificateNumber) public view returns(bool){
        if( _certificateNumber==certificateNumber){
            return true;
        }else{return false;}
    }
    
    
    }

    


// contract COO_2{

//     uint256 certificateNumber;
//     string manuAdd;
//     string date;

//     COO_1 public c1;

//     constructor(){

//     }

//     function store(string memory _manuAdd,uint256 _certificateNumber,string memory _date)public {
//         manuAdd=_manuAdd;
//         certificateNumber=_certificateNumber;
//         date=_date;
//         c1.validate(_certificateNumber);
//     }}