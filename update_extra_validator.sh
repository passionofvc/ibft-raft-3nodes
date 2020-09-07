numNodes="$@"

rm -rf ${NODE_HOME}/config.toml
echo 'vanity = "0x00"' >> ${NODE_HOME}/config.toml
echo 'validators = ['  >> ${NODE_HOME}/config.toml

for i in `seq 1 ${numNodes}`
do
    address=$( geth --verbosity 0 account import  --password ${NODE_HOME}/passwords.txt --datadir . ${NODE_HOME}/raft/nodekey${i} | sed 's/Address: {\([0-9a-z].*\)}/\1/g' )
    echo -n '"'0x$address'"' >> ${NODE_HOME}/config.toml
    if [[ "$i" != "${numNodes}" ]]; then
        echo ','             >> ${NODE_HOME}/config.toml
    fi
done;

echo >> ${NODE_HOME}/config.toml
echo ']'               >> ${NODE_HOME}/config.toml

extraData=$( istanbul extra encode --config ${NODE_HOME}/config.toml | awk -F: '{print $2}' | sed 's/^ //g' )

sed -i.bak "/extraData/s/0x0000000000000000000000000000000000000000000000000000000000000000/${extraData}/g" ${NODE_HOME}/genesis.json

rm -rf genesis.json.bak keystore config.toml
