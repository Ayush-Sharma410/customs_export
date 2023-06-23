// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//1. manuAdd;ItemHsn;itemDes;qty; cntryCd;cif;buyerAddr;buyerCntryCode;carrierInfo;

contract CountryOfOriginCertificate is ERC721, Ownable {
    struct Certificate {
        string manuAdd;
        uint256 ItemHsn;
        string itemDes;
        uint256 qty;
        string cntryCd;
        uint256 cif;
        string buyerAddr;
        string buyerCntryCode;
        string carrierInfo;
        string currentLoc;
    }

    mapping(uint256 => Certificate) public _certificates;
    uint256 private _tokenIdCounter;

    constructor() ERC721("CountryOfOriginCertificate", "COOC") {}

    function mintCertificate(string memory manuAdd, uint256 ItemHsn, string memory itemDes, uint256 qty, string memory cntryCd, uint256 cif, string memory buyerAddr,  string memory buyerCntryCode,
        string memory carrierInfo, string memory currentLoc) public onlyOwner {
        _tokenIdCounter++;
        uint256 tokenId = _tokenIdCounter;
        Certificate memory newCertificate = Certificate(manuAdd,ItemHsn,itemDes,qty,cntryCd,cif,buyerAddr,buyerCntryCode,carrierInfo,currentLoc);
        _certificates[tokenId] = newCertificate;
        _mint(msg.sender, tokenId);
    }

    
    function getCertificate(uint256 tokenId)
        external
        view
        returns (
        string memory manuAdd,
        uint256 ItemHsn,
        string memory itemDes,
        uint256 qty,
        string memory cntryCd,
        uint256 cif,
        string memory buyerAddr,
        string memory buyerCntryCode,
        string memory carrierInfo,
        string memory currentLoc
        )
    {
        require(_exists(tokenId), "Certificate does not exist");
        Certificate memory certificate = _certificates[tokenId];
        return (
        certificate.manuAdd,
        certificate.ItemHsn,
        certificate.itemDes,
        certificate.qty,
        certificate.cntryCd,
        certificate.cif,
        certificate.buyerAddr,
        certificate.buyerCntryCode,
        certificate.carrierInfo,
        certificate.currentLoc
        );
    }

    function updateCertificate(uint256 tokenId, string memory manuAdd, uint256 ItemHsn, string memory itemDes, uint256 qty, string memory cntryCd, uint256 cif, string memory buyerAddr,  string memory buyerCntryCode,
        string memory carrierInfo,string memory currentLoc) public onlyOwner {
        require(_exists(tokenId), "Certificate not found");
        Certificate storage certificate = _certificates[tokenId];
        certificate.manuAdd = manuAdd;
        certificate.ItemHsn = ItemHsn;
        certificate.itemDes = itemDes;
        certificate.qty = qty;
        certificate.cntryCd = cntryCd;
        certificate.cif = cif;
        certificate.buyerAddr = buyerAddr;
        certificate.buyerCntryCode = buyerCntryCode;
        certificate.carrierInfo = carrierInfo;
        certificate.currentLoc = currentLoc;

        // Increment tokenId to create a new NFT with the same token ID
        _tokenIdCounter++;
        uint256 newTokenId = _tokenIdCounter;
        Certificate memory newCertificate = Certificate(manuAdd,ItemHsn,itemDes,qty,cntryCd,cif,buyerAddr,buyerCntryCode,carrierInfo,currentLoc);
        _certificates[newTokenId] = newCertificate;
        _mint(msg.sender, newTokenId);

        emit UpdateCertificate(tokenId, newTokenId, manuAdd,ItemHsn,itemDes,qty,cntryCd,cif,buyerAddr,buyerCntryCode,carrierInfo,currentLoc);
    }

    event UpdateCertificate(uint256 indexed oldTokenId, uint256 indexed newTokenId, string manuAdd,
        uint256 ItemHsn,
        string itemDes,
        uint256 qty,
        string cntryCd,
        uint256 cif,
        string buyerAddr,
        string buyerCntryCode,
        string carrierInfo,
        string currentLoc);
}
