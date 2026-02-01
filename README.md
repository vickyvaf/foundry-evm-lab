## DEX Price Reader

Simple project to read DEX token price on-chain using Foundry.

Reads price directly from a DEX pair contract (example: Uniswap V2) using mainnet fork.

### What It Does
- Reads price from DEX pair (getReserves)
- No Uniswap SDK, no router, no API
- Tested with Foundry mainnet fork

### Tech
- Solidity ^0.8.33
- Foundry
