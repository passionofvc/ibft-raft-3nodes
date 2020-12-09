# solidity.0.5.3

download solidity from git release
cd $NODE_HOME/app
mkdir -p solidity.0.5.3 && cd solidity.0.5.3
wget "https://github.com/ethereum/solidity/releases/download/v0.5.3/solc-static-linux" -O solc
SOLIDITY_DIR=`pwd`; echo "export PATH=$SOLIDITY_DIR:\$PATH" >> ~/.bashrc
