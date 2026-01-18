// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    error ERC20ExceedsMaxMintAmount(uint256 maxMintAmount);

    constructor() ERC20("Token", "TOKEN") Ownable(msg.sender) {}

    modifier maxMint(uint256 amount) {
        if (amount > 100) {
            revert ERC20ExceedsMaxMintAmount(100);
        }
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner maxMint(amount) {
        _mint(to, amount);
    }
}
