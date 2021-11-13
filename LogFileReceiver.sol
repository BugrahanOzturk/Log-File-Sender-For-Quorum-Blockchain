pragma solidity ^0.7.5;

contract LogReceiver{
    
    address owner; // Address of the IoT Controller
    string logfile;
    
    modifier onlySender {
        require(msg.sender == owner, "Only IoT Controller can call this function.");
        _;
    }
    
    /**************************************************************************************************
    //**** Deployer calls constructor to own the contract. ****
    **************************************************************************************************/
    constructor(){
        owner = msg.sender;
   }
   
   function receive_line(string memory line) public payable{
       logfile = string(abi.encodePacked(logfile, line));
   }

    function send_log_file() external view returns (string memory){
        return logfile;
    }
    
    function delete_log_file() public payable{
        logfile = "";
    }
}