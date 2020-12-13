NUM_NODES=3

#get app,tools
cd $NODE_HOME/app
bash istanbul-tools-build.sh
bash tessera-build.sh
bash get_solidity.0.5.3.sh

#gen account keys, tessera keys
cd $NODE_HOME
bash gen_account_tessera_keys.sh ${NUM_NODES}

#update genesis account alloc
cd $NODE_HOME
node update_genesis_account.js

#gen nodekey
bash gen_nodes_keys.sh ${NUM_NODES}

#update extraData in genesis.json
bash update_extra_validator.sh ${NUM_NODES}


#create raft static.json
bash create_raft_static_json.sh ${NUM_NODES}


#update permission account
cd $NODE_HOME
key1=$( cat keys/key1 | jq -r .address)
if [[ "${NUM_NODES}" -gt 1 ]]; then
   key2=$( cat keys/key2 | jq -r .address)
fi

OS=$(uname -s)
R=
if [[ ${OS} == "Darwin" ]] ; then
    R=" -i.bak "
elif  [[ ${OS} == "Linux" ]] ; then
    R=" -i "
fi

sed $R "s/0xf86749905165e22326639191df5c27719b5f7fa0/$key1/g" start-permission.sh
if [[ "${NUM_NODES}" -gt 1 ]]; then
   sed $R "s/0xf44d866d7a5ef8f06dd8f2b2afa508304227ba86/$key2/g" start-permission.sh
fi

pub_key=$( cat keys/tm1.pub )
echo "TM_PUB_KEY=${TM_PUB_KEY}"
sed $R "s/TM_PUB_KEY/$pub_key/g" private-contract.js

#start raft nodes
bash start-permission.sh raft tessera --numNodes ${NUM_NODES}

