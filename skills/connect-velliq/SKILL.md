---
name: connect-velliq
description: Connect Velliq and confirm which Google Ads accounts the assistant can read. Use when the user first installs Velliq, asks which accounts are connected, sees an access error, or mentions an account that is missing.
---

# Connect Velliq

Velliq analyses Google Ads accounts. The assistant can read only the accounts the user connected
to Velliq, each of which is a Velliq **project**.

## Steps

1. Call `velliq_list_projects`. If the call fails with an authentication error, tell the user to
   connect Velliq from their assistant's connector settings. Signing in opens velliq.tech, where they
   sign in or create an account and approve access.
2. Show the projects as a short table with these columns: project name, Google Ads `customer_id`,
   GA4 `property_id` (or "none"), `access_status` and the date of the latest data pull.
3. Explain each `access_status` in plain words:
   - `connected`: Velliq's findings and live Google reports both work.
   - `not_connected`: Velliq's findings (`velliq_*` tools) work, but live Google reports (`ads_*`,
     `analytics_*`) do not, because no Gmail currently grants Google access.
   - `reauth_required` or `disconnected`: Google access stopped working. Send the user to the
     project's `connect_url` to restore it.
4. If the account the user wants is not listed, send them to `connect_url`. Connecting it there adds
   it as a new project, and Velliq then pulls and analyses its data. The first analysis can take a
   while, and Velliq emails the user when it is ready.
5. Suggest a next step, for example: "Ask me where this account is wasting money."

## Rules

- Never ask the user for Google passwords, tokens or API keys. Access is granted only through
  Velliq's own sign-in.
- Never say that an account is connected unless `velliq_list_projects` shows it.
