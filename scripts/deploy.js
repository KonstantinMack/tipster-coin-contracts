const hre = require("hardhat");

async function main() {
  const deployedContract = await hre.ethers.deployContract("Factory");
  await deployedContract.waitForDeployment();
  console.log(
    `Contract deployed to https://explorer.toronto.sx.technology/address/${deployedContract.target}`
  );
}

// async function main() {
//   const [deployer] = await hre.ethers.getSigners();

//   console.log("Deploying contracts with the account:", deployer.address);

//   const Token = await hre.ethers.getContractFactory("Token");
//   const token = await Token.deploy(
//     "TestToken4",
//     "TT4",
//     1_000_000 * 10 ** 18
//   );
//   await token.waitForDeployment();
//   const address = await token.getAddress();
//   console.log(`Token address: ${address}`);
// }

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
