// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    // State variables
    uint256 _tokenId;
    address _owner;

    // Errors
    error NotOwner();

    constructor(address fnOwner) ERC721 ("MyNFT", "MNFT") {
        _owner = fnOwner;
    }

    function safeMint(address to) external {
        if (msg.sender != _owner)
            revert NotOwner();

        _tokenId = _tokenId++;
        _safeMint(to, _tokenId);
    }
}
