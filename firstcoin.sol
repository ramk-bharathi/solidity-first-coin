pragma solidity ^0.4.13;

contract FirstCoin {
    string public coinName;
    uint256 public totalCoins;

    mapping (address => uint256) public balanceOf;

    event LogTransactions(address indexed from, address indexed to, uint256 value);

    function FirstCoin(uint256 initSupplyCoins, string name) {
        balanceOf[msg.sender] = initSupplyCoins;
        totalCoins = initSupplyCoins;
        coinName = name;
    }

    function transaction(address to, uint256 value) {
        require (to != 0x0);
        require (balanceOf[msg.sender] > value);
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        LogTransactions(msg.sender, to, value);
    }

}