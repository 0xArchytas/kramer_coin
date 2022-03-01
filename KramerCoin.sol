pragma solidity ^0.8.10; 

contract KramerCoin {
    mapping(address => uint) public balances; 
    uint public totalSupply = 76300000 * 10 ** 16;
    string public name = "KramerCoin";
    string public symbol = "KRMR";
    uint public decimals = 16; 
    
    event Transfer(address indexed from, address indexed to, uint value); 
    
    constructor() {
        balances[msg.sender] = totalSupply; 
    } 
    
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner]; 
    }
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, "You trying to gyp me, Newman? Balance too low!"); 
        balances[to] += value; 
        balances[msg.sender] -= value; 
        emit Transfer(msg.sender, to, value); 
        return true; 
    }
    
}
