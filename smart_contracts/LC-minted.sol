// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LetterOfCredit is ERC721, Ownable {
    struct LC {
        string issuingBank;
        string applicant;
        string beneficiary;
        uint256 amount;
        uint256 expiryDate;
        uint256 timestamp;
    }

    mapping(uint256 => LC) public _lcs;
    uint256 private _tokenIdCounter;

    constructor() ERC721("LetterOfCredit", "LCO") {}

    function mintLC(string memory issuingBank, string memory applicant, string memory beneficiary, uint256 amount, uint256 expiryDate) public onlyOwner {
        _tokenIdCounter++;
        uint256 tokenId = _tokenIdCounter;
        LC memory newLC = LC(issuingBank, applicant, beneficiary, amount, expiryDate, block.timestamp);
        _lcs[tokenId] = newLC;
        _mint(msg.sender, tokenId);
    }

    function getLC(uint256 tokenId)
        external
        view
        returns (
            string memory issuingBank,
            string memory applicant,
            string memory beneficiary,
            uint256 amount,
            uint256 expiryDate,
            uint256 timestamp
        )
    {
        require(_exists(tokenId), "LC does not exist");
        LC memory lc = _lcs[tokenId];
        return (
            lc.issuingBank,
            lc.applicant,
            lc.beneficiary,
            lc.amount,
            lc.expiryDate,
            lc.timestamp
        );
    }

    function updateLC(uint256 tokenId, string memory issuingBank, string memory applicant, string memory beneficiary, uint256 amount, uint256 expiryDate) public onlyOwner {
        require(_exists(tokenId), "LC not found");
        LC storage lc = _lcs[tokenId];
        lc.issuingBank = issuingBank;
        lc.applicant = applicant;
        lc.beneficiary = beneficiary;
        lc.amount = amount;
        lc.expiryDate = expiryDate;

        // Increment tokenId to create a new NFT with the same token ID
        _tokenIdCounter++;
        uint256 newTokenId = _tokenIdCounter;
        LC memory newLC = LC(issuingBank, applicant, beneficiary, amount, expiryDate, block.timestamp);
        _lcs[newTokenId] = newLC;
        _mint(msg.sender, newTokenId);

        emit UpdateLC(tokenId, newTokenId, issuingBank, applicant, beneficiary, amount, expiryDate);
    }

    event UpdateLC(uint256 indexed oldTokenId, uint256 indexed newTokenId, string issuingBank, string applicant, string beneficiary, uint256 amount, uint256 expiryDate);
}