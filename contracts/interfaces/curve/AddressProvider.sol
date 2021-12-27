pragma solidity ^0.8.11;

// SPDX-License-Identifier: MIT

import "./Swaps.sol";

interface AddressProvider {
  function get_address(uint256 _id) external view returns (Swaps);
}
