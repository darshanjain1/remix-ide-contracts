// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Test {
    
    string stringTest;
    
    function memoryTest(string calldata _exampleString) public pure returns (string calldata) {
        // _exampleString = "example";  // You can modify memory
       // string memory newString = _exampleString;  // You can use memory within a function's logic
        return _exampleString;  // You can return memory
    }
    
    function calldataTest(string calldata _exampleString) external pure returns (string memory) {
        // cannot modify _exampleString
        // but can return it
        return _exampleString;
    }
}