{{ config(
        schema = 'prices_solana',
        alias = 'minute',
        materialized = 'view',
        post_hook =
            '{{ expose_spells(\'[
                "solana"
            ]\',
            "sector",
            "prices",
            \'["jeff-dude", "couralex"]\') }}'
    )
}}

select
    timestamp
    , cast(year as integer) as year
    , cast(month as integer) as month
    , blockchain
    , contract_address
    , symbol
    , decimals
    , price
from
    {{ source("dune", "prices_solana_minute_raw", database="dune") }}