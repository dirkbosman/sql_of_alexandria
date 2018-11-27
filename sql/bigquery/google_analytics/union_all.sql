# Name: 3 Days using UNION ALL
# Type: standardSQL
# Source: https://support.google.com/analytics/answer/4419694

WITH ga_tables AS (
SELECT
date,
SUM(totals.visits) AS visits,
SUM(totals.pageviews) AS pageviews,
SUM(totals.transactions) AS transactions,
SUM(totals.transactionRevenue)/1000000 AS revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20160801`
GROUP BY date

UNION ALL

SELECT
date,
SUM(totals.visits) AS visits,
SUM(totals.pageviews) AS pageviews,
SUM(totals.transactions) AS transactions,
SUM(totals.transactionRevenue)/1000000 AS revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20160802`
GROUP BY date

UNION ALL

SELECT
date,
SUM(totals.visits) AS visits,
SUM(totals.pageviews) AS pageviews,
SUM(totals.transactions) AS transactions,
SUM(totals.transactionRevenue)/1000000 AS revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20160803`
GROUP BY date

)
SELECT
date,
visits,
pageviews,
transactions,
revenue,
FROM ga_tables
ORDER BY date ASC


# Name: 3 days using comma-separated table names
# Type: Legacy SQL
# Source: https://support.google.com/analytics/answer/4419694


SELECT
date,
SUM(totals.visits) AS visits,
SUM(totals.pageviews) AS pageviews,
SUM(totals.transactions) AS transactions,
SUM(totals.transactionRevenue)/1000000 AS revenue
FROM
[bigquery-public-data.google_analytics_sample.ga_sessions_20160801],
[bigquery-public-data.google_analytics_sample.ga_sessions_20160802],
[bigquery-public-data.google_analytics_sample.ga_sessions_20160803]
GROUP BY
date
ORDER BY
date ASC
