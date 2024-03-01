// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract MyNFT is Initializable, ERC721Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 public tokenId;

    // Use an initializer instead of a constructor
    function initialize(address fnOwner) public initializer {
        __ERC721_init("MyNFT", "MNFT");
        __Ownable_init(fnOwner);
        __UUPSUpgradeable_init();
        tokenId = 0; // Initialize tokenId
    }

    function safeMint(address to) external onlyOwner {
        tokenId++;
        _safeMint(to, tokenId);
    }

    // Override required by Solidity for UUPS upgrades
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}

