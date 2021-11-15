const Migrations = artifacts.require("ContratoCompra");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};