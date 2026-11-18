---
name: find-wasted-spend
description: Explain where a Google Ads account is wasting money, using Velliq's verdict, findings and monthly ranges. Use when the user asks about wasted spend, what to cut, why costs are high, or where to start optimizing.
---

# Find wasted spend

## Steps

1. Call `velliq_list_projects` and pick the project the user means. If several projects could match,
   ask which one.
2. Call `velliq_get_waste_summary` with the `project_id`. This is the primary answer.
3. Lead with `headline.text`, the verdict, and read `headline.kind` correctly:
   - `available`: a monthly waste range exists. Quote it exactly as given.
   - `unavailable`: there are findings, but no single honest total. Do not invent one.
   - `clean`: nothing was found **in what was checked**. Say what was not checked.
   - `no_analysis` or `needs_new`: there is no result yet. Say so and stop.
   - `separate_only`: only amounts that are kept apart from the main total exist. Never present them as one waste total.
   - `signals`: there are early signals only, not confirmed waste.
   - `not_evaluated`: Velliq could not evaluate the account. Give the reasons it returns.
4. Walk through `brief` and its ranked next steps. Explain why the first step comes first, using that
   step's title, impact and dashboard URL.
5. Summarize `findings`, headline findings first. Give each one's confidence,
   `probability_of_waste` when it is present, its monthly amounts and its `next_step`.
6. Mention `coverage`, meaning which campaigns were checked and which were fully checked, and
   `not_checked` spend, so the user knows the limits of the answer.
7. Only if the user wants the detail behind a number, call `velliq_get_waste_ledger` (who owns
   which spend), `velliq_get_statistical_findings` or `velliq_get_direct_findings`.

## Rules

- **Every number comes from Velliq.** Quote amounts and percentages exactly as Velliq formats them,
  in the account's currency. Never add, subtract, convert, round or re-derive them.
- Quote the ledger's main total as a **range**, never as one exact sum. `other_totals`,
  `separate_amounts` and `capacity` are separate amounts and are never added to it.
- Signals are not confirmed waste, and an empty list does not mean the account is healthy.
- Velliq never changes Google Ads. Give manual change instructions only when
  `next_step.manual_steps_allowed` is true. Otherwise describe the change as a preview to review in
  Velliq, and never imply that Velliq approved it.
- When `next_step.answer_needed` is true, Velliq is waiting for the owner. Send them to
  `next_step.case_url` to answer.
