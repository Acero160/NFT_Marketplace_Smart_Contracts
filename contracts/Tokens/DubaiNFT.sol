// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract DubaiNFT is ERC721, Ownable {

    //Variables
    uint256 _tokenId;

    constructor() ERC721("Dubai NFT Collection", "DBNFT") Ownable(msg.sender){
        _tokenId = 0;
    }

    function mintDubaiNFT(address to) external onlyOwner returns(uint256){
        _tokenId = _tokenId+1;
        _safeMint(to, _tokenId);
        return _tokenId;
    } 

    function currentTokenId() external view returns (uint256) {
        return _tokenId;
    }
}