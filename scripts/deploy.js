const hre = require("hardhat");

// async function main() {
//   const deployedContract = await hre.ethers.deployContract("Factory");
//   await deployedContract.waitForDeployment();
//   console.log(
//     `Contract deployed to https://explorer.toronto.sx.technology/address/${deployedContract.target}`
//   );
// }

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Factory = await hre.ethers.getContractFactory("Factory");
  const deployedContract = await Factory.deploy(deployer.address);
  await deployedContract.waitForDeployment();
  const address = await deployedContract.getAddress();
  console.log(`Contract deployed to adddress: ${address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
