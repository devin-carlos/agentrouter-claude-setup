# AgentRouter + Claude Code Setup

> One-line setup script that configures **Claude Code** to run through **AgentRouter** — with an **interactive model picker** so you can choose your preferred model on any Linux system.

![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh%20%7C%20fish%20%7C%20ksh-blue)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey)
![License](https://img.shields.io/badge/license-MIT-green)

---

## Table of Contents

- [Quick Start](#quick-start)
- [Features](#features)
- [Requirements](#requirements)
- [How It Works](#how-it-works)
- [Manual Installation](#manual-installation)
- [Shell & RC File Support](#shell--rc-file-support)
- [Configuration](#configuration)
- [Verify Setup](#verify-setup)
- [Troubleshooting](#troubleshooting)
- [Security](#security)

---

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/devin-carlos/agentrouter-claude-setup/main/setup-agentrouter.sh | bash
```

The script will prompt for your AgentRouter API key and let you pick a model — that's all you need to do.

> **Need an AgentRouter API key?**
> Sign up at [agentrouter.org](https://agentrouter.org) and generate a key from your dashboard.

---

## Features

- ✅ Works on **any Linux distribution** (Ubuntu, Debian, Fedora, Arch, Kali, etc.)
- ✅ **Interactive model picker** — choose from 7 AgentRouter models at setup time
- ✅ **Auto-detects your shell** and writes to the correct RC file
- ✅ Supports **Bash, Zsh, Fish, Ksh**, and any POSIX shell
- ✅ Checks if Claude Code is installed — **installs it automatically** if missing
- ✅ Applies config to the **current session** immediately (no `source` needed)
- ✅ Validates that `curl` is available before proceeding
- ✅ **Never stores your API key** in the script itself
- ✅ Safe to re-run — removes duplicate config entries automatically

---

## Requirements

| Requirement | Notes |
|-------------|-------|
| Linux (any distro) | Ubuntu, Debian, Fedora, Arch, Kali, etc. |
| Bash | Script runs under `bash` |
| `curl` | Required for Claude Code installation |
| AgentRouter API key | Get one at [agentrouter.org](https://agentrouter.org) |

> Claude Code does **not** need to be installed beforehand — the script will offer to install it for you.

---

## How It Works

```
┌─────────────────────────────────────┐
│   curl ... | bash                   │
│                                     │
│  1. Prompt for AgentRouter API key  │
│  2. Show model selection menu       │
│  3. Detect shell (bash/zsh/fish...) │
│  4. Write exports to RC file        │
│  5. Export vars to current session  │
│  6. Check / install Claude Code     │
│  7. Launch claude                   │
└─────────────────────────────────────┘
```

---

## Manual Installation

Clone the repository:

```bash
git clone https://github.com/devin-carlos/agentrouter-claude-setup.git
cd agentrouter-claude-setup
```

Make the script executable:

```bash
chmod +x setup-agentrouter.sh
```

Run it:

```bash
./setup-agentrouter.sh
```

---

## Shell & RC File Support

The script automatically detects your shell via `$SHELL` and updates the correct file:

| Shell | RC File Written |
|-------|----------------|
| Bash  | `~/.bashrc` (or `~/.bash_profile`) |
| Zsh   | `~/.zshrc` |
| Fish  | `~/.config/fish/config.fish` |
| Ksh   | `~/.kshrc` |
| Other | `~/.profile` |

---

## Configuration

The script adds the following to your shell RC file:

```bash
# AgentRouter + Claude Code
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="your-api-key"
export ANTHROPIC_MODEL="<your-chosen-model>"   # set interactively during setup
```

These are also exported directly into the **current session**, so Claude Code works immediately without restarting your terminal.

### Available Models

| # | Model |
|---|-------|
| 1 | `gpt-6.1-sol` |
| 2 | `gpt-6-astra` |
| 3 | `gpt-5.6-sol` |
| 4 | `claude-opus-4-8` |
| 5 | `claude-opus-5` |
| 6 | `claude-opus-5-5` |
| 7 | `deepseek-v4-flash` *(default)* |

---

## Verify Setup

After running the script, confirm everything is configured correctly:

```bash
# Check the model (shows whatever you selected)
echo $ANTHROPIC_MODEL

# Check the API endpoint
echo $ANTHROPIC_BASE_URL
# Expected: https://agentrouter.org/

# Confirm the token is set (shows first 10 chars only)
echo ${ANTHROPIC_AUTH_TOKEN:0:10}...

# Check Claude Code is installed
claude --version
```

---

## Troubleshooting

### API key prompt doesn't appear

This can happen when piping through `curl`. The script reads from `/dev/tty` directly, so it should work — but if it doesn't, clone and run manually:

```bash
git clone https://github.com/devin-carlos/agentrouter-claude-setup.git
cd agentrouter-claude-setup
bash setup-agentrouter.sh
```

### `curl` is not installed

The script will detect this and show the correct install command for your distro:

```bash
# Debian / Ubuntu
sudo apt-get install -y curl

# Fedora / RHEL
sudo dnf install -y curl

# Arch
sudo pacman -S curl
```

### Claude Code installation fails

If automatic installation fails, install Claude Code manually:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Then re-run `setup-agentrouter.sh`.

### Config not loading in new terminal

Run:

```bash
source ~/.bashrc   # or ~/.zshrc depending on your shell
```

---

## Security

**Never share your AgentRouter API key.**

Do not commit your API key into:

- `setup-agentrouter.sh`
- `README.md`
- GitHub source files
- Screenshots or screen recordings
- Public `.env` files or tutorials

Each user should create and use their own API key.
If a key is accidentally exposed, **revoke or rotate it from your AgentRouter dashboard immediately**.

---

## Disclaimer

This project is an independent setup utility and is not affiliated with or endorsed by Anthropic, Claude, DeepSeek, or AgentRouter.
