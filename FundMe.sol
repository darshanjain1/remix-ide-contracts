// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 50*1E18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    address public immutable i_owner;
    uint256 public result = 0;
    constructor(){
        i_owner= msg.sender;
    }

    function fund() public payable returns (uint256) {
        // set minimum amount $50 to allow funding
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Insufficient amount to fund"); 
            funders.push(msg.sender);
            addressToAmountFunded[msg.sender] = msg.value;
            return msg.value;
    }

    function withdraw() public onlyOwner {
        for(uint256 fundersIndex; fundersIndex<funders.length;fundersIndex++){
            address funder = funders[fundersIndex];
            // addressToAmountFunded[funder]= 0;
            delete addressToAmountFunded[funder];
        }
        // funders= new address[](0);
        delete funders;
        // transfer
    //    payable(msg.sender).transfer(address(this).balance);
    //    //send
    //    bool sendSuccess= payable(msg.sender).send(address(this).balance);
    //    require(sendSuccess, "sending failed");
    //     // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance,gas:23000}("");
        require(callSuccess, "call failed");
    }

    modifier onlyOwner{
        // require(msg.sender == i_owner, "Only owner can call this function");
        if(msg.sender != i_owner) revert NotOwner();
        _;
    }

    receive() external payable{
        result=1;
        fund();
    }
    
    fallback() external payable
    {
        result=2;
        fund();
    }
}

//2407 * 13000000000 = 3.1291×10¹³ = 31291000000000 = $0.054519248
//351 * 13000000000 =  4.563×10¹² = 4563000000000 = $ 0.007950252

// without Immutable getting owner value gas cost 2558 * 13000000000 = 33254000000000 = $0.057939442
// with immutable getting owner value gas cost  444 * 13000000000 = 5772000000000 = $0.010056729