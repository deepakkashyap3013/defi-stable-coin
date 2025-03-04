## Defi Stable Coin project

This project is meant to be a stablecoin where users can deposit WETH and WBTC in exchange for a token that will be pegged to the USD.

### Protocol architecture

1. Has relative stability: Anchored or Pegged to USD
    1. Chainlink Price Feed
    2. Set a function to exchange wETH & wBTC -> $$$
2. Stability Mechanism (Minting): Algorithmic(Decentralized)
    1. People can only mint the stablecoin with enough collateral (coded)
3. Collateral: Exogenous (Crypto)
    1. wETH
    2. wBTC
