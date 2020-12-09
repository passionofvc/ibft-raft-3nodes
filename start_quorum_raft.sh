#start quorum service
cd $NODE_HOME
export STARTPERMISSION=1
/bin/bash start.sh raft tessera --verbosity 3 --blockPeriod 50
