//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract OracleInterface {

    enum MatchOutcome {
        Pending,    //match has not been fought to decision
        Underway,   //match has started & is underway
        Draw,       //anything other than a clear winner (e.g. cancelled)
        Decided     //index of participant who is the winner 
    }


    function testConnection() public pure virtual returns (bool);

    function addTestData() public virtual; 
}