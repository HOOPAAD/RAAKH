# Optimism: Ethereum, Scaled – Extended Overview

Optimism is a leading Layer 2 scaling solution for Ethereum, using Optimistic Rollups to provide low-cost, high-throughput, and secure transactions. This repository is the home of the OP Stack: a set of modular, production-grade components for building, running, and governing rollup chains.

---

## 🔗 Key Resources

- **Official Website:** [optimism.io](https://optimism.io)
- **Core Documentation:** [docs.optimism.io](https://docs.optimism.io)
- **OP Stack Guide:** [OP Stack Getting Started](https://docs.optimism.io/stack/getting-started)
- **Technical Specifications:** [OP Stack Specs](https://github.com/ethereum-optimism/specs)
- **Node Software Releases:** [Node Operators](https://docs.optimism.io/builders/node-operators/releases)
- **Network Deployments:** [Networks](https://docs.optimism.io/chain/networks)
- **Governance Hub:** [Optimism Governance Forum](https://gov.optimism.io/)
- **Discord Community:** [Join Discord](https://discord.gg/optimism)
- **Security Policy:** [Security Policy](https://github.com/ethereum-optimism/.github/blob/master/SECURITY.md)
- **Bug Bounty:** [Immunefi Program](https://immunefi.com/bounty/optimism/)
- **Developer Quick Start:** [CONTRIBUTING.md#development-quick-start](./CONTRIBUTING.md#development-quick-start)
- **Good First Issues:** [Open Good First Issues](https://github.com/ethereum-optimism/optimism/issues?q=is:open+is:issue+label:D-good-first-issue)

---

## 🚀 What is Optimism?

Optimism enables Ethereum to scale by executing transactions off-chain and posting compressed data on-chain, inheriting Ethereum’s security while dramatically reducing costs. Its OP Stack is a modular framework powering the Optimism Mainnet and many chains in the Superchain ecosystem.

**Key Concepts:**
- **Optimistic Rollups:** Batch transactions off-chain, post data on-chain, and assume validity unless challenged.
- **Fault Proofs:** Dispute mechanism using on-chain execution (Cannon, MIPS64 VM).
- **Modular OP Stack:** Build your own L2 with plug-and-play components.

---

## 🧩 Repository Structure

```
optimism/
│
├── docs/                  # Protocol documentation, audits, post-mortems
├── op-node/               # Rollup consensus-layer client
├── op-batcher/            # L2 batch submitter for L1 posting
├── op-proposer/           # L2 output submitter (proposals to L1)
├── op-challenger/         # Dispute game challenge agent
├── op-chain-ops/          # State surgery and operational utilities
├── op-e2e/                # End-to-end testing
├── op-program/            # Fault proof program (e.g., Cannon)
├── op-preimage/           # Go bindings for Preimage Oracle
├── op-service/            # Shared utilities for Go services
├── op-wheel/              # Database utilities
├── packages/
│   ├── contracts-bedrock/ # OP Stack smart contracts (including Cannon)
├── kurtosis-devnet/       # Local devnet with Kurtosis
├── .semgrep/              # Security scanning rules
└── ops/                   # DevOps, deployment scripts
```

**See also:** [Full Directory Details](#directory-structure)

---

## 🏗️ Core Components

- **op-node:** Consensus and data availability client.
- **op-batcher:** Aggregates and submits L2 transactions to L1.
- **op-proposer:** Produces output roots, driving rollup state transitions.
- **op-challenger:** Participates in interactive fraud/fault proofs.
- **op-program & Cannon:** Implements on-chain MIPS64 VM for fault proofs ([Cannon docs](cannon/docs/README.md)).
- **contracts-bedrock:** Core smart contracts for bridging and rollup logic.

---

## 🛠️ Development, Releases & Contributions

- **Primary branch:** [`develop`](https://github.com/ethereum-optimism/optimism/tree/develop/) (latest, backwards compatible)
- **Production releases:** Tagged as `<component>/v<semver>` (e.g., `op-node/v1.1.2`)
- **Release notes:** [Node Releases](https://docs.optimism.io/builders/node-operators/releases)
- **Contributing:** See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines, development quick start, and coding standards.

---

## 🧑‍💻 How to Build & Run (Quick Start)

1. **Clone repository:**
   ```bash
   git clone https://github.com/ethereum-optimism/optimism.git
   cd optimism
   ```
2. **Install dependencies:**
   ```bash
   yarn install
   ```
3. **Build core components:**
   ```bash
   make
   ```
4. **Run tests:**
   ```bash
   make test
   ```

See [Developer Quick Start](./CONTRIBUTING.md#development-quick-start) for step-by-step instructions.

---

## 🏛️ Governance & Community

- **Forum:** [gov.optimism.io](https://gov.optimism.io)
- **Discord:** [discord.gg/optimism](https://discord.gg/optimism)
- **Twitter:** [@OptimismFND](https://twitter.com/OptimismFND)
- **Grants & RetroPGF:** [optimism.io/grants](https://www.optimism.io/grants)

---

## 🛡️ Security

- **Reporting vulnerabilities:** [Security Policy](https://github.com/ethereum-optimism/.github/blob/master/SECURITY.md)
- **Bug Bounty:** Up to $2,000,042 via [Immunefi](https://immunefi.com/bounty/optimism/)

---

## 📚 Learn More

- **OP Stack Overview:** [docs.optimism.io/stack](https://docs.optimism.io/stack/)
- **Technical Specs:** [github.com/ethereum-optimism/specs](https://github.com/ethereum-optimism/specs)
- **Cannon Fault Proofs:** [Cannon Docs](cannon/docs/README.md)
- **Bridging & Contracts:** [Bridging Guide](https://docs.optimism.io/builders/bridge/)

---

## ⚖️ License

All code in this repository is licensed under the [MIT License](./LICENSE) unless otherwise noted.

---

**Note:** This is an extended summary for clarity and onboarding. For full, canonical information always reference the [official documentation](https://docs.optimism.io) and [specifications repo](https://github.com/ethereum-optimism/specs).
