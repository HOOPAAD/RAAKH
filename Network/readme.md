# 📘 RAAKH Network – Ethereum L2 Powered by OP Stack

**RAAKH** is a reproducible, developer-friendly Layer 2 blockchain built on [Optimism's OP Stack](https://stack.optimism.io/). Designed for experimentation, education, and sovereign infrastructure, it offers a modular, open-source foundation for anyone who wants to launch their own Ethereum-compatible chain.

This repository provides everything you need to fully reproduce the RAAKH network setup from scratch, including:
- Custom `genesis.json` configuration  
- A ready-to-run OP Stack bundle powered by [Kurtosis](https://kurtosis.com/)  
- Secure Nginx-based RPC gateway with SSL  
- Automated installer script (`install-raakh.sh`)  
- Configs for launching via Docker and Kurtosis

> **Goal:** Enable developers and researchers to spin up their own EVM-compatible network with zero prior experience in blockchain infrastructure or DevOps.
---

## 🔧 Features

RAAKH Network is a fully modular, developer-friendly Ethereum Layer 2 blockchain built on Optimism’s OP Stack. This repository provides everything needed to run, extend, and fork the chain.

Key features include:

- ✅ **EVM Compatibility**  
  RAAKH runs on `op-geth`, maintaining full Ethereum Virtual Machine support. Deploy and interact with any Solidity smart contracts using standard tools.

- 🦊 **MetaMask Integration**  
  The network is compatible with MetaMask and other EVM wallets. Users can add it manually via custom RPC settings and start transacting or deploying contracts instantly.

- 🧱 **Token & NFT Deployment**  
  Supports full development workflows for creating ERC-20 tokens, ERC-721 NFTs, and complex DeFi contracts using [Remix](https://remix.ethereum.org/), [Hardhat](https://hardhat.org/), Truffle, and other Ethereum-based IDEs.

- 🚀 **OP Stack Architecture**  
  Based on Optimism’s modular architecture, RAAKH uses `op-node`, `op-geth`, and a fully orchestrated configuration via `kurtosis.yml` and `network_params.yaml`.

- 📦 **One-Line Setup with Kurtosis**  
  Launch all core services (execution layer, batcher, proposer, bridge, etc.) inside Docker containers using [Kurtosis](https://docs.kurtosis.com/). Minimal system prep required.

- 🔐 **SSL-Enabled RPC Endpoint**  
  Provides secure HTTPS-based JSON-RPC access via Nginx and Certbot, allowing applications to connect over `https://rpc.raakh.net`.

- 🧪 **Developer-Ready Genesis**  
  Includes a preconfigured `genesis.json` with test accounts, unlocked balances, and rapid block production for development environments.

- 📁 **Structured Configuration Files**  
  - `install-raakh.sh` – one-shot auto installer  
  - `kurtosis.yml`, `network_params.yaml` – OP Stack deployment config  
  - `nginx.conf` – production-ready reverse proxy and SSL routing

- 📚 **Ultra-Detailed Documentation**  
  The setup guide walks through every step—even for users with zero blockchain or Linux background.

- ⚙️ **Containerized & Reproducible**  
  Everything runs in isolated Docker containers. No dependency hell. No version mismatches.

- 🧩 **Forkable by Design**  
  Easily change the chain ID, block time, token metadata, or premined accounts to build your own L2 network based on RAAKH.

---

## ⚙️ Requirements

To fully deploy the RAAKH Network and run the OP Stack infrastructure on your server, the following requirements must be met:

### 🖥️ System Requirements

- **Operating System**: Ubuntu 22.04 LTS (or later)
- **User Access**: Full `root` privileges
- **Disk Space**: Minimum 25 GB (recommended: 40+ GB)
- **RAM**: Minimum 4 GB (8+ GB recommended)
- **CPU**: 2 vCPUs or more

### 🌐 Domain & DNS

- A domain name such as `rpc.raakh.net` must:
  - Point to your server’s public IP via **A Record**
  - Be accessible over ports `443` (HTTPS) and `80` (HTTP)
- SSL certificates will be provisioned using **Certbot**

### 📡 Required Open Ports

Ensure the following TCP ports are open and not blocked by firewall:

| Port   | Purpose                       |
|--------|-------------------------------|
| 443    | HTTPS for RPC over SSL        |
| 80     | HTTP (Certbot challenge)      |
| 8545   | HTTP JSON-RPC (default RPC)   |
| 9545   | P2P / Internal OP Stack port  |
| 30303  | Ethereum P2P (Discovery/Gossip) |
| 9001   | OP Node communication / bridge |

### 🧰 Required Tools

These tools will be installed automatically using the `install-raakh.sh` script, but you can preinstall them if needed:

- `curl`
- `git`
- `docker`
- `docker-compose`
- `nginx`
- `certbot` (`python3-certbot-nginx`)
- `bash`
- `systemd`
- [Kurtosis CLI](https://docs.kurtosis.com/) (automatically downloaded in the script)

### 📁 File & Directory Requirements

Make sure the following files exist in the project before launching:

| File / Folder                      | Purpose                                |
|-----------------------------------|----------------------------------------|
| `genesis.json`                    | Chain specification & initial state    |
| `install-raakh.sh`                | Automated setup script                 |
| `nginx.conf`                      | Reverse proxy + SSL setup              |
| `optimism-package/kurtosis.yml`  | Main OP Stack deployment configuration |
| `optimism-package/network_params.yaml` | Kurtosis runtime parameters     |

> ⚠️ *These files must be correctly placed before running the install script. Otherwise, deployment will fail.*

---

## 📁 Folder Structure

The `network/` directory of the RAAKH repository is structured clearly and modularly:

```bash
network/
├── optimism-package/              # OP Stack orchestration configuration
│   ├── kurtosis.yml              # Kurtosis runtime blueprint
│   └── network_params.yaml       # Parameters for custom chain configuration
│
├── raakh-setup-files/            # Core RAAKH setup components
│   ├── genesis.json              # Genesis configuration for Layer 2 chain
│   ├── install-raakh.sh          # Installer script for full environment setup
│   └── nginx.conf                # Reverse proxy config (for rpc.raakh.net)
│
└── README.md                     # Documentation and usage instructions
```
---

## 🛠 Installation & Usage

To launch the RAAKH local network on your machine using the OP Stack and Kurtosis, follow these steps:

### 1. Clone the repository
```bash
git clone https://github.com/HOOPAAD/RAAKH.git
cd RAAKH/network
```

### 2. Make the installer executable
```bash
chmod +x raakh-setup-files/install-raakh.sh
```

### 3. Run the installer
This script installs all required dependencies and launches the network:
```bash
./raakh-setup-files/install-raakh.sh
```

The script will:
- Install dependencies (`curl`, `git`, `docker`, `docker-compose`, etc.)
- Install the [Kurtosis CLI](https://docs.kurtosis.com/)
- Copy the config files from `optimism-package/` into the working directory
- Launch the OP Stack using Kurtosis with the following configuration:
  - `optimism-package/kurtosis.yml`
  - `optimism-package/network_params.yaml`

### 4. Access your RAAKH Node

Once deployment completes, your local OP Stack network will be live and reachable at:

```
http://localhost:8545
```

If you're using reverse proxy via Nginx (`nginx.conf`), it can be configured for:

```
https://rpc.raakh.net
```

> 📌 Make sure ports `80`, `443`, and `8545` are open and Docker is running.

---

## 🔐 Step 6 – Set Up Nginx and SSL (rpc.raakh.net)

This section sets up a secure HTTPS reverse proxy for your RAAKH RPC endpoint.

---

### 🧱 Install Nginx and Certbot

```bash
sudo apt update
sudo apt install nginx certbot python3-certbot-nginx -y
```

---

### 🔁 Replace Nginx Default Config with RAAKH Config

```bash
sudo cp raakh-setup-files/nginx.conf /etc/nginx/sites-available/rpc.raakh.net
sudo ln -s /etc/nginx/sites-available/rpc.raakh.net /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

---

### 🔒 Issue Free SSL Certificates

```bash
sudo certbot --nginx -d rpc.raakh.net
```

Follow the prompts from Certbot. Once complete, your domain will be SSL-enabled.

---

### ✅ Nginx with SSL is now ready.

Your RPC endpoint will now be served securely at:

```
https://rpc.raakh.net
```

You can test it with `curl`:

```bash
curl https://rpc.raakh.net
```

It should return a JSON-RPC response like:

```json
{"jsonrpc":"2.0","error":{"code":-32600,"message":"invalid request"},"id":null}
```

### 7️⃣ Add RAAKH Devnet to MetaMask

Once your node is live and the RPC endpoint is reachable, you can connect to it using MetaMask or any other EVM-compatible wallet.

#### 🧭 Steps to Add Network in MetaMask:

1. Open MetaMask.
2. Click on your network dropdown (usually says "Ethereum Mainnet").
3. Select **"Add Network"** or **"Add a network manually"**.
4. Fill in the following fields:

| Field             | Value                        |
|-------------------|------------------------------|
| Network Name      | RAAKH Devnet                 |
| RPC URL           | `https://rpc.raakh.net`      |
| Chain ID          | `919191`                     |
| Currency Symbol   | `KHAS`                       |
| Block Explorer URL| *(optional)*                 |

5. Click **Save**.

Once added, your MetaMask is connected to the RAAKH Devnet.  
You can now:

- Deploy and test contracts via [Remix](https://remix.ethereum.org).
- Interact with tokens, NFTs, and bridges using standard Web3 tools.
- Send and receive KHAS tokens on-chain.

---
## ❗ Troubleshooting

Even with a carefully crafted setup, unexpected issues may arise. Below are common problems and how to resolve them:

---

### 🔌 Kurtosis command not found

**Issue**:
```bash
kurtosis: command not found
```

**Fix**:
Make sure the Kurtosis binary is added to your PATH.

```bash
echo 'export PATH="$HOME/.kurtosis/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

### 🧱 `optimism-package` folder not found

**Issue**:
```bash
❗ Error: optimism-package folder not found in expected location.
```

**Fix**:
Ensure the `optimism-package` directory exists one level up relative to the `install-raakh.sh` script:

```
raakh-network/
├── install-raakh.sh
└── ../optimism-package/
```

If it’s elsewhere, update the paths in `install-raakh.sh` accordingly.

---

### 🔒 Port already in use

**Issue**:
```bash
Error: listen tcp 0.0.0.0:8545: bind: address already in use
```

**Fix**:
Check which service is using the port:

```bash
sudo lsof -i :8545
```

Then stop the service or change the port in your configuration.

---

### 🌐 Nginx fails to reload

**Issue**:
```bash
nginx: [emerg] invalid number of arguments in "server" directive...
```

**Fix**:
Check for syntax errors in `nginx.conf`:

```bash
sudo nginx -t
```

Edit and fix the file, then reload nginx:

```bash
sudo systemctl reload nginx
```

---

### 🔒 SSL certificate generation failed

**Fix**:
Ensure:
- The domain (e.g., `rpc.raakh.net`) has an active A record pointing to the correct server IP.
- Ports 80 and 443 are open.
Then re-run:

```bash
sudo certbot --nginx -d rpc.raakh.net
```

---

### 🧠 Kurtosis containers not launching

**Fix**:
Make sure the following files exist in the same folder as your `kurtosis.yml`:

- `network_params.yaml`
- Docker installed and running
- Enough free disk space (`df -h`)

---

### 🔧 Geth or OP-node crashing

Check logs:

```bash
docker ps
docker logs <container-id>
```

Restart the container if needed, or rebuild using Kurtosis:

```bash
kurtosis clean --enclave raakhnet
kurtosis run . --enclave raakhnet
```

---

### ✅ Always verify folder structure

Ensure all required files are in place:
- `install-raakh.sh` in `raakh-network/`
- `kurtosis.yml` + `network_params.yaml` in `optimism-package/`
- All copied and pushed to GitHub properly
```bash
git status
git add .
git commit -m "add missing files"
git push origin main
```

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [`LICENSE`](../LICENSE) file for details.
