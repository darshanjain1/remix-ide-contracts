// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract C {
    uint public data = 42;
}

contract Caller {
    C c = new C();
    function f() public view returns (uint) {
        return c.data();
    }
}