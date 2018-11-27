# Name: Audience of N-Day Inactive Users
# Description: Users in the last M days who have not logged a user_engagement event in the last N days where M > N.
# Source: https://support.google.com/firebase/answer/9037342?
# Type: Standard SQL


SELECT
  COUNT(DISTINCT M_days.user_id)
FROM (
  SELECT
    user_id
  FROM
    /* PLEASE REPLACE WITH YOUR TABLE NAME */
    `YOUR_TABLE.events_*`
  WHERE
    event_name = 'user_engagement'
    /* Has engaged in last M = 7 days */
    AND event_timestamp > UNIX_MICROS(TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY))
    /* PLEASE REPLACE WITH YOUR DESIRED DATE RANGE */
    AND _TABLE_SUFFIX BETWEEN '20180521' AND '20240131') AS M_days
/* EXCEPT ALL is not yet implemented in BigQuery. Use LEFT JOIN in the interim.*/
LEFT JOIN (
  SELECT
    user_id
  FROM
    /* PLEASE REPLACE WITH YOUR TABLE NAME */
    `YOUR_TABLE.events_*`
  WHERE
    event_name = 'user_engagement'
    /* Has engaged in last N = 2 days */
    AND event_timestamp > UNIX_MICROS(TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY))
    /* PLEASE REPLACE WITH YOUR DESIRED DATE RANGE */
    AND _TABLE_SUFFIX BETWEEN '20180521' AND '20240131') AS N_days
ON
  M_days.user_id = N_days.user_id
WHERE
  N_days.user_id IS NULL
  

