//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Creature is ERC721, Ownable {
    constructor(string memory _name) ERC721(_name, "CCC") {}
    
    function tokenURI(uint256 _tokenId) override public pure returns (string memory) {
        return string(abi.encodePacked("https://creatures-api.opensea.io/api/creature/", Strings.toString(_tokenId)));
    }
}