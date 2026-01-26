// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendingMachine {
    //owner
    address public owner;
    mapping (address => uint) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 700; // Initial stock
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 0.1 ether, "Not enough Ether sent.");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in stock.");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}