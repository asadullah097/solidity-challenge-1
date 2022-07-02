//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Challenge1 is Ownable, Pausable {
    //struct student
    struct Student {
        string name;
        uint8 age;
        string class;
    }

    Student[] public students;
    mapping(string => bool) public result;

    // //create student function
    function _createStudent(
        string memory _name,
        uint8 _age,
        string memory _class
    ) public onlyOwner whenNotPaused {
        students.push(Student(_name, _age, _class));
    }

    function _result(string memory _name, bool _pass)
        public
        onlyOwner
        whenNotPaused
    {
        result[_name] = _pass;
    }
}
