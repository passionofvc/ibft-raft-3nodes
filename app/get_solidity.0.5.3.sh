# solidity.0.5.3
#download solidity from git release

#cd $NODE_HOME/app
#mkdir -p solidity.0.5.3 && cd solidity.0.5.3
#wget "https://github.com/ethereum/solidity/releases/download/v0.5.3/solc-static-linux" -O solc
#chmod u+x solc

OS=$(uname -s)
SOLIDITY_DIR=
if [[ ${OS} == "Darwin" ]] ; then
    SOLIDITY_DIR="\$NODE_HOME/app/solidity.0.5.3/mac"
elif  [[ ${OS} == "Linux" ]] ; then
    SOLIDITY_DIR="\$NODE_HOME/app/solidity.0.5.3/linux"
fi
echo "export PATH=$SOLIDITY_DIR:\$PATH" >> ~/.bashrc
