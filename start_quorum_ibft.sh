#start quorum service
cd $NODE_HOME
export STARTPERMISSION=1
/bin/bash start.sh istanbul tessera --verbosity 3 --blockPeriod 5
