// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable public owner;
    uint256 public withdrawalTime;

    constructor() payable {
        owner = payable(msg.sender);
        withdrawalTime = 1 days;
    }

    modifier checkTime() {
        // require(block.timestamp= );
        _;
    }

    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function withdraw() public {
        uint256 amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    function sendEth(address payable _to, uint256 _amount) public payable {
        bool sent = _to.send(_amount);
        require(sent, "Failed to send Ether");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
