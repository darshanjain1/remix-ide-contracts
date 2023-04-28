// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SafeMathTester{

    uint8 public bigInteger = 255;

    function incrementBigInteger() public {
        unchecked{bigInteger++;}
    }
}