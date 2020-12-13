const path = require('path')
const fs = require('fs');

const genesis_file = './genesis.json';
const data = require(genesis_file);


function updateGenesisFile(){
  //update
  Object.keys(data).forEach(function(key) {
    if (key === 'config') {
        let conf = data[key]
        Object.keys(conf).forEach(function(key) {
            if (key === "maxCodeSize") {
                delete conf[key];
            }
            conf["petersburgBlock"] = 0;
            conf["istanbulBlock"] = 0;
        })
    }
  })

  console.log(JSON.stringify(data));
  //write to genesis.json
  fs.writeFile(genesis_file, JSON.stringify(data,null,2), function writeJSON(err) {
      if (err) return console.log(err);
      //console.log(JSON.stringify(data));
      console.log('writing to ' + genesis_file);
  });

}

updateGenesisFile()
