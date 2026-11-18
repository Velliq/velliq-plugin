# Velliq for Claude and ChatGPT

![Velliq](assets/velliq-logo.png)

Velliq finds wasted Google Ads spend and tells you what to do about it. This plugin connects your AI
assistant to Velliq, so you can ask in plain language:

- *Where is my Google Ads account wasting money?*
- *What should I change first, and why?*
- *What is Velliq waiting on me for?*
- *Can I trust my conversion tracking right now?*
- *Show my top campaigns by cost over the last 30 days.*

Every amount comes from Velliq's own deterministic analysis, not from the model. The assistant quotes
Velliq's verdict, monthly ranges, confidence and coverage exactly, and says what was **not** checked.
Velliq never changes your Google Ads account. Proposed changes stay previews that you review in
Velliq.

## What's included

**Connector**: the Velliq MCP server at `https://mcp.velliq.tech/mcp`.

**Skills**, which teach the assistant how to use Velliq well:

| Skill | Use it for |
| --- | --- |
| `connect-velliq` | Connecting, listing your accounts and fixing access problems |
| `find-wasted-spend` | The waste verdict, ranked next steps and the findings behind them |
| `review-recommendations` | Proposed changes, questions for you, and scheduled rechecks |
| `check-account-health` | Data freshness, spend coverage and conversion-tracking trust |
| `update-business-context` | Reading business facts and drafting corrections for you to confirm |
| `build-ads-report` | Custom Google Ads (GAQL) and GA4 reports |
| `weekly-briefing` | A short weekly status for one account |

## Getting started

1. Install the plugin, or add the connector URL `https://mcp.velliq.tech/mcp` to your assistant.
2. When asked, sign in at velliq.tech, or create an account there.
3. Connect Google Ads. Each Google Ads account you pick becomes a Velliq project, and Velliq emails
   you when the first analysis is ready.
4. Approve the assistant's access on the consent page.
5. Ask: *"Which accounts do I have connected to Velliq?"*

A Velliq account is required. The assistant can only read accounts you connected to Velliq.

## Tools

All tools are read-only except one, which only saves a draft.

- **Velliq** (`velliq_*`): projects, waste summary, waste ledger, statistical and direct findings,
  economic basis, query analysis, proposal cases, investigations, account health, measurement
  findings, and business profile, drafts and history.
- **Google Ads** (`ads_*`): GAQL search and field metadata, limited to your Velliq projects.
- **GA4** (`analytics_*`): property details, reports, funnels, conversions and realtime, limited to
  your projects' properties.
- **Draft** (`velliq_suggest_business_fact`): saves an untrusted business-fact candidate. It has no
  effect until you confirm it inside Velliq, and it requires the separate `velliq.profile.draft`
  permission.

## Data and privacy

- **Where data goes**: the plugin talks only to `https://mcp.velliq.tech`, which reads from Velliq at
  velliq.tech. It runs no local code, scripts or hooks, and sends nothing anywhere else.
- **Sign-in**: OAuth 2.1 with PKCE. Velliq is the authorization server. Requested scopes are
  `velliq.read`, plus `velliq.profile.draft` only when drafting is requested. Your Google refresh
  token never leaves Velliq. For each live report, Velliq issues a short-lived Google access token
  for one connected account only.
- **What the assistant sees**: Velliq's analysis results and the Google Ads or GA4 report rows you
  ask for, for accounts you connected.
- **Revoking access**: remove the connector in your assistant, disconnect a project inside Velliq to
  stop syncing it, or revoke Velliq's Google access at <https://myaccount.google.com/permissions>.
- Privacy policy: <https://velliq.tech/privacy>
- Terms of service: <https://velliq.tech/terms>

## Support

Open an issue at <https://github.com/Velliq/velliq-plugin/issues> or visit <https://velliq.tech>.

## License

MIT. See [LICENSE](LICENSE).
