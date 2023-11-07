require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    toronto: {
      url: `https://rpc.toronto.sx.technology`,
      accounts: [process.env.ACCOUNT_PRIVATE_KEY],
    },
  },
};
