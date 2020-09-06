const path = require('path')
const fs = require('fs');

const genesis_file = './genesis.json';
const data = require(genesis_file);

const keyFolder = './keys/';
const dirpath = path.join(__dirname, '/keys')

//add new alloc
let new_alloc ={};
fs.readdir(dirpath, async function(err, files) {
  const keyFiles = files.filter(key => /^key/.test(key));
  //console.log( keyFiles );
  for ( let keyFile of keyFiles) {
      const f = __dirname+'/keys/'+keyFile;
      const data = await readFile(f);
      const address  = JSON.parse(data).address;
      new_alloc[address] = { "balance": "0x446c3b15f9926687d2c40534fdb564000000000000"};
  }
  updateGenesisFile();
})

async function readFile(path) {
    return new Promise((resolve, reject) => {
      fs.readFile(path, 'utf8', function (err, data) {
        if (err) {
          reject(err);
        }
        resolve(data);
      });
    });
}

function updateGenesisFile(){
  //comment out to persist existing alloc
  /*
  let old_alloc=data['alloc'];
  Object.keys(old_alloc).forEach(function(key) {
      new_alloc[key] = old_alloc[key];
  })
  */

  //update new alloc
  Object.keys(data).forEach(function(key) {
    if (key == 'alloc') {
        data[key]=new_alloc;
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
