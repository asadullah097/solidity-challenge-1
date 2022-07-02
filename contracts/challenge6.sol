// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenerateHash {
    function collisionExample(string memory _string1, string memory _string2)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encode(_string1, _string2));
    }
}
