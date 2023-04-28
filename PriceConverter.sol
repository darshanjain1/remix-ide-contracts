// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

    import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

  function getPrice() internal view returns (uint) {
      // Sepoli Testnet 0x694AA1769357215DE4FAC081bf1f309aDC325306
      // Goerli Testnet 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

    AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
            /*uint80 roundId*/,
            int256 price,
            /*uint256 startedAt */,
            /*uint256 updatedAt */,
            /*uint80 answeredInRound */

        ) = priceFeed.latestRoundData();
        return uint256(price* 1E10);
        // ETH in terms of USD
    }
    function getConversionRate(uint256 ethAmountj) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd =  (ethAmountj * ethPrice)/1e18;
        return ethAmountInUsd;
    }
}