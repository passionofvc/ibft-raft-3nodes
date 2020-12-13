#go1.14.5以上

#cd $NODE_HOME/app
#rm -rf istanbul-tools 1>/dev/null 2>&1
#git clone https://github.com/passionofvc/istanbul-tools.git
#cd istanbul-tools
#make

OS=$(uname -s)
ISTANBUL_DIR=
if [[ ${OS} == "Darwin" ]] ; then
    ISTANBUL_DIR="\$NODE_HOME/app/istanbul-tools/mac/build/bin"
elif  [[ ${OS} == "Linux" ]] ; then
    ISTANBUL_DIR="\$NODE_HOME/app/istanbul-tools/linux/build/bin"
fi

echo 'export PATH=$ISTANBUL_DIR:$PATH' >> ~/.bashrc

