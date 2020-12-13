const path = require('path')
const fs = require('fs');

const genesis_file = './genesis.json';
const data = require(genesis_file);


function updateGenesisFile(){
  //update
  Object.keys(data).forEach(function(key) {
    if (key === 'config') {
        console.log(key)
        delete data[key]["maxCodeSize"]
        data[key]["petersburgBlock"] = 0;
        data[key]["istanbulBlock"] = 0;
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
