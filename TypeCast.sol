// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract CheckingTypeCasting {
    int256 internal a = -1;

     function convertIntToUint() public view returns (uint256){
         uint256 b = uint256(a);
         return b;
     }
}