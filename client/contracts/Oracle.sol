pragma solidity ^0.8.0;

import "./Ownable.sol";

/// @title BoxingOracle
/// @author John R. Kosinski
/// @notice Collects and provides information on boxing matches and their outcomes 
contract Oracle is Ownable {
    Match[] matches; 



    //defines a match along with its outcome
    struct Match {
        address walletAddress;
        uint256 score;
    }


    /// @notice puts a new pending match into the blockchain 
    /// @param _name descriptive name for the match (e.g. Pac vs. Mayweather 2016)
    /// @param _participants |-delimited string of participants names (e.g. "Manny Pac|Floyd May")
    /// @param _participantCount number of participants 
    /// @param _date date set for the match 
    /// @return the unique id of the newly created match 
    function addMatch(string _name, string _participants, uint8 _participantCount, uint _date) onlyOwner public returns (bytes32) {

        //hash the crucial info to get a unique id 
        bytes32 id = keccak256(abi.encodePacked(_name, _participantCount, _date)); 

        //require that the match be unique (not already added) 
        require(!matchExists(id));
        
        //add the match 
        uint newIndex = matches.push(Match(id, _name, _participants, _participantCount, _date, MatchOutcome.Pending, -1))-1; 
        matchIdToIndex[id] = newIndex+1;
        
        //return the unique id of the new match
        return id;
    }

    /// @notice can be used by a client contract to ensure that they've connected to this contract interface successfully
    /// @return true, unconditionally 
    function testConnection() public pure returns (bool) {
        return true; 
    }

    /// @notice gets the address of this contract 
    /// @return address 
    function getAddress() public view returns (address) {
        return this;
    }

    /// @notice for testing 
    function addTestData() external onlyOwner {
        addMatch("Pacquiao vs. MayWeather", "Pacquiao|Mayweather", 2, DateLib.DateTime(2018, 8, 13, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Macquiao vs. Payweather", "Macquiao|Payweather", 2, DateLib.DateTime(2018, 8, 15, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Pacweather vs. Macarthur", "Pacweather|Macarthur", 2, DateLib.DateTime(2018, 9, 3, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Macarthur vs. Truman", "Macarthur|Truman", 2, DateLib.DateTime(2018, 9, 3, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Macaque vs. Pregunto", "Macaque|Pregunto", 2, DateLib.DateTime(2018, 9, 21, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Farsworth vs. Wernstrom", "Farsworth|Wernstrom", 2, DateLib.DateTime(2018, 9, 29, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Fortinbras vs. Hamlet", "Fortinbras|Hamlet", 2, DateLib.DateTime(2018, 10, 10, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Foolicle vs. Pretendo", "Foolicle|Pretendo", 2, DateLib.DateTime(2018, 11, 11, 0, 0, 0, 0, 0).toUnixTimestamp());
        addMatch("Parthian vs. Scythian", "Parthian|Scythian", 2, DateLib.DateTime(2018, 11, 12, 0, 0, 0, 0, 0).toUnixTimestamp());
    }
}