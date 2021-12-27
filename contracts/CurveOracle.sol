pragma solidity ^0.8.11;

// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./interfaces/curve/AddressProvider.sol";

contract CurveOracle {
  Swaps public registry;
  AddressProvider public addressProvider;

  constructor(address _addressProvider) {
    addressProvider = AddressProvider(_addressProvider);
    registry = addressProvider.get_address(2); // get registry address
  }

  function getRate(IERC20 srcToken, IERC20 dstToken) external view returns (uint256 rate, address pool) {
    // @returns: rate rate in 18 decimal places
    // @returns: pool pool used to get the rate

    // few tokens like USDT, USDC use 6 decimals, convert each to 18 decimal places
    uint8 srcDecimals = ERC20(address(srcToken)).decimals();
    uint8 dstDecimals = ERC20(address(dstToken)).decimals();

    uint256 srcAmount = 1 * (10 ** srcDecimals);
    (pool, rate) = registry.get_best_rate(srcToken, dstToken, srcAmount);

    rate = rate * (10 ** (18 - dstDecimals));

    return (rate, pool);
  }
}