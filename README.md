# AgentRouter + Claude Code Setup

A simple setup script for configuring **Claude Code** to use **AgentRouter** with the `deepseek-v4-flash` model.

## Features

* Configures AgentRouter automatically
* Sets the Anthropic-compatible API endpoint
* Sets the AgentRouter authentication token
* Configures `deepseek-v4-flash`
* Automatically updates `~/.zshrc`
* Does not store your API key in the script

## Requirements

* Kali Linux / Linux
* Claude Code installed
* An AgentRouter API key
* `curl`
* Zsh

## Quick Setup
## Create AgentRouter API Key

Need an AgentRouter API key?

👉 [Follow the API Key Creation Guide](CREATE-AGENTROUTER-API-KEY.md)

Run:

```bash
curl -fsSL https://raw.githubusercontent.com/devin-carlos/agentrouter-claude-setup/main/setup-agentrouter.sh | bash
```

The script will ask for your AgentRouter API key.

Example:

```text
======================================
 AgentRouter + Claude Code Setup
======================================

Enter your AgentRouter API key:
```

Your API key will not be displayed while you type.

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

## Configuration

The script adds the following configuration to `~/.zshrc`:

```bash
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="YOUR_AGENTROUTER_API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-flash"
```

The configuration is also applied to the current shell session.

## Start Claude Code

After setup:

```bash
claude
```

## Verify Configuration

You can check the configured model:

```bash
echo $ANTHROPIC_MODEL
```

Expected:

```text
deepseek-v4-flash
```

Check the API endpoint:

```bash
echo $ANTHROPIC_BASE_URL
```

Expected:

```text
https://agentrouter.org/
```

You can check that the token exists without displaying the complete key:

```bash
echo ${ANTHROPIC_AUTH_TOKEN:0:10}
```

## Security

**Never share your AgentRouter API key.**

Do not put your personal API key directly inside:

* `setup-agentrouter.sh`
* `README.md`
* Gi
