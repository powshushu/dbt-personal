select dma_name
from {{ ref('combined') }}
group by dma_name
having
    count(dma_name) > 1