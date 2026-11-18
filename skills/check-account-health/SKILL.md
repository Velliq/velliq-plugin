---
name: check-account-health
description: Check whether an account's data and conversion tracking are trustworthy enough for spend analysis. Use when the user asks if tracking works, why results look off, whether conversions are reliable, or before trusting any waste number.
---

# Check account and measurement health

## Steps

1. Get the `project_id` from `velliq_list_projects`.
2. Call `velliq_get_account_health`. Report:
   - **Freshness**: when data was last synced.
   - **Spend coverage**: analysed, out-of-scope and unclassified spend. These never overlap, and
     they are spend, not waste.
   - **Per campaign**: the measurement trust color, gate results, mature-through date, usable
     period and any excluded days.
   - **Unknown checks** and Velliq's suggested next steps.
3. Call `velliq_list_measurement_findings` for M1–M7 tracking findings. For any finding the user
   cares about, call `velliq_get_measurement_finding_history` to show how it developed.
4. Close with a plain verdict on what can be trusted now and what has to be fixed first.

## Rules

- `availability: "no_analysis"` means nothing was analysed yet. It does **not** mean healthy.
- An unknown check is never healthy. Purchase-value checks stay unknown without purchase events.
- `EARLY_SIGNAL` is a warning to investigate, not a confirmed tracking failure or loss.
- An empty findings list does not prove that measurement is healthy.
- Never compute or sum money yourself. Quote Velliq's figures exactly.
