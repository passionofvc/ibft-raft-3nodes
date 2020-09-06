# ibft-raft-3nodes
quorum istanbul 3nodes set up

the detail see https://github.com/ConsenSys/quorum-examples/tree/master/examples/7nodes


```
#1 checkout
git clone https://github.com/passionofvc/ibft-raft-3nodes.git
cd ibft-raft-3nodes
NODE_HOME=`pwd`; echo "export NODE_HOME=$NODE_HOME" >> ~/.bashrc

#2 set up
cd $NODE_HOME
bash set_up_istanbul_nodes.sh
```
