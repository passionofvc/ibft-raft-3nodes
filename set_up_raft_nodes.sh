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

sed $R "s/ed9d02e382b34818e88b88a309c7fe71e65f419d/$key1/g" start-permission.sh
if [[ "${NUM_NODES}" -gt 1 ]]; then
   sed $R "s/ca843569e3427144cead5e4d5999a3d0ccf92b8e/$key2/g" start-permission.sh
fi

#start raft nodes
bash start-permission.sh raft tessera --numNodes ${NUM_NODES}

