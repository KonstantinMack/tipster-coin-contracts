// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BalanceChecker {
    function checkBalance(
        address tokenAddress,
        address walletAddress,
        uint256 threshold
    ) external view returns (bool) {
        IERC20 token = IERC20(tokenAddress);
        uint256 balance = token.balanceOf(walletAddress);
        return balance >= threshold * 10**18;
    }
}
