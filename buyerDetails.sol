// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./supplierDetails.sol";

contract buyer {
    function store(
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

    function shipTo(string memory _port, string memory _dryPort)
        public
        view
        returns (string memory, string memory)
    {
        console.log("${_port} ICD ${_dryport}");
        return (_port, _dryPort);
    }

    function shipDetail(
        uint256 _freightType,
        string memory _date,
        uint256 _netWeight
    ) public view returns (uint256) {
        uint256 _grossWeight = _netWeight + 20;
    }
}

// --------------------------------------------------------------------------------------------------------------- //

contract buyerSelectProduct is supplierProductList {
    supplierProductList SPL;

    constructor(address _SupPro) {
        SPL = supplierProductList(_SupPro);
    }

    function choose(uint256 _ch) public view returns (product) {
        return chooseProduct(_ch);
    }
}

// --------------------------------------------------------------------------------------------------------------- //
