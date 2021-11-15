const Migrations = artifacts.require("UserContract");

module.exports = function(deployer) {
  deployer.deploy(Migrations, {overwrite: false});
};