#!/bin/bash

set -e

# مشخصات شبکه
CHAIN_NAME="RAAKH"
COIN_NAME="KHAS"
TOKEN_SUPPLY="1000000000000000000000000" # 1 میلیون توکن با 18 اعشار

# مسیر نصب
INSTALL_DIR="$HOME/raakh-node"
GENESIS_FILE="$INSTALL_DIR/genesis.json"
NODE_KEY_DIR="$INSTALL_DIR/keys"

# رنگ‌ها برای خروجی
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}1. نصب پیش‌نیازها...${NC}\n"
sudo apt update && sudo apt install -y git make gcc g++ curl unzip wget build-essential

printf "${GREEN}2. نصب Golang...${NC}\n"
GO_VERSION="1.21.6"
wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin >> ~/.bashrc && source ~/.bashrc
rm go$GO_VERSION.linux-amd64.tar.gz

echo "Go version: $(go version)"

printf "${GREEN}3. دریافت و ساخت Polygon Edge...${NC}\n"
mkdir -p $INSTALL_DIR && cd $INSTALL_DIR
git clone https://github.com/0xPolygon/polygon-edge.git
cd polygon-edge
make build

EDGE_BIN="$INSTALL_DIR/polygon-edge/build/bin/polygon-edge"

printf "${GREEN}4. ساخت کلید نود...${NC}\n"
mkdir -p $NODE_KEY_DIR
$EDGE_BIN secrets init --data-dir $NODE_KEY_DIR
NODE_ADDRESS=$($EDGE_BIN secrets output --data-dir $NODE_KEY_DIR | grep Address | awk '{print $2}')

printf "${GREEN}آدرس نود: $NODE_ADDRESS${NC}\n"

printf "${GREEN}5. ساخت genesis.json با IBFT...${NC}\n"
$EDGE_BIN genesis --consensus ibft \  
  --ibft-validator-type bls \  
  --block-gas-limit 100000000 \  
  --name "$CHAIN_NAME" \  
  --premine "$NODE_ADDRESS:$TOKEN_SUPPLY" \  
  --validators "$NODE_ADDRESS" \  
  --chain-id 1999 \  
  --bootnode /ip4/127.0.0.1/tcp/1478/p2p/$NODE_ADDRESS > $GENESIS_FILE

printf "${GREEN}6. راه‌اندازی نود با RPC...${NC}\n"
nohup $EDGE_BIN server \
  --data-dir $INSTALL_DIR/data \
  --chain $GENESIS_FILE \
  --grpc-address 0.0.0.0:9632 \
  --jsonrpc-address 0.0.0.0:8545 \
  --libp2p 0.0.0.0:1478 \
  --prometheus 0.0.0.0:9090 \
  --seal=true \
  --private-key $NODE_KEY_DIR/validator.key > raakh.log 2>&1 &

sleep 3
printf "${GREEN}🎉 شبکه $CHAIN_NAME راه‌اندازی شد. RPC در دسترس: http://localhost:8545${NC}\n"
echo "👛 آدرس مالک: $NODE_ADDRESS"
echo "📄 فایل genesis: $GENESIS_FILE"
echo "📦 فایل لاگ: $INSTALL_DIR/raakh.log"
