pragma solidity ^0.8.11;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface Swaps {
  function get_best_rate(IERC20 _from, IERC20 _to, uint256 _amount) external view returns (address, uint256);
}
