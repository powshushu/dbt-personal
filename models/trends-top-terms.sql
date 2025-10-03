/*
{{
  config(
    materialized='view'
  )
}}
*/

SELECT
   refresh_date
   , term top_term
   , rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
   rank <= 5 --top terms
   AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 2 WEEK) --last 2 weeks
GROUP BY
   refresh_date
   , term
   , rank
ORDER BY 
    refresh_date DESC
    , rank
