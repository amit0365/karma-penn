//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Karma is ERC20 {

    uint constant _initial_supply = 100 * (10**18);
    //event Transfer(address,address,uint256);

    mapping(address=>uint256) balances;

    constructor() ERC20("Karma", "KK") {
        _mint(msg.sender, _initial_supply);
       // balances[msg.sender]=_initial_supply;
    }

    /*

    function transfer(address _addy, uint _value) public override returns(bool){
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_addy] += _value;
        emit Transfer(msg.sender,_addy,_value);
        return true;
        
    }

    */

}