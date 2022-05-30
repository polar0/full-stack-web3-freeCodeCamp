// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './SimpleStorage.sol';

contract StorageFactory {
    // Make it an array to keep track of deployed contracts
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // Save it as a memory variable
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // To interact with a contract
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Needs : Address + ABI
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
        // Or even simplier :
            // return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}