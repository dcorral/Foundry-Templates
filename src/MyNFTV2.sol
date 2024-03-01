// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/// @custom:oz-upgrades-from src/MyNFT.sol:MyNFT
contract MyNFTV2 is ERC721Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 private _tokenId;

    function safeMint(address to) external onlyOwner {
        _tokenId++;
        _tokenId++;
        _safeMint(to, _tokenId);
    }

    function tokenId() external view returns (uint256) {
        return _tokenId;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
