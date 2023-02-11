pragma solidity ^0.8.0;

import "./Ownable.sol";


contract Oracle is Ownable {

    mapping(address => bool) badges; 

    address[] Addresses;

    uint256[] Scores;

    bool[] Badges;

    //defines a match along with its outcome
    struct user {
        address walletAddress;             //unique id
        uint256 score;            //human-friendly name (e.g. Jones vs. Holloway)
                 
    }

    function awardToken(uint256 score) onlyOwner external returns(bool[] memory) {
    for (i=0; i<Scores.length; i++)
    {if(Scores[i]>75)
        badges.push(true)
        return badges;
    
  }
 

    function testConnection() public pure returns (bool) {
        return true; 
    }
   

    /// @notice for testing 
    function addTestData() external onlyOwner {

        Addresses.push(0xF204211CC50C5891Dda468Bf26836E6bc0A80aF5);
        Addresses.push(0x41402cE75630E4e1854156D0BFf8B9aC471308c9);

        Scores.push(75);
        Scores.push(90);

    }
}
