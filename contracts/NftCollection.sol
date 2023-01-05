//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";

import "../node_modules/hardhat/console.sol";

contract NftCollection is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public constant maxSupply = 2;

    constructor() ERC721("NftCollection", "PK") {
        console.log("An NFT Contract has been deployed by %s", msg.sender);
    }

    function createNft() public {
        uint256 newItemId = _tokenIds.current();

        require(newItemId < maxSupply);

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "https://jsonkeeper.com/b/61X9");

        _tokenIds.increment();

        console.log("NFT ID %s has been minted", newItemId);
    }
}
