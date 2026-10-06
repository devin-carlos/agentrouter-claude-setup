```bash
#!/bin/bash

echo "======================================"
echo " AgentRouter + Claude Code Setup"
echo "======================================"
echo

# ======================================
# AgentRouter Configuration
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

# AgentRouter settings
ANTHROPIC_BASE_URL="https://agentrouter.org/"
ANTHROPIC_MODEL="deepseek-v4-flash"

# ======================================
# Configure ZSH
# ======================================

ZSHRC="$HOME/.zshrc"

touch "$ZSHRC"

# Remove existing AgentRouter configuration
sed -i '/export ANTHROPIC_BASE_URL=/d' "$ZSHRC"
sed -i '/export ANTHROPIC_AUTH_TOKEN=/d' "$ZSHRC"
sed -i '/export ANTHROPIC_MODEL=/d' "$ZSHRC"

# Add configuration
cat >> "$ZSHRC" <<EOF

# AgentRouter + Claude Code
export ANTHROPIC_BASE_URL="$ANTHROPIC_BASE_URL"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="$ANTHROPIC_MODEL"
EOF

# Apply configuration to the CURRENT script/session.
# No "source ~/.zshrc" is required.
export ANTHROPIC_BASE_URL="$ANTHROPIC_BASE_URL"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="$ANTHROPIC_MODEL"

echo "[+] AgentRouter configuration completed."
echo
echo "Model    : $ANTHROPIC_MODEL"
echo "Base URL : $ANTHROPIC_BASE_URL"
echo

# ======================================
# Check Claude Code
# ======================================

echo "======================================"
echo " Checking Claude Code"
echo "======================================"
echo

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

        # Refresh PATH without sourcing ~/.zshrc
        export PATH="$HOME/.local/bin:$HOME/.claude/bin:$PATH"

        echo
        echo "[+] Checking Claude Code installation..."
        echo

        if command -v claude >/dev/null 2>&1; then

            echo "[+] Claude Code installed successfully."
            claude --version || true

        else

            echo
            echo "[ERROR] Claude Code installation failed."
            echo
            echo "Please install Claude Code manually and run this script again."
            exit 1

        fi

    else

        echo
        echo "[ERROR] Claude Code is required."
        echo
        exit 1

    fi
fi

# ======================================
# Final Verification
# ======================================

echo
echo "======================================"
echo " Setup Completed Successfully!"
echo "======================================"
echo
echo "Claude Code : Installed"
echo "Model       : $ANTHROPIC_MODEL"
echo "Base URL    : $ANTHROPIC_BASE_URL"
echo
echo "Configuration saved to:"
echo "  $ZSHRC"
echo
echo "Starting Claude Code..."
echo

# Start Claude with the configuration already exported
claude
```
