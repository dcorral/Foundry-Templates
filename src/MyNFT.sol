// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract MyNFT is Initializable, ERC721Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 private _tokenId;

    // Use an initializer instead of a constructor
    function initialize(address fnOwner) public initializer {
        __ERC721_init("MyNFT", "MNFT");
        __Ownable_init(fnOwner);
        __UUPSUpgradeable_init();
        _tokenId = 0; // Initialize tokenId
    }

    function safeMint(address to) external onlyOwner {
        _tokenId++;
        _safeMint(to, _tokenId);
    }

    function tokenId() external view returns (uint256){
        return _tokenId;
    }

    // Override required by Solidity for UUPS upgrades
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

}

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
//
// contract MyNFT is Initializable, ERC721, Ownable {
//     // State variables
//     uint256 _tokenId;
//     address _owner;
//
//     function initialize() public {
//         __ERC721_init("MyNFT", "MNFT");
//         __Ownable_init();
//     }
//     // Errors
//
//     error NotOwner();
//
//     function safeMint(address to) external onlyOwner {
//         if (msg.sender != _owner) {
//             revert NotOwner();
//         }
//
//         _tokenId = _tokenId++;
//         _safeMint(to, _tokenId);
//     }
//
//     function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
// }
