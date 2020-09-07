NUM_NODES=3

#get app,tools
cd $NODE_HOME/app
bash tessera-build.sh

source ~/.bashrc
#gen account keys, tessera keys
cd $NODE_HOME
bash gen_account_tessera_keys.sh ${NUM_NODES}

#update genesis account
cd $NODE_HOME
node update_genesis_account.js


#gen nodekey
bash gen_nodes_keys.sh

#update permission account
cd $NODE_HOME
key1=$( cat keys/key1 | jq -r .address)
key2=$( cat keys/key2 | jq -r .address)

OS=$(uname -s)
R=
if [[ ${OS} == "Darwin" ]] ; then
    R=" -i '.bak' "
elif  [[ ${OS} == "Linux" ]] ; then
    R=" -i "
fi
sed $R "s/ed9d02e382b34818e88b88a309c7fe71e65f419d/$key1/g" start-permission.sh
sed $R "s/ca843569e3427144cead5e4d5999a3d0ccf92b8e/$key2/g" start-permission.sh

#start istanbul nodes
bash start-permission.sh istanbul tessera --numNodes ${NUM_NODES} --istanbulTools

