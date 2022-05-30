// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // Initialized to zero
    // public -> Automatically a getter function to read it (view)
        // uint256 public favoriteNumber;
    // Can just remove it and use the retrieve function
    uint256 favoriteNumber;

    // Create a mapping (dictionnary) to associate a string to their favorite number
    mapping(string => uint256) public nameToFavoriteNumber;

    // To create one, but not optimal for a list
    People public person = People({favoriteNumber: 2, name: 'Eric'});

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // Better using an array (just add [] : uint256[] public ...)
    People[] public people;

    // Spends gas because we write to the blockchain (orange)
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // 'memory' only keeps the variable temp inside this function
        // 'calldata' also, but can't be modified
        // 'storage' keeps it permanently and also outside its scope
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        people.push(newPerson);
        // Or, you don't need the memory keyword :
            // people.push(People(_favoriteNumber, _name));
        // Map each name to their favorite number
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // View or pure functions don't spend gas -> only reading (blue)
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}