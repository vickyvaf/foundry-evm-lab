// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

import {Test, console} from "forge-std/Test.sol";
import {DexPriceReader} from "../src/DexPriceReader.sol";

// forge test --match-contract DexPriceReaderTest -vvv
contract DexPriceReaderTest is Test {
    DexPriceReader reader;

    // example: USDC/WETH Uniswap V2 pair (MAINNET)
    address constant PAIR = 0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc;

    // assume kurs (OFF-CHAIN)
    uint256 constant USD_TO_IDR = 16_800;

    function setUp() public {
        vm.createSelectFork(vm.envString("MAINNET_RPC_URL"));
        reader = new DexPriceReader();
    }

    function testGetPrice() public view {
        uint256 price = reader.getPrice(PAIR, true); // 1 WETH in USDC (1e18)

        uint256 priceUSD = price / 1e18;
        uint256 priceIDR = priceUSD * USD_TO_IDR;

        console.log("=== DEX PRICE CHECK ===");
        console.log("Pair        : USDC / WETH (Uniswap V2)");
        console.log("Meaning     : 1 WETH price");
        console.log("------------------------");
        console.log("USD (USDC)  : %s USD", priceUSD);
        console.log("IDR (est.)  : %s IDR", priceIDR);
        console.log("------------------------");
        console.log("Raw (1e18)  : %s", price);

        assertTrue(price > 0);
    }
}
