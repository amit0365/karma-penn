// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
require('dotenv').config();
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const API_KEY = process.env.API_KEY;
const CONTRACT_ADDRESS=process.env.CONTRACT_ADDRESS;
const CONTRACT_ABI=process.env.CONTRACT_ABI;
const PUBLIC_KEY=process.env.PUBLIC_KEY;

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const weiAmount = (await deployer.getBalance()).toString();
  
  console.log("Account balance:", (await ethers.utils.formatEther(weiAmount)));

  // make sure to replace the "GoofyGoober" reference with your own ERC-20 name!
  const Token = await ethers.getContractFactory("Karma");
  const token = await Token.deploy();

  const balance = await token.balanceOf(deployer.address)


  console.log("Token address:", token.address);
  console.log("Balance:", balance);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});