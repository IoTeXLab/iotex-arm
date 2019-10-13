cd ~

echo 'Installing required packages...'
sudo apt install htop jq gawk git  -y

echo 'Installing GoLang...'
wget https://dl.google.com/go/go1.11.5.linux-arm64.tar.gz
tar xzf go1.11.5.linux-arm64.tar.gz
sudo mv go /usr/local

echo 'export GOROOT=/usr/local/go' >> ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile

source .profile
go get github.com/fullstorydev/grpcurl
go install github.com/fullstorydev/grpcurl/cmd/grpcurl

echo 'Creating files & folders...'
mkdir -p ~/iotex-var
cd ~/iotex-var

export IOTEX_HOME=$PWD

mkdir -p $IOTEX_HOME/data
mkdir -p $IOTEX_HOME/log
mkdir -p $IOTEX_HOME/etc

curl https://raw.githubusercontent.com/iotexproject/iotex-bootstrap/master/config_testnet.yaml > $IOTEX_HOME/etc/config.yaml
curl https://raw.githubusercontent.com/iotexproject/iotex-bootstrap/master/genesis_testnet.yaml > $IOTEX_HOME/etc/genesis.yaml

echo 'Downloading latest blockchain snapshot...'
#curl -L https://t.iotex.me/mainnet-data-latest > $IOTEX_HOME/data.tar.gz

echo 'Extracting the snapshot, please be patient...'
#tar -xzf data.tar.gz

ip=$(wget http://ipinfo.io/ip -qO -)

echo 'Your Ip is '$ip
echo 'Editing the config file'
sed -i '2s/.*/  externalHost: '$ip'/' $IOTEX_HOME/etc/config.yaml

echo 'Installing the commandline tool ioctl...'

# Got to download the prebuilt tool here

# also download snapshot and custom start/stop commands

echo "Starting the node..."
~/bin/startNew

echo 'Run ~/bin/startLogs to see the node logs!'
echo 'Run ~/bin/killNode to stop the node!'
echo 'Run ~/bin/startNew to start the node!'
