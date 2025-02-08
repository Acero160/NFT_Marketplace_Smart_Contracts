// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract DubaiERC1155 is ERC1155, Ownable {

    //Errors
    error DubaiERC1155InvalidAmount();
    error DubaiERC1155InvalidURI();
    error DubaiERC1155TokenIdAlreadyExists();
    error DubaiERC1155InvalidArrayLength();

    mapping (uint256 tokenId => string) private _tokenURIs;
    
    constructor() ERC1155 ("") Ownable(msg.sender) {
        
    }

    function mintDubaiMultitoken(address to, uint256 tokenId, uint256 amount, string memory _tokenURI) external onlyOwner returns(uint256){    
        if(amount <= 0) {
            revert DubaiERC1155InvalidAmount();
        }    
        if (bytes(_tokenURI).length == 0 ){
            revert DubaiERC1155InvalidURI();
        }
        if(bytes(_tokenURIs[tokenId]).length != 0){
            revert DubaiERC1155TokenIdAlreadyExists();
        }
        _setTokenURI(tokenId, _tokenURI);
        _mint(to, tokenId, amount, "");
        return tokenId;
    }

    function mintDubaiMultitokenBatch(address to, uint256[] memory ids, uint256[] memory values, string[] memory _tokenURI) external onlyOwner returns (uint256[] memory){

        for(uint i = 0; i< values.length; i++){
            if(values[i] <= 0){
                revert DubaiERC1155InvalidAmount();
            }
        }

        if (ids.length != _tokenURI.length){
            revert DubaiERC1155InvalidArrayLength();
        }

        for (uint j = 0; j< ids.length; j++){
            uint256 id = ids[j];
            if (bytes(_tokenURIs[id]).length != 0){
                revert DubaiERC1155TokenIdAlreadyExists();
            }

            if(bytes (_tokenURI[j]).length == 0){
                revert DubaiERC1155InvalidURI();
            }
        }
        
        _mintBatch (to, ids, values, "");

        return ids;
    }
   

    function uri(uint256 tokenId) public view override returns (string memory) {
        string memory tokenUri = _tokenURIs[tokenId];
        if(bytes(tokenUri).length == 0){
            revert DubaiERC1155InvalidURI();
        }
        return tokenUri;
    }



    function _setTokenURI(uint256 tokenId, string memory _tokenURI) private {
        _tokenURIs[tokenId] = _tokenURI; 
    }








}