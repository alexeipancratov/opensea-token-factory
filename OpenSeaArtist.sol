//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

import "./Creature.sol";

contract OpenSeaArtist {
    mapping(string => Creature) public creatures;
    address artist;
    
    event TokenCreated(Creature indexed tokenAddress);
    
    constructor() {
        artist = msg.sender;
    }
    
    function createCreature(string memory name) public returns(Creature) {
        Creature creature = new Creature(name);
        
        emit TokenCreated(creature);
        creatures[name] = creature;
        return creature;
    }
    
    function isArtistOriginatorOfCreature(string memory name) public view returns(bool) {
        if (keccak256(abi.encodePacked((creatures[name].name()))) == keccak256(abi.encodePacked((name)))) {
            return true;
        }
        return false;
    }
}