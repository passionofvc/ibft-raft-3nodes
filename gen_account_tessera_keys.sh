#
numNodes="$@"

rm -rf $NODE_HOME/keys/*
for i in `seq 1 ${numNodes}`
do
    geth account new --keystore $NODE_HOME/keys  --password <(cat $NODE_HOME/passwords.txt)
    mv $NODE_HOME/keys/UTC* $NODE_HOME/keys/key$i
done;

for i in `seq 1 ${numNodes}`
do
    java -jar $TESSERA_JAR -keygen --encryptor.type NACL --keyout -filename $NODE_HOME/keys/tm${i} --debug </dev/null
done;


