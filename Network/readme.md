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
