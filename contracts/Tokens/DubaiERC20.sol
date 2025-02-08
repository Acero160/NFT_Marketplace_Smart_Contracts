// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DubaiERC20 is ERC20, Ownable {
    
    constructor() ERC20("Dubai ERC20", "DXB") Ownable(msg.sender) {}
    

    function mintDubaiERC20(address account, uint256 value) external onlyOwner {
        //Llamamos a la function _mint que esta en el token ERC ( de la importacion)
        _mint(account, value);
    }
}