#!/bin/bash

echo "======================================"
echo " AgentRouter + Claude Code Setup"
echo "======================================"
echo

# ======================================
# Check Claude Code
# ======================================

if command -v claude >/dev/null 2>&1; then
    echo "[+] Claude Code is already installed."
    echo
    claude --version || true
else
    echo "[!] Claude Code is not installed."
    echo

    read -rp "Do you want to install Claude Code? [Y/n]: " INSTALL_CLAUDE </dev/tty

    INSTALL_CLAUDE=${INSTALL_CLAUDE:-Y}

    if [[ "$INSTALL_CLAUDE" =~ ^[Yy]$ ]]; then
        echo
        echo "[+] Installing Claude Code..."
        echo

        curl -fsSL https://claude.ai/install.sh | bash

        # Add common Claude Code install location to PATH
        export PATH="$HOME/.local/bin:$PATH"

        echo
        echo "[+] Checking Claude Code installation..."

        if command -v claude >/dev/null 2>&1; then
            echo "[+] Claude Code installed successfully."
            claude --version || true
        else
            echo
            echo "[ERROR] Claude Code installation failed."
            echo "Please install Claude Code manually and run this script again."
            exit 1
        fi
    else
        echo
        echo "[ERROR] Claude Code is required."
        exit 1
    fi
fi

echo

# ======================================
# AgentRouter API Key
# ======================================

read -rp "Enter your AgentRouter API key: " API_KEY </dev/tty

if [ -z "$API_KEY" ]; then
    echo
    echo "[ERROR] API key cannot be empty."
    exit 1
fi

echo
echo "[+] API key received."
echo

# ======================================
# ZSH Configuration
# ======================================

ZSHRC="$HOME/.zshrc"

touch "$ZSHRC"

# Remove existing AgentRouter configuration
sed -i '/export ANTHROPIC_BASE_URL=/d' "$ZSHRC"
sed -i '/export ANTHROPIC_AUTH_TOKEN=/d' "$ZSHRC"
sed -i '/export ANTHROPIC_MODEL=/d' "$ZSHRC"

# ======================================
# Configure AgentRouter
# ======================================

cat >> "$ZSHRC" <<EOF

# AgentRouter + Claude Code
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-flash"
EOF

# Apply configuration to current shell
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-flash"

echo
echo "======================================"
echo " Setup completed successfully!"
echo "======================================"
echo
echo "Claude Code : Installed"
echo "Model       : deepseek-v4-flash"
echo "Base URL    : $ANTHROPIC_BASE_URL"
echo

source ~/.zshrc

echo "Running Claude"

claude

echo
