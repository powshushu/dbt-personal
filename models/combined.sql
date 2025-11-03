with
    dma as (select * from {{ ref('stg_dma') }})
    , terms as (select * from {{ ref('stg_terms') }})
    , merged as (
        select *
        from dma
        left join terms using (dma_name)
    )

select * from merged