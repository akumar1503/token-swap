# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

# Setup
Add you infura or alchemy key to `hardhat.networks.js` file. 

Run `npx hardhat test` to test.

# About
It has one smart contract which queries curve [pools](https://curve.fi/) to get
best exchange rates between two coins.

Coin pairs can be changed in test files `test/CurveOracle.js` to the required pair.