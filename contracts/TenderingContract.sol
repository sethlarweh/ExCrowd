pragma solidity ^0.5.0;

import './Set.sol';

contract TenderingContract {
        
    function answer(string calldata ans) external {
        answers[msg.sender] = ans;
        workersArr.push(msg.sender);
        if (Set.insert(workers, msg.sender))
        {
            workerCount++;
        }
        emit toVerification(msg.sender);
    }

    function getWorkers(uint number) public view returns (address) {
        require(msg.sender == _owner);
        require(number < workerCount);
        return workersArr[number];
    }

    function getNumberOfWorkers() public view returns (uint) {
        require(msg.sender == _owner);
        return workerCount;
    }

    function isPaid(address a) public view returns (bool) {
        return paid[a];
    }
    
    function myPay() public view returns (bool) {
        return paid[msg.sender];
    }
    
    function myAnswer() public view returns (string memory) {
        if (bytes(answers[msg.sender]).length == 0) return "";
        return answers[msg.sender];
    }
}