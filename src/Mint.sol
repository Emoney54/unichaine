// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { ERC20 } from "solmate/tokens/ERC20.sol";

contract MintableBurnableToken is ERC20 {
    address public owner;

    // Événement pour le minting
    event Mint(address indexed to, uint256 amount);
    
    // Événement pour le burning
    event Burn(address indexed from, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() ERC20("Mintable Burnable Token", "MBT", 18) {
        owner = msg.sender; // Définit l'adresse du propriétaire lors du déploiement
        _mint(owner, 1_000_000e18); // Mint 1,000,000 tokens au propriétaire
    }

    // Fonction pour mint des tokens
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    // Fonction pour burn des tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }
}
