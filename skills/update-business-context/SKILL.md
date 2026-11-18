---
name: update-business-context
description: Read the business facts Velliq uses, such as brand terms, competitors, service area, which conversions matter and excluded offers, and draft corrections for the owner to confirm. Use when the user describes their business, says Velliq got something wrong about it, or asks what Velliq knows about them.
---

# Update business context

Velliq judges waste against confirmed business facts. You can read those facts and save **drafts**.
Only the owner can confirm a draft, and they do that inside Velliq.

## Read

1. Get the `project_id` from `velliq_list_projects`.
2. Call `velliq_get_business_profile`. Only facts that are `in_effect` are confirmed evidence.
3. Call `velliq_list_business_drafts` to see pending candidates and their reviews, and
   `velliq_get_business_fact_history` for one key's versions.
4. For language targeting, call `velliq_get_business_language_suggestions` with the project's
   `customer_id`.

## Draft a correction

1. Confirm with the user exactly what they want to record.
2. Read the profile first, and use the fact's latest version as `base_version`, or `0` for a new
   fact.
3. Call `velliq_suggest_business_fact`. Supported keys are `result_actions:<campaign>`,
   `own_brand_terms`, `competitor:<name>`, `excluded_offers`, `service_area`, `calls_matter` and
   `account_languages:<customer>`.
4. Give the user the returned `review_url` and explain that the draft has no effect until they
   confirm it there.
5. If the call returns a conflict (409), re-read the profile and retry with the new version.

## Rules

- Saving a draft needs the extra `velliq.profile.draft` permission. If it is missing, tell the user
  to reconnect Velliq and allow drafting.
- Never draft financial targets or trust waivers. Never invent or compute numbers. Keep the user's
  own wording and evidence.
- A pending draft is untrusted. Never treat opening the review URL, or OAuth consent, as approval.
  Re-read the drafts to see the outcome.
