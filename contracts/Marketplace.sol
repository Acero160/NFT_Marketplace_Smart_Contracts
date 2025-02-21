// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "./Tokens/DubaiERC20.sol";
import "./Tokens/DubaiNFT.sol";

contract Marketplace is Ownable, ERC721Holder {

    //Errors
     error DubaiNFTMintingError();
     error DubaiMarquetplaceInsufficientFunds();
     error DubaiNFTNonAvailable();

     //Events
     event NFTAddedMarketPlace(uint256 _tokenId);
     event NFTPurchased(address to, uint256 tokenId);

    // To deploy the contracts
    DubaiERC20 public erc20Contract;
    DubaiNFT public nftContract;

    //Mapping
    mapping(uint256 _tokenId => bool) availableNFTs;

    //Variable
    uint256 public nftPrice = 0.01 ether;
    uint256 public rewardTokens =  20 * 10**18;

    constructor() Ownable(msg.sender){
      
        nftContract = new DubaiNFT();
        erc20Contract = new DubaiERC20();

    }

    function addNFTToMarketplace () external onlyOwner {
        uint256 _tokenId = nftContract.mintDubaiNFT(address(this));
        if(_tokenId == 0){
            revert DubaiNFTMintingError();
        }
        availableNFTs[_tokenId] = true;

        // If everything went well, we emit the event to add the new NFT
        emit NFTAddedMarketPlace(_tokenId);

    }

    function buyDubaiNFT(uint256 _tokenId) external payable {
        // Check if the user has enough funds
        if (msg.value < nftPrice) {
            revert DubaiMarquetplaceInsufficientFunds();
        }

        // Check that there are NFTs available for purchase
        if(!availableNFTs[_tokenId]) {
            revert DubaiNFTNonAvailable();
        }

        availableNFTs[_tokenId] = false;

        //Send tokens
        nftContract.safeTransferFrom(address(this), msg.sender, _tokenId);

        uint256 excessAmount = msg.value - nftPrice;
        // Return the excess amount
        if(excessAmount>0){
            (bool succes, ) = msg.sender.call{value: excessAmount}("");
            require(succes, "refund failed");
        }

        erc20Contract.mintDubaiERC20(msg.sender, rewardTokens);

        emit NFTPurchased(msg.sender, _tokenId);
    }

    function setNftPrice(uint256 _nftPrice) external onlyOwner {
        nftPrice = _nftPrice;
    }

     function setRewardTokens(uint256 _rewardTokens) external onlyOwner {
        rewardTokens = _rewardTokens;
    }

    // Function to transfer the NFT and receive the money (profits)
    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    //Check address
    function getERC20Address() external view returns (address) {
        return address(erc20Contract);
    }

    //Check NFT
    function getNFTAddress() external view returns (address) {
        return address(nftContract);
    }

    function getAvailableNFTs() external view returns (uint256 [] memory) {
        uint256 totalSupply = nftContract.currentTokenId();
        uint256 count = 0;

        for(uint i = 1; i<=totalSupply; i++) {
            if(availableNFTs[i]){
                count= count +1;
            }

        }

        uint256[] memory tokenIds = new uint256[](count);
        uint256 index = 0;

        // Array to store NFTs when they are purchased
        for(uint i = 1; i<= totalSupply; i++) {
             if(availableNFTs[i]){
                tokenIds[index] = i;
                index++;
            }
        }  


        return tokenIds;

    }

}
