
SELECT
    term top_term
    , dma_name
    , round(sum(1/rank), 2) sumrank
    , count(rank) countrank
    , min(rank) minrank
    , max(rank) maxrank
FROM {{ source('google_trends', 'top_terms') }}
WHERE
    rank <= 20 --top terms
    and week >= date_sub(CURRENT_DATE(), interval 6 month)
    AND refresh_date = (
        select max(refresh_date)
        FROM {{ source('google_trends', 'top_terms') }}
    )
GROUP BY
    term
    , dma_name
ORDER BY 
    sumrank DESC
    