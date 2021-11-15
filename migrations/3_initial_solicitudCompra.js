const Migrations = artifacts.require("SolicitudCompra");

module.exports = function(deployer) {
  deployer.deploy(Migrations, {overwrite: false});
};