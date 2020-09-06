#go1.14.5以上

cd $NODE_HOME/app
git clone https://github.com/passionofvc/istanbul-tools.git
cd istanbul-tools
make

echo 'export PATH=$NODE_HOME/app/istanbul-tools/build/bin:$PATH' >> ~/.bashrc

