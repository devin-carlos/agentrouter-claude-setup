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
# Detect Shell RC File
# ======================================

detect_rc_file() {
    # Try to detect the user's preferred shell from $SHELL
    DETECTED_SHELL="$(basename "${SHELL:-}")"

    case "$DETECTED_SHELL" in
        zsh)
            echo "$HOME/.zshrc"
            ;;
        bash)
            # Prefer .bashrc on Linux, fallback to .bash_profile
            if [ -f "$HOME/.bashrc" ]; then
                echo "$HOME/.bashrc"
            else
                echo "$HOME/.bash_profile"
            fi
            ;;
        fish)
            echo "$HOME/.config/fish/config.fish"
            ;;
        ksh)
            echo "$HOME/.kshrc"
            ;;
        *)
            # Unknown shell — fallback to ~/.profile (POSIX, works on all shells)
            echo "$HOME/.profile"
            ;;
    esac
}

RC_FILE="$(detect_rc_file)"

echo "[+] Detected shell  : ${SHELL:-unknown}"
echo "[+] Using RC file   : $RC_FILE"
echo

# ======================================
# Configure Shell RC File
# ======================================

touch "$RC_FILE"

# Remove any existing AgentRouter configuration (avoid duplicates)
sed -i '/export ANTHROPIC_BASE_URL=/d' "$RC_FILE"
sed -i '/export ANTHROPIC_AUTH_TOKEN=/d' "$RC_FILE"
sed -i '/export ANTHROPIC_MODEL=/d' "$RC_FILE"
sed -i '/# AgentRouter + Claude Code/d' "$RC_FILE"

# Add configuration
cat >> "$RC_FILE" <<EOF

# AgentRouter + Claude Code
export ANTHROPIC_BASE_URL="$ANTHROPIC_BASE_URL"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="$ANTHROPIC_MODEL"
EOF

# Apply configuration to the CURRENT script/session.
# No "source <rc_file>" is required.
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

        # Check that curl is available
        if ! command -v curl >/dev/null 2>&1; then
            echo "[ERROR] curl is required but not installed."
            echo "Install curl with your package manager and try again:"
            echo "  Debian/Ubuntu : sudo apt-get install -y curl"
            echo "  Fedora/RHEL   : sudo dnf install -y curl"
            echo "  Arch          : sudo pacman -S curl"
            exit 1
        fi

        curl -fsSL https://claude.ai/install.sh | bash

        # Refresh PATH to cover common Claude Code install locations
        export PATH="$HOME/.local/bin:$HOME/.claude/bin:/usr/local/bin:$PATH"

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
echo "  $RC_FILE"
echo
echo "To apply in new terminal sessions, run:"
echo "  source $RC_FILE"
echo
echo "Starting Claude Code..."
echo

# Start Claude with the configuration already exported
claude
