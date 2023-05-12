pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfProducts; // Total number of products.
    address contractOwner;

    struct myStruct {
        uint   number;
        string productName;
        string location;
        uint timestamp;
    }

    myStruct[] public productes;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addProStru (uint _initNumber, string _firstString, string _secondString) public {
        productes.push(myStruct(_initNumber,_firstString,_secondString, now)) -1;
        numberOfProducts++;
    }

    //Returns the number of product registrations.
    function getNumOfProducts() public constant returns(uint8) {
        return numberOfProducts;
    }
    
    function getAllproducts() public view returns (myStruct[]) {
        return productes;
        
    }

    //Returns the name of the product corresponding to the number.
    function getProductStruct(uint _index) public view returns (uint, string, string, uint) {
        return (productes[_index].number, productes[_index].productName, productes[_index].location, productes[_index].timestamp);
    }

    //Delete the contract.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}