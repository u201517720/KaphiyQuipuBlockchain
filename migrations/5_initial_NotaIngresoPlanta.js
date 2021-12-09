const NotaIngresoPlanta = artifacts.require("NotaIngresoPlanta");

module.exports = function(deployer) {
  deployer.deploy(NotaIngresoPlanta);
};