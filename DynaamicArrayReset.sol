// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract DynamicArrayReset{
    uint256[] public dynamicArray  = [10,20,30,40];
    function pushValueToDynamicArray(uint256 value) public {
        dynamicArray.push(value); 
    }
    function resetDynamicArray() public {
        // dynamicArray =  new uint256[](0);
        delete dynamicArray;
    }
}