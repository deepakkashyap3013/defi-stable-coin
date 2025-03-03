// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT
/** solidity version */
pragma solidity ^0.8.19;

/** imports */
import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DecentralizedStableCoin
 * @author Deepak Kashyap aka (Cynefin)
 * Collateral: Exogenous
 * Minting (Stability Mechanism): Decentralized (Algorithmic)
 * Value (Relative Stability): Anchored (Pegged to USD)
 * Collateral Type: Crypto
 * This is the contract meant to be owned by DSCEngine. It is a ERC20 token that can be minted and burned by the
 * DSCEngine smart contract.
 */
contract DecentralisedStableCoin is ERC20Burnable, Ownable {
    /** errors */
    error DecentralisedStableCoin__MustBeGreaterThanZero();
    error DecentralisedStableCoin__BurnAmountExceedsBalance();
    error DecentralizedStableCoin__InvalidZeroAddress();
    error DecentralizedStableCoin__AmountMustBeMoreThanZero();

    /** constructor */
    constructor() ERC20("DecentralisedStableCoin", "DSC") Ownable(msg.sender) {}

    /**
     * @dev Destroys a `_amount` amount of tokens from the caller.
     * See {ERC20-_burn}.
     * overriding function from {ERC20Burnable}
     */
    function burn(uint256 _amount) public override onlyOwner {
        uint256 senderBalance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DecentralisedStableCoin__MustBeGreaterThanZero();
        }
        if (senderBalance <= _amount) {
            revert DecentralisedStableCoin__BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }

    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralizedStableCoin__InvalidZeroAddress();
        }
        if (_amount <= 0) {
            revert DecentralizedStableCoin__AmountMustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
