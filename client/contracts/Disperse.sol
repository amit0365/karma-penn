//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OracleInterface.sol";
import "./Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Disperse {

    //boxing results oracle 
    address internal OracletoAddr;
    OracleInterface internal Oracleto; 

    //onlyOwner

    /*

    function setOracleAddress(address _oracleAddress) external  returns (bool) {
        OracletoAddr = _oracleAddress;
        Oracleto = OracleInterface(OracletoAddr); //check oracle interface code
        //return Oracleto.testConnection();
    }
   */


    function getOracleAddress() external view returns (address) {
        return OracletoAddr;
    }

    function testOracleConnection() public view returns (bool) {
        return Oracleto.testConnection(); 
    }

}

    
//instance.awardToken();
    /*

    function transfer(address _addy, uint _value) public override returns(bool){
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_addy] += _value;
        emit Transfer(msg.sender,_addy,_value);
        return true;
        
    }

    */



