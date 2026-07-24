  // SPDX-Licence-Identifier: MT
  pragma solidity ^0.8.21;
  
  contract PractiseFunc{

 // Function #1 — Mappings (basic)
    // Task:
    // Write a function called setScore that takes an address and a uint256, and stores the score for that address.
    // Then write a second function called getScore that takes an address and returns that address's score.
    // No contract skeleton needed — just the state variable and the two functions.

    mapping(address => uint256) public scores;

function setScore(address _owner, uint256 score) public {

    scores[_owner] = score;

}
function getScore(address score) public view returns(uint256){

    return scores[score];
}

 // Function #2 — Mappings (update + check)
    // Task:
    // Write a mapping that tracks whether an address has been verified or not. Write a function verify 
    //that marks an address
    // as verified. Write a function isVerified that returns whether a given address is verified.
    // But here's the catch — if the address is already verified, verify should revert with a message.

    mapping(address => bool) public verified;

    function verify( address _user) public {

        require(!verified[_user], "you have already been verified");

        verified[_user] = true;
    }






  }
 