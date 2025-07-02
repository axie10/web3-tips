// License
// SPDX-License-Identifier: LGPL-3.0-only

// Compiler version
pragma solidity ^0.8.24;

contract Tips {

    // Variable
    address public owner;
    mapping(address => uint256) public tipsRecived;

    // Events
    event TipsRecived (address index, uint256 amount);

    constructor () {
        owner = msg.sender;
    }

    function sendTips() public payable{
        require(msg.value > 0, "eth has more than 0");

        tipsRecived[msg.sender] += msg.value;

        emit TipsRecived(msg.sender, msg.value);
    }


}