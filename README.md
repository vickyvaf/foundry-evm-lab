# Token Project

A custom ERC20 Token project built with Foundry.

## Overview

This project implements a standard ERC20 token using OpenZeppelin contracts, featuring:

- **Name**: `Token`
- **Symbol**: `TOKEN`
- **Access Control**: Owner-only minting.
- **Constraints**: Custom `maxMint` modifier limiting mints to a maximum of 100 tokens per transaction.

## Contract Architecture

- `src/Token.sol`: The main token contract inheriting from `ERC20` and `Ownable`.
- `script/Token.s.sol`: Deployment script for the Base Sepolia testnet.

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed on your machine.

## Usage

### 1. Build

Compile the smart contracts:

```shell
$ forge build
```

### 2. Test

Run the test suite (if available):

```shell
$ forge test
```

### 3. Deploy

The project is configured to deploy to **Base Sepolia**.

#### Setup Environment

Ensure your `.env` file is configured with the necessary keys (as used in `foundry.toml` and `script/Token.s.sol`):

```ini
BASE_SEPOLIA_RPC_URL=https://sepolia.base.org
BASE_SEPOLIA_PRIVATE_KEY=0x...
```

#### Run Deployment Script

Load the environment variables and run the script:

```shell
$ source .env
$ forge script script/Token.s.sol:TokenScript --rpc-url base_sepolia --broadcast
```

## Tools

- **Forge**: Compile, test, and deploy smart contracts.
- **Cast**: Interact with the blockchain and smart contracts from the command line.
- **Anvil**: Local Ethereum node for testing.
