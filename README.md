# Dubai Marketplace Smart Contracts 🚀



This repository contains a set of smart contracts designed to facilitate the creation and trading of NFTs (Non-Fungible Tokens) within a decentralized marketplace. The system allows users to mint, buy, and trade NFTs using Ethereum-based ERC-20 and ERC-721 standards, providing a seamless experience for both token management and NFT transactions.


## 🔑 Key Features

- **DubaiERC1155**: A mintable multi-token standard (ERC1155) for creating and managing multiple types of tokens.
- **DubaiERC20**: A basic ERC-20 token to manage fungible tokens within the marketplace.
- **DubaiNFT**: An ERC-721 contract to mint unique, tradable NFTs representing digital assets.
- **Marketplace**: A decentralized marketplace for buying and selling NFTs. It enables users to purchase NFTs with Ether, while also rewarding them with Dubai ERC-20 tokens.

### Core Functionality

- **Minting NFTs**: NFTs are created and stored in the marketplace, allowing users to purchase them.
- **Buying NFTs**: Users can purchase NFTs by sending Ether to the marketplace contract. Upon a successful transaction, users receive a specified reward in ERC-20 tokens.
- **Token Rewards**: For every NFT purchase, users are rewarded with Dubai ERC-20 tokens.
- **Flexible Pricing**: The price of NFTs and the reward tokens can be adjusted by the owner of the contract.

---

## 🛠 Smart Contracts

### 1. **DubaiERC1155 (ERC1155 Multi-token)**

This contract implements the ERC1155 standard, allowing the creation of multiple types of tokens that can be minted in batches. Each token is associated with a unique URI.

- **Key functions**:
  - `mintDubaiMultitoken`: Mint a single type of multi-token.
  - `mintDubaiMultitokenBatch`: Mint multiple types of tokens in a batch.
  - `uri`: Retrieve the URI for a given token.

---

### 2. **DubaiERC20 (ERC20 Token)**

This contract implements a simple ERC-20 token with minting capabilities. The token is used as a reward mechanism within the marketplace.

- **Key functions**:
  - `mintDubaiERC20`: Mint new ERC-20 tokens to an account.

---

### 3. **DubaiNFT (ERC721 NFT)**

This contract implements the ERC-721 standard, which allows the creation of unique NFTs. The NFTs minted here represent digital collectibles.

- **Key functions**:
  - `mintDubaiNFT`: Mint a new NFT to a specified address.
  - `currentTokenId`: Retrieve the current token ID for the latest minted NFT.

---

### 4. **Marketplace**

This contract serves as the core of the marketplace. It handles the purchase and sale of NFTs, allowing users to interact with the NFT collection and buy them using Ether.

- **Key functions**:
  - `addNFTToMarketplace`: Mint a new NFT and add it to the marketplace.
  - `buyDubaiNFT`: Purchase an NFT using Ether. Upon purchase, users receive reward tokens (Dubai ERC-20).
  - `setNftPrice`: Set the price for NFTs.
  - `setRewardTokens`: Set the reward token amount for each purchase.
  - `withdraw`: Withdraw the Ether balance from the contract to the owner's address.
  - `getAvailableNFTs`: Retrieve a list of available NFTs in the marketplace.

---

## 🛠 Usage

### 1. **Deploying Contracts**
You can deploy the contracts to an Ethereum testnet (e.g., Rinkeby) or mainnet using Truffle or Hardhat.

### 2. **Mint NFTs**
As the contract owner, you can mint NFTs and add them to the marketplace.

### 3. **Buying NFTs**
Users can buy NFTs by sending Ether to the marketplace contract. The purchase price is configurable, and users will receive Dubai ERC-20 tokens as rewards.

### 4. **Withdraw Funds**
The owner can withdraw accumulated Ether using the withdraw function.

---

## 🔒 Security Considerations
- The contracts include basic security checks to prevent invalid token minting.
- Only registered users can buy lottery tickets, ensuring fair participation.
- Funds are securely stored in the smart contract until distribution.
- Transactions are completed only if users have sufficient funds.

--- 

## 🚀 Future Enhancements
- Implementing additional token standards like ERC-1155 for batch ticketing.
- Integrating a frontend for a seamless user experience.
- Adding advanced lottery features such as bidding, auctions, or staking.

---
## 📥 Installation

To get started with the project, clone this repository and install the required dependencies:

```bash
git clone https://github.com/yourusername/dubai-marketplace.git
cd dubai-marketplace
npm install

```
