# How to Create an AgentRouter API Key

This guide explains how to create an API Key in AgentRouter for use with Claude Code.

## 1. Open AgentRouter

Use this registration/login link:

https://agentrouter.org/register?aff=H9Bz

**IMPORTANT : LOGIN WITH YOUR GITHUB ACCOUNT**

## 2. Open API Key / Token Management

After logging in, open the AgentRouter dashboard and go to the section used to manage **API Keys / Tokens**.

The exact menu name or location may change as the dashboard is updated.

## 3. Create a New API Key

Choose the option to create a new API key/token.

If the dashboard asks for a name, use something descriptive, for example:

```text
claude-code-kali
```

## 4. Set the Quota

When creating the token, check the **Quota Settings**.

Select:

```text
Unlimited quota
```

if you want the token to have no quota limit.

> **Important:** Unlimited quota does not mean the AgentRouter service is free or that your account has unlimited credits. It means the token itself is not restricted by a configured quota limit. Actual usage can still depend on your AgentRouter account, balance, pricing, model availability, and service limits.

## 5. Create and Copy the API Key

Complete the token creation process and copy the generated API key.

Example format:

```text
sk-xxxxxxxxxxxxxxxxxxxxxxxx
```

**Do not use the example key above.**

Your API key is a credential. Keep it private.

Do not post it in:

- GitHub
- Screenshots
- Discord
- WhatsApp
- Public tutorials
- Source code
- Public `.env` files

## 6. Use the Key with Claude Code

For the Claude Code setup, the API key is provided to the setup script when requested.

Example:

```bash
./setup-agentrouter.sh
```

The script will ask:

```text
Enter your AgentRouter API key:
```

Enter the API key you created.

## 7. Security

Never put your real API key directly inside:

```text
setup-agentrouter.sh
README.md
```

Each user should create and use their **own AgentRouter API key**.

If a key is accidentally exposed, revoke/rotate it from AgentRouter.

## AgentRouter Registration / Login

https://agentrouter.org/register?aff=H9Bz

## Official Documentation

https://co.agentrouter.org/portal/guide
