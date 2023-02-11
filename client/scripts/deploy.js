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
//const contract=require("./Oracle.json");
abi=[
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "previousOwner",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "newOwner",
        "type": "address"
      }
    ],
    "name": "OwnershipTransferred",
    "type": "event"
  },
  {
    "inputs": [],
    "name": "addTestData",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "score",
        "type": "uint256"
      }
    ],
    "name": "awardToken",
    "outputs": [
      {
        "internalType": "bool[]",
        "name": "",
        "type": "bool[]"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "owner",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "testConnection",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "pure",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "newOwner",
        "type": "address"
      }
    ],
    "name": "transferOwnership",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
]
const alchemyProvider = new ethers.providers.AlchemyProvider(network="goerli", API_KEY);
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider);
const oracleContract = new ethers.Contract("0x3fc99bea9b448dfb2C873CCc4b76335204069f4c",abi,signer);

async function main() {
  const [deployer] = await ethers.getSigners();


  console.log("Deploying contracts with the account:", deployer.address);

  const weiAmount = (await deployer.getBalance()).toString();
  
  console.log("Account balance:", (await ethers.utils.formatEther(weiAmount)));


  /*
  const Token = await ethers.getContractFactory("Karma");
  const token = await Token.deploy();

  const balance = await token.balanceOf(deployer.address)


  console.log("Token address:", token.address);
  console.log("Balance:", balance);
  */



  const Badges = await ethers.getContractFactory("Disperse");
  const badges = await Badges.deploy();


  //const contract = 


  //const balance = await token.balanceOf(deployer.address)
  //oracleAddy=CONTRACT_ADDRESS;
  //const oracleContractABI = CONTRACT_ABI


  //const deployed=await badges.setOracleAddress(oracleAddy);
  //const orcaddress = await badges.getOracleAddress();
  const works = await oracleContract.testConnection();

  //console.log("Deployed", deployed);
  //console.log("Address", orcaddress);
  console.log("Works", works);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});