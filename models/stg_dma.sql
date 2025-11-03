select
    distinct dma_name
FROM {{ source('google_trends', 'top_terms') }}
