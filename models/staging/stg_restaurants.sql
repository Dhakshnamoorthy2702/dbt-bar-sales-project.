select distinct
    trim(name) as restaurant_name,
    initcap(trim(city)) as city,
    upper(trim(state)) as state,
    upper(trim(zipcode)) as zipcode,

    case
        when country = 'US' then 'United States'
        when country = 'CA' then 'Canada'
        else country
    end as country,

    split(cuisines, ',') as cuisines_array,
    pickup_enabled,
    delivery_enabled,
    coalesce(weighted_rating_value, 0) as weighted_rating_value,
    cast(coalesce(aggregated_rating_count, 0) as int) as aggregated_rating_count

from {{ source('restaurants', 'north_america_restaurants') }}

where name is not null
  and trim(name) <> ''