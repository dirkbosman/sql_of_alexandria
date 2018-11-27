# Name: Audience of N-Day Active Users
# Description: Users who have logged at least one user_engagement event in the last N days.
# Source: https://support.google.com/firebase/answer/9037342?
# Type: Standard SQL

SELECT
  COUNT(DISTINCT user_id)
FROM
  /* PLEASE REPLACE WITH YOUR TABLE NAME */
  `YOUR_TABLE.events_*`
WHERE
  event_name = 'user_engagement'
  /* Pick events in the last N = 20 days */
  AND event_timestamp > UNIX_MICROS(TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY))
  /* PLEASE REPLACE WITH YOUR DESIRED DATE RANGE */
  AND _TABLE_SUFFIX BETWEEN '20180521' AND '20240131';
  


