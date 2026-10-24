# How to Create an AgentRouter API Key

This guide explains how to create an API key in AgentRouter for use with Claude Code.

---

## Step 1 — Open AgentRouter

Use this registration/login link:

**👉 [https://agentrouter.org/register?aff=H9Bz](https://agentrouter.org/register?aff=H9Bz)**

Sign in or create your AgentRouter account.

---

## Step 2 — Open API Key / Token Management

After logging in, open the AgentRouter dashboard and navigate to the section used to manage **API Keys / Tokens**.

> **Note:** The exact menu name or location may change as the dashboard is updated.

---

## Step 3 — Create a New API Key

Choose the option to **create a new API key / token**.

If the dashboard asks for a name, use something descriptive. For example:

```
claude-code-kali
```

---

## Step 4 — Set the Quota

When creating the token, check the **Quota Settings** and select:

```
Unlimited quota
```

> **Important:** Unlimited quota does **not** mean the AgentRouter service is free or that your account has unlimited credits.
> It means the token itself is not restricted by a configured quota limit.
> Actual usage can still depend on your AgentRouter account balance, pricing, model availability, and service limits.

---

## Step 5 — Create and Copy the API Key

Complete the token creation process and **copy the generated API key**.

Example format:

```
sk-xxxxxxxxxxxxxxxxxxxxxxxx
```

> ⚠️ Do **not** use the example key above — it is for illustration only.

Your API key is a **credential**. Keep it private.

**Never share your API key in:**

| Location | Why it's risky |
|----------|---------------|
| GitHub | Publicly indexed and searchable |
| Screenshots | Can be shared accidentally |
| Discord / WhatsApp | Can be forwarded or screenshotted |
| Public tutorials | Visible to anyone |
| Source code | Committed to version control |
| Public `.env` files | Exposed in repos |

---

## Step 6 — Use the Key with Claude Code

Your API key is entered when the setup script asks for it.

Run:

```bash
./setup-agentrouter.sh
```

The script will prompt:

```text
======================================
 AgentRouter + Claude Code Setup
======================================

Enter your AgentRouter API key:
```

Enter the API key you just created.

---

## Step 7 — Security Reminder

**Never put your real API key directly inside:**

- `setup-agentrouter.sh`
- `README.md`
- Any file committed to a public repository

Each user should create and use **their own** AgentRouter API key.

If a key is accidentally exposed, **revoke or rotate it from your AgentRouter dashboard immediately**.

---

## Links

| Resource | URL |
|----------|-----|
| AgentRouter Registration / Login | [agentrouter.org/register?aff=H9Bz](https://agentrouter.org/register?aff=H9Bz) |
| Official Documentation | [co.agentrouter.org/portal/guide](https://co.agentrouter.org/portal/guide) |
