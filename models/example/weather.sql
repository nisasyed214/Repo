{{ config(materialized='table') }}

with daily_weather as (
    select 
        cityname,
        clouds,
        temp,
        weather
    from {{ source('demo', 'weather') }}
),

weather_agg as (
    select 
        weather,
        temp,
        count(*) as weather_count
    from daily_weather
    group by weather, temp
)

select *
from weather_agg;
