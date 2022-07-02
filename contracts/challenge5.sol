// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable public owner;
     uint256 unlockDate;
     uint public _amount ;

    constructor() payable {
        owner = payable(msg.sender);
        unlockDate=2 days;
        _amount = 5 ether;
    }

    modifier checkTime() {
        uint startDate = block.timestamp; // 2018-01-01 00:00:00
        uint endDate = unlockDate; // 2018-02-10 00:00:00
        uint diff = (endDate - startDate);
        require(diff == 0);
        _;
    }
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
    function withdraw() public checkTime {
        uint256 amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }
     function sendEth(address payable _to) public payable {
         _to.transfer(_amount);
    }


    function getBalance() public view returns (uint) {
         return address(this).balance;
    }
}
