---
name: weekly-briefing
description: Produce a short weekly briefing for one Google Ads account covering waste verdict, top next step, open questions for the owner and measurement warnings. Use when the user asks for a weekly update, a status summary, or "what should I look at this week".
---

# Weekly briefing

## Steps

1. Get the `project_id` from `velliq_list_projects`, and note the latest data pull date.
2. Call `velliq_get_waste_summary`, `velliq_list_proposal_cases` and `velliq_get_account_health`.
3. Write the briefing in this order, keeping it to about 200 words:
   1. **Verdict**: `headline.text`, quoted exactly.
   2. **Do this first**: the first ranked step from `brief`, with its impact and link.
   3. **Waiting on you**: cases with outcome `question`, each with its link.
   4. **Rechecks scheduled**: cases with outcome `wait` and their `recheck_at` dates.
   5. **Trust warnings**: unknown checks or measurement warnings that limit the numbers above.
4. End with one suggested question the user could ask next.

## Rules

- Every number is quoted exactly from Velliq. Never total, convert or estimate.
- If there is no analysis yet, say so instead of producing an empty briefing.
- Velliq does not change the account. Present changes as things to review in Velliq.
