# SwissVote Smart Contract

**Deployed Contract Adress =0x34d68974695694acA2C0EeaD25E7a18Ca82676A9** 
SwissVote is an Ethereum smart contract designed for secure and transparent voting. It provides the following features:

- **Voter Registration:** The contract owner can register voters by adding their Ethereum addresses.

- **Exclusive Voting:** Only registered voters are allowed to cast their votes.

- **Single Vote:** Each registered voter can cast only one vote, ensuring the integrity of the voting process.

- **Vote Count:** The contract maintains a record of the total number of votes cast.

## Usage

1. **Deployment:** Deploy the SwissVote contract on an Ethereum network, such as Rinkeby or Mainnet, using a development environment like Hardhat or Remix.

2. **Voter Registration:** As the contract owner, register voters by calling the `registerVoter` function with their Ethereum addresses. Ensure that each voter is not already registered.

3. **Casting Votes:** Registered voters can cast their votes using the `vote` function. The contract ensures that each voter can vote only once.

4. **Verification:** To verify whether a specific voter has already voted, use the `hasVoterVoted` function.

5. **Vote Count:** Retrieve the total number of votes cast by calling the `getVoteCount` function.

