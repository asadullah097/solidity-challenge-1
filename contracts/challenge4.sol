// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable public owner;
    uint public _amount ;

    constructor() payable {
        owner = payable(msg.sender);
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
