---
name: build-ads-report
description: Build custom Google Ads and GA4 reports for a connected account, such as campaign performance, search terms, conversions or traffic. Use when the user asks for a specific report, metric, breakdown or comparison that Velliq's findings do not already answer.
---

# Build a Google Ads or GA4 report

Prefer Velliq's findings for any question about waste. Use these live Google tools for other
reporting.

## Google Ads

1. Get the project's `customer_id` from `velliq_list_projects`. Live reports need
   `access_status: connected`.
2. If you are unsure of a field name, call `ads_get_resource_metadata`.
3. Call `ads_search` with a GAQL query. Velliq sends the right manager account automatically.
   Example:

   ```sql
   SELECT campaign.name, metrics.cost_micros, metrics.conversions, metrics.clicks
   FROM campaign
   WHERE segments.date DURING LAST_30_DAYS
   ORDER BY metrics.cost_micros DESC
   LIMIT 20
   ```

## GA4

1. Use the project's `property_id`.
2. Call `analytics_get_custom_dimensions_and_metrics` to check the available fields.
3. Use `analytics_run_report`, `analytics_run_funnel_report`, `analytics_run_conversions_report`
   or `analytics_run_realtime_report`.

## Presenting

- Show results as a table with the date range stated.
- Google returns cost in micros of the account currency. The only change you may make is the unit:
  divide each value by 1,000,000. Never total rows, compute ratios or round beyond what Google
  returns. If the user needs a total, select it from Google (for example, query without the
  breakdown) so the number still comes from the source.
- Do not label anything as "waste" from raw reports. Waste judgments come from
  `velliq_get_waste_summary`.

## Rules

- Accounts and properties outside the user's projects are refused. Send the user to `connect_url`
  to add them.
- These tools only read. Nothing changes in Google Ads or GA4.
