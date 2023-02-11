module.exports = {
   networks: {
       development: {
           host: "localhost",
           port: 8545 , //||process.env.PORT,
           network_id: "*" // Match any network id
       }
   }
};