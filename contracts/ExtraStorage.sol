// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './SimpleStorage.sol';

// Inherit all the functionalities of SimpleStorage
contract ExtraStorage is SimpleStorage {
    // We can override a function to modify it
    // We also need to add 'virtual' to the original function
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}