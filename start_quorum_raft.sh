#start quorum service
cd $NODE_HOME
/bin/bash start.sh raft tessera --verbosity 3 --blockPeriod 50
