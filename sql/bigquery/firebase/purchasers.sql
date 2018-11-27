# Name: Purchasers
# Description: Users who have logged either in_app_purchase or ecommerce_purchase.
# Source: https://support.google.com/firebase/answer/9037342?
# Type: Standard SQL

SELECT
  COUNT(DISTINCT user_id)
FROM
  /* PLEASE REPLACE WITH YOUR TABLE NAME */
  `YOUR_TABLE.events_*`
WHERE
  (event_name = 'in_app_purchase' OR event_name = 'ecommerce_purchase')
  /* PLEASE REPLACE WITH YOUR DESIRED DATE RANGE */
  AND _TABLE_SUFFIX BETWEEN '20180501' AND '20240131';


