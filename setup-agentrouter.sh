#!/bin/bash

echo "======================================"
echo " AgentRouter + Claude Code Setup"
echo "======================================"
echo

read -rp "Enter your AgentRouter API key: " API_KEY
echo
echo

ZSHRC="$HOME/.zshrc"

# Create .zshrc if it doesn't exist
touch "$ZSHRC"

# Remove existing AgentRouter configuration
sed -i '/export ANTHROPIC_BASE_URL=/d' "$ZSHRC"
sed -i '/export ANTHROPIC_AUTH_TOKEN=/d' "$ZSHRC"
sed -i '/export ANTHROPIC_MODEL=/d' "$ZSHRC"

# Add AgentRouter configuration
cat >> "$ZSHRC" <<EOF

# AgentRouter + Claude Code
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-flash"
EOF

# Apply configuration to the current shell
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-flash"

echo
echo "======================================"
echo " Setup completed successfully!"
echo "======================================"
echo
echo "Model : $ANTHROPIC_MODEL"
echo "Base  : $ANTHROPIC_BASE_URL"
echo
echo "Run Claude Code with:"
echo "  claude"
echo
