// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
 
import {ERC20} from "solmate/tokens/ERC20.sol";
 
contract joker is ERC20 {
    constructor() ERC20("joker", "THC", 18) {
        _mint(msg.sender, 1_000_000e18);
    }
}