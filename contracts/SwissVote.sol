// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SwissVote {
    address private owner; 
    uint256 private totalVotes; 
  
    //Struct to represent voter information
    struct Voter {
        bool isRegistered; 
        bool hasVoted;     
    }

    // Mapping to store voter information
    mapping(address => Voter) private voters; 

    event VoterRegistered(address indexed voter); 
    event VoteCast(address indexed voter);  

    // Modifiers to restrict access to certain contract functions based on conditions.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    modifier onlyRegisteredVoter() {
        require(voters[msg.sender].isRegistered, "You are not a registered voter");
        _;
    }

    modifier hasNotVoted() {
        require(!voters[msg.sender].hasVoted, "You have already voted");
        _;
    }
    // constructor to set the contract owner as the address that deploys the contract.
    constructor() {
        owner = msg.sender; 
    }

    //Function to register a new voter
    function registerVoter(address _voter) public onlyOwner {
        require(!voters[_voter].isRegistered, "Voter is already registered");
        voters[_voter].isRegistered = true; 
        emit VoterRegistered(_voter);      
    }

    // Function for register voters that have not voted to cast their vote
    function vote() public onlyRegisteredVoter hasNotVoted {
        voters[msg.sender].hasVoted = true; 
        totalVotes++;                       
        emit VoteCast(msg.sender);          
    }
    // Function to  check if a specific voter has voted.
    function hasVoterVoted(address _voter) public view returns (bool) {
        return voters[_voter].hasVoted; 
    }

    // Function to get the total number of vote 
    function getVoteCount() public view returns (uint256) {
        return totalVotes; 
    }

}
