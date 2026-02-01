// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

import {IUniswapV2Pair} from "./interfaces/IUniswapV2Pair.sol";

contract DexPriceReader {
    function getPrice(address pair, bool priceToken0) external view returns (uint256 price) {
        (uint112 r0, uint112 r1,) = IUniswapV2Pair(pair).getReserves();

        require(r0 > 0 && r1 > 0, "NO_LIQUIDITY");

        if (priceToken0) {
            price = (uint256(r1) * 1e18) / uint256(r0);
        } else {
            price = (uint256(r0) * 1e18) / uint256(r1);
        }
    }
}