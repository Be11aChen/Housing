select 
    row_number() over() as request_key, *
from 
    (
    select location_id, 
    complaint_type_id, 
    date_id
    from {{ ref('dim_complaint_type') }}, 
    {{ ref('dim_date') }}, 
    {{ ref('dim_location') }} 
    )
order by request_key ASC
