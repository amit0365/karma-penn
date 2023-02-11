//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface OracleInterface {

    enum MatchOutcome {
        Pending,    //match has not been fought to decision
        Underway,   //match has started & is underway
        Draw,       //anything other than a clear winner (e.g. cancelled)
        Decided     //index of participant who is the winner 
    }

    function getOracleAddress() external view returns (address);

    function testConnection() pure external returns (bool);

    function addTestData() external; 
}