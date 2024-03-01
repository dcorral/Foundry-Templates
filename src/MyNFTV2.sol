// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./MyNFT.sol";

/// @custom:oz-upgrades-from src/MyNFT.sol:MyNFT
contract MyNFTV2 is MyNFT {
    function safeMintV2(address to) external onlyOwner {
        tokenId +=2;
        _safeMint(to, tokenId);
    }
}
