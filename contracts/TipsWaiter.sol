// License
// SPDX-License-Identifier: LGPL-3.0-only

// Compiler version
pragma solidity ^0.8.24;

contract Tips {

    // Variable
    address public owner;
    uint256 public balanceTotal;
    mapping(address => uint256) public tipsRecived;

    // Events (use standars "indexed" and "from/to" to transparency, traceability, compatibility)
    event TipsRecived (address indexed from, uint256 amount);
    event Withdrawal (address indexed to, uint256 amount);

    constructor () {
        owner = msg.sender;
    }

    function sendTips() public payable{
        require(msg.value > 0, "ETH has more than 0");

        tipsRecived[msg.sender] += msg.value;

        emit TipsRecived(msg.sender, msg.value);
    }

    function withdraw() public {

        require(msg.sender == owner, "you are not a owner of this smart contract");
        uint256 balance_ = address(this).balance;

        require(balance_ > 0, "you haven`t enough ETH");

        //* owner es una dirección (address)
        //* payable(...) convierte una dirección normal en una dirección que puede recibir ETH
        //* Esto envía balance wei (o ETH) a esa dirección
        payable(owner).transfer(balance_);
        emit Withdrawal(msg.sender, balance_);
    }

    function balanceCurrentContract() public view returns(uint256){
        return address(this).balance;
    }

}