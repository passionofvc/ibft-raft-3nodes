# openjdk 11以上

#git clone https://github.com/ConsenSys/tessera.git
#cd tessera
#mvn install -Dmaven.test.skip=true

#download tessera from git release
#cd $NODE_HOME/app
#mkdir -p tessera && cd tessera
#wget https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/tessera-app/0.10.6/tessera-app-0.10.6-app.jar
#echo 'export TESSERA_JAR=$NODE_HOME/app/tessera/tessera-app-0.10.6-app.jar' >> ~/.bashrc

echo 'export TESSERA_JAR=$NODE_HOME/app/tessera/tessera-app-0.10.6-app.jar' >> ~/.bashrc
