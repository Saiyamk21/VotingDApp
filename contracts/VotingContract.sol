// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Create {
    using Counters for Counters.CounterStruct;
    Counters.CounterStruct public _voterId;
    Counters.CounterStruct public _candidateId;

    address public votingOrganizer;

    // candidate start
    struct Candidate {
        uint256 candidateID;
        string age;
        string name;
        string image;
        uint256 votecount;
        address _address;
        string ipfs;
    }
    event CandidateCreate(
        uint256 indexed candidateID,
        string age,
        string name,
        string image,
        uint256 votecount,
        address _address,
        string ipfs
    );
    address[] public candidateAddress;
    mapping(address => Candidate) public candidates;
    //candidate end


    // voter start
    struct Voter{
        uint256 voter_voterId;
        string voter_name;
        string voter_image;
        address voter_address;
        uint256 voter_allowed;
        bool voter_voted;
        uint256 voter_vote;
        string voter_ipfs;
    }
    event VoterCreated(
        uint256 indexed voter_voterId,
        string voter_name,
        string voter_image,
        address voter_address,
        uint256 voter_allowed,
        bool voter_voted,
        uint256 voter_vote,
        string voter_ipfs
    );
    address[] public votedVoters;
    address[] public votersAddress;
    mapping(address=>Voter) public voters;

    // voterend


    constructor (){
        votingOrganizer=msg.sender;
    }
    function setCandidate(address _address,string memory _age,string memory _name,string memory _image,string memory _ipfs) public{
        require(votingOrganizer==msg.sender,"You are not Organizer u cannot set candidate");
        _candidateId.increment();
        uint256 idNumber=_candidateId.current();
        Candidate storage candidate=candidates[_address];
        candidate.age=_age;
        candidate.candidateID=idNumber;
        candidate.name=_name;
        candidate.image=_image;
        candidate.votecount=0;
        candidate._address=_address;
        candidate.ipfs=_ipfs;

        candidateAddress.push(_address);
        emit CandidateCreate(idNumber, _age, _name, _image, candidate.votecount, _address, _ipfs);
    }
}
