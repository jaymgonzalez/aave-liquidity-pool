// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {FlashLoanSimpleReceiverBase} from "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

contract MarketInteractions {
    address payable owner;

    IPoolAddressesProvider public immutable ADDRESS_PROVIDER;
    IPool public immutable POOL;

    address public immutable linkAddress =
        0x07C725d58437504CA5f814AE406e70E21C5e8e9e;
    IERC20 private link;

    constructor(address _addressProvider) {
        ADDRESS_PROVIDER = _addressProvider;
        POOL = IPool(ADDRESS_PROVIDER.getPool());
        owner = payable(msg.sender);
        link = IERC20(linkAddress);
    }

    function supplyLiquidity(address _tokenAddress, uint _amount) external {
        POOL.supply(_tokenAddress, amount, 0x0, 0)
    }

    function withdrawLiquidity(address _tokenAddress, uint _amount) external returns (uint) {

    }
}


//   function withdraw(
//     address asset,
//     uint256 amount,
//     address to
//   ) external returns (uint256);