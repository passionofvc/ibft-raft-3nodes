numNodes="$@"

rm -rf ${NODE_HOME}/config.toml
echo 'vanity = "0x00"' >> ${NODE_HOME}/config.toml
echo 'validators = ['  >> ${NODE_HOME}/config.toml

for i in `seq 1 ${numNodes}`
do
    address=$(cat ${NODE_HOME}/keys/key${i} | jq -r .address)
    echo -n '"'0x$address'"' >> ${NODE_HOME}/config.toml
    if [[ "$i" != "${numNodes}" ]]; then
        echo ','             >> ${NODE_HOME}/config.toml
    fi
done;
echo >> ${NODE_HOME}/config.toml
echo ']'               >> ${NODE_HOME}/config.toml

