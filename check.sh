cat keys/key1  | jq .address
cat keys/key2  | jq .address
cat keys/key3  | jq .address

cat qdata/dd1/permission-config.json  | jq .accounts
cat qdata/dd2/permission-config.json  | jq .accounts
cat qdata/dd3/permission-config.json  | jq .accounts

data=$(cat istanbul-genesis.json | jq -r .extraData)
istanbul extra decode --extradata ${data}

n1=$(cat qdata/dd1/geth/nodekey)
n2=$(cat qdata/dd2/geth/nodekey)
n3=$(cat qdata/dd3/geth/nodekey)
istanbul address --nodekeyhex ${n1}
istanbul address --nodekeyhex ${n2}
istanbul address --nodekeyhex ${n3}



