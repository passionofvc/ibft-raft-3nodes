# ibft-raft-3nodes
quorum istanbul 3nodes set up

the detail see https://github.com/ConsenSys/quorum-examples/tree/master/examples/7nodes


```
#1 checkout
git clone https://github.com/passionofvc/ibft-raft-3nodes.git
cd ibft-raft-3nodes
NODE_HOME=`pwd`; echo "export NODE_HOME=$NODE_HOME" >> ~/.bashrc
```

```
#2 set up istanbul 
cd $NODE_HOME
source ~/.bashrc
bash set_up_istanbul_nodes.sh
```

```
#3 set up raft
cd $NODE_HOME
source ~/.bashrc
bash set_up_raft_nodes.sh
```

```
#4 input Permissions info
---------------------------------------------------------------------
Input Permissions Specific parameters
---------------------------------------------------------------------
Enter Network Admin Org Name: admin
Enter Network Admin Role Name: admin
Enter Org Admin Role Name: admin
For Sub Orgs
Enter Allowed Breadth [numeric]: 1
Enter Allowed Depth [numeric]: 1
---------------------------------------------------------------------
```
