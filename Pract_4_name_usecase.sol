// Name: Akash Agalave   Roll_no: 06    Div: A
// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;
 
  
// Build the Contract 
contract MarksManagmtSys 
{ 
    // Create a structure for student details 
    struct Student 
    { 
        int ID; 
        string fName; 
        string lName; 
        int marks; 
    } 
  
    address owner; 
    int public stdCount = 0; 
    mapping(int => Student) public stdRecords; 
  
    modifier onlyOwner 
    { 
        require(owner == msg.sender); 
        _; 
    } 
    constructor() 
    { 
        owner = msg.sender; 
    } 
  
    // Create a function to add new records 
    function addNewRecords(int _ID,  
                           string memory _fName, 
                           string memory _lName, 
                           int _marks) public onlyOwner 
    { 
        // Increase the count by 1 
        stdCount = stdCount + 1; 
  
        // Add the student details to stdRecords 
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks); 
    } 
  
    // Create a function to add bonus marks  
    function bonusMarks(int _bonus) public onlyOwner 
    { 
         stdRecords[stdCount].marks =  
                    stdRecords[stdCount].marks + _bonus; 
    } 
}