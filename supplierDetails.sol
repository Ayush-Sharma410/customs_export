// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract supplier {
    constructor() {}

    function details(
        string memory _organisationName,
        string memory _address,
        string memory _IEC,
        string memory _gstNo,
        uint256 _contactNo,
        string memory _emailId
    )
        public
        pure
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            uint256,
            string memory
        )
    {
        return (
            _organisationName,
            _address,
            _IEC,
            _gstNo,
            _contactNo,
            _emailId
        );
    }
}

// --------------------------------------------------------------------------------------------------------------- //

contract displayProducts {
    struct product {
        string _code;
        string _price;
        string _des;
    }

    product[] productArray;

    function store(
        string memory _code,
        string memory _price,
        string memory _des
    ) public {
        product memory abc = product(_code, _price, _des);
        productArray.push(abc);
    }
}

// --------------------------------------------------------------------------------------------------------------- //

// contract supplierProductList{
//     constructor(){}

//     enum product{a, b, c, d}

//     function chooseProduct(uint256 _ch) public view returns(product) {

//         if(_ch == 1) {
//             return product.a;
//         }
//         else if(_ch == 2){
//             return product.b;
//         }
//         else if(_ch == 3) {
//             return product.c;
//         }
//         else if(_ch == 4) {
//             return product.d;
//         }
//         else {
//             console.log("Product does not exit. Choose correct Product!!!");
//         }
//     }
// }

// --------------------------------------------------------------------------------------------------------------- //
contract chooseProduct is displayProducts {
    function productChoose(uint256 index) public view returns () {
        return productArray[index];
    }
}
