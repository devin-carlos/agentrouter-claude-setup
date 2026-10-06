AgentRouter + Claude Code Setup
A simple setup script for configuring Claude Code to use AgentRouter with the deepseek-v4-flash model.
Features
- Configures AgentRouter automatically
- Sets the Anthropic-compatible API endpoint
- Sets the AgentRouter authentication token
- Configures deepseek-v4-flash
- Automatically updates ~/.zshrc
- Checks whether Claude Code is installed
- Installs Claude Code if it is not installed
- Supports one-line curl | bash installation
- Does not require source ~/.zshrc during setup
- Does not store your API key inside the script
Requirements
- Kali Linux / Linux
- curl
- Zsh
Claude Code does not need to be installed beforehand. The setup script checks for Claude Code and offers to install it if it is missing.
Create AgentRouter API Key
Need an AgentRouter API key?
👉 [Follow the API Key Creation Guide](CREATE-AGENTROUTER-API-KEY.md)
Quick Setup
Run:
curl -fsSL https://raw.githubusercontent.com/devin-carlos/agentrouter-claude-setup/main/setup-agentrouter.sh | bash
Step 1 — Enter API Key
The script will first ask:
======================================
 AgentRouter + Claude Code Setup
======================================

Enter your AgentRouter API key:
The API key is visible while typing.
Step 2 — AgentRouter Configuration
The script automatically configures:
Base URL : https://agentrouter.org/
Model    : deepseek-v4-flash
Step 3 — Check Claude Code
The script checks whether Claude Code is already installed.
If Claude Code is not installed, it asks:
Claude Code is not installed.

Do you want to install Claude Code? [Y/n]:
Choose Y to install Claude Code automatically.
Step 4 — Start Claude Code
After successful setup, the script starts:
claude
Manual Installation
Clone the repository:
git clone https://github.com/devin-carlos/agentrouter-claude-setup.git
cd agentrouter-claude-setup
Make the script executable:
chmod +x setup-agentrouter.sh
Run it:
./setup-agentrouter.sh
Configuration
The script adds the following configuration to ~/.zshrc:
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="YOUR_AGENTROUTER_API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-flash"
The same variables are exported directly for the current setup session.
Therefore, the script does not need to run:
source ~/.zshrc
before starting Claude Code.
Why source ~/.zshrc Is Not Used
Some systems may have errors or custom commands inside ~/.zshrc.
Running:
source ~/.zshrc
can therefore cause unrelated errors and may interrupt the setup.
This installer avoids that problem by:
1. Saving the configuration to ~/.zshrc for future terminal sessions.
2. Exporting the required variables directly in the current script session.
3. Starting Claude Code using the already-exported variables.
Verify Configuration
Check the configured model:
echo $ANTHROPIC_MODEL
Expected:
deepseek-v4-flash
Check the API endpoint:
echo $ANTHROPIC_BASE_URL
Expected:
https://agentrouter.org/
Check that the token exists without displaying the complete key:
echo ${ANTHROPIC_AUTH_TOKEN:0:10}
Troubleshooting
API Key Prompt Does Not Appear
Use the recommended installation command:
curl -fsSL https://raw.githubusercontent.com/devin-carlos/agentrouter-claude-setup/main/setup-agentrouter.sh | bash
The script reads interactive input directly from the terminal using /dev/tty, so the API-key prompt works even when the script is piped through curl.
Claude Code Is Not Installed
The script automatically checks for Claude Code.
If it is missing, choose:
Y
when prompted to install it.
If installation fails, the script stops and asks you to install Claude Code manually.
.zshrc Errors
The installer does not use:
source ~/.zshrc
during setup.
This prevents existing .zshrc problems from interfering with the installation.
Security
Never share your AgentRouter API key.
Do not put your personal API key directly inside:
- setup-agentrouter.sh
- README.md
- GitHub source files
- Screenshots
- Public tutorials
- Public .env files
Each user should create and use their own AgentRouter API key.
If an API key is accidentally exposed, revoke or rotate it from AgentRouter immediately.
Repository
GitHub:
https://github.com/devin-carlos/agentrouter-claude-setup
Disclaimer
This project is an independent setup utility and is not affiliated with or endorsed by Anthropic, Claude, DeepSeek, or AgentRouter.
