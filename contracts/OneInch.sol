// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20Permit} from "./ERC20Permit.sol";


/**
 * @title OneInch Token
 * @author 1inch
 * @notice ERC20 token with minting capability and permit functionality
 */
contract OneInch is ERC20Permit, ERC20Burnable, Ownable {
    /**
     * @notice Constructor that mints initial supply to owner
     * @param _owner Address that will own the contract and receive initial tokens
     */
    constructor(address _owner) public ERC20("1INCH Token", "1INCH") EIP712("1INCH Token", "1") {
        _mint(_owner, 1.5e9 ether);
        transferOwnership(_owner);
    }

    /**
     * @notice Mint tokens to a specified address (only owner)
     * @param to Address to mint tokens to
     * @param amount Amount of tokens to mint
     */
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
