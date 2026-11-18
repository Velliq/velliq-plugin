---
name: review-recommendations
description: Go through what Velliq decided for each finding, covering proposed changes, questions for the owner and scheduled rechecks. Use when the user asks what to change, what Velliq recommends, what is waiting on them, or about a specific proposal.
---

# Review Velliq's recommendations

## Steps

1. Get the `project_id` from `velliq_list_projects`.
2. Call `velliq_list_proposal_cases`. Group the cases by outcome:
   - **proposal**: a reviewable change. It is never approved yet.
   - **question**: Velliq needs an answer from the owner.
   - **wait**: Velliq will recheck on `recheck_at` once fresh data exists. `wait_status`
     `needs_information` means the wait ended without fresh data and a person must look.
   - **no_action** and **undecided**.
3. If the list is empty, explain `state`: `pending`, `no_eligible_findings`,
   `needs_new_evaluation` or `no_completed_run`.
4. Start with the questions. These are the cases where the owner can unblock Velliq fastest. Send
   them to the case URL to answer in the Velliq dashboard.
5. For a proposal the user asks about, call `velliq_get_proposal_case` and explain:
   - the chosen option and `decision.reasons`
   - the preview of visible traffic it affects (hidden and future queries are not included)
   - preflight checks. Checks marked `requires_live_data` or `requires_execution_gate` are open by
     design.
6. To see investigations the owner already ran, call `velliq_list_investigations` and link each
   case's `dashboard_url`.

## Rules

- Give step-by-step manual instructions **only** when the case's `manual_steps_allowed` is true.
  Other menu options are previews only.
- Never say a change is approved, safe or confirmed unless Velliq says so.
- Quote all amounts exactly as Velliq returns them. Never compute new ones.
- An answered question is not asked again. The answers `wanted`, `serves_more` and `intended`
  rule out every change for that finding.
- Investigation outcomes are research only. They never confirm waste or allow a change.
- This plugin cannot apply changes to Google Ads or start investigations. The owner does that in
  Velliq.
