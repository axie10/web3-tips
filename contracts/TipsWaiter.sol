// License
// SPDX-License-Identifier: LGPL-3.0-only

// Compiler version
pragma solidity ^0.8.24;

contract Tips {

    address public owner;

    constructor () {
        owner = msg.sender;
    }


}