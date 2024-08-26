const { network } = require("hardhat");

require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.24",
  network:{
    hardhat:{
      chainId:1337,
    },
  },
};
