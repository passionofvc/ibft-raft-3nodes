NUM_NODES=3

#get app,tools
cd $NODE_HOME/app
bash istanbul-tools-build.sh
bash tessera-build.sh
bash get_solidity.0.5.3.sh

source ~/.bashrc
#gen account keys, tessera keys
cd $NODE_HOME
bash gen_account_tessera_keys.sh ${NUM_NODES}

#gen istanbul genesis config
istanbul setup --quorum --save --num ${NUM_NODES} --nodes --verbose --nodeIp 127.0.0.1 --nodePortBase 21000 --nodePortIncrement 1


#update genesis account
cd $NODE_HOME
node update_genesis_account.js


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
diff start-permission.sh.bak start-permission.sh
if [[ "${NUM_NODES}" -gt 1 ]]; then
    sed $R "s/0xf44d866d7a5ef8f06dd8f2b2afa508304227ba86/$key2/g" start-permission.sh
    diff start-permission.sh.bak start-permission.sh
fi

pub_key=$( cat keys/tm1.pub )
echo "TM_PUB_KEY=${pub_key}"

sed $R "s@TM_PUB_KEY@${pub_key}@g" private-contract.js
diff private-contract.js.bak private-contract.js

#start istanbul nodes
bash start-permission.sh istanbul tessera --numNodes ${NUM_NODES} --istanbulTools

