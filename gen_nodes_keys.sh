#
numNodes="$@"

rm -rf $NODE_HOME/raft/nodekey*
for i in `seq 1 ${numNodes}`
do
    openssl ecparam -genkey -name secp256k1 -out data.pem
    openssl ec -in data.pem -outform DER|tail -c +8|head -c 32|xxd -p -c 32 | tail -n 1 > $NODE_HOME/raft/nodekey${i}
done;

rm -rf $NODE_HOME/data.pem

