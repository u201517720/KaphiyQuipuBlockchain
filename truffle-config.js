const HDWalletProvider = require("truffle-hdwallet-provider");
const mnemonic  = 'purchase armor sponsor secret crawl battle gauge sorry relief either little slide';
const fs = require("fs");

module.exports = {
    // See <http://truffleframework.com/docs/advanced/configuration>
    // to customize your Truffle configuration!
    networks: {
        development: {
            host: "localhost",
            port: 7545,
            network_id: "*",
            gas: 5000000
        },
        rinkeby: {
            provider: () => new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/4acb060dfb3a436f8e88a63ecf15091f'),
            network_id: 4
        },
        ropsten: {
            provider: () => new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/4acb060dfb3a436f8e88a63ecf15091f'),
            network_id: 3,
            gas: 4000000
        }
    },
    // compilers: {
    //     solc: {
    //         version: "0.7.0"
    //     }
    // }
    compilers: {
        solc: {
            version: "0.5.0"
        }
    }
};
