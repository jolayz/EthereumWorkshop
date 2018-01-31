pragma solidity ^0.4.17;

contract Company {
    string public name_;
    string public ownerName_;
    address public ceoAddr_;

    /* Function to recover the funds on the contract */
    function kill() external {
        if (msg.sender == ceoAddr_)
            selfdestruct(ceoAddr_);
    }
}

//TODO inherite Company
contract Amazon {
    
    //TODO implement constructor

    //TODO implement constant getter
}
