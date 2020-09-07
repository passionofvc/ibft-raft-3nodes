numNodes="$@"
ip='127.0.0.1'


rm -rf ${NODE_HOME}/static-nodes.json

basePort=21000
baseRaftPort=50401

echo '['   >> ${NODE_HOME}/static-nodes.json
for i in `seq 1 ${numNodes}`
do
    port=$(($basePort + ${i} - 1))
    raftPort=$(($baseRaftPort + ${i} - 1))
    node_id=$( bootnode --writeaddress --nodekey=${NODE_HOME}/raft/nodekey${i} )
    echo -n '"'"enode://$node_id@$ip:$port?discport=0&raftport=$raftPort"'"' >> ${NODE_HOME}/static-nodes.json
    if [[ "$i" != "${numNodes}" ]]; then
         echo ','             >> ${NODE_HOME}/static-nodes.json
    fi
done;

echo       >> ${NODE_HOME}/static-nodes.json
echo ']'   >> ${NODE_HOME}/static-nodes.json

cp -p ${NODE_HOME}/static-nodes.json ${NODE_HOME}/permissioned-nodes.json
