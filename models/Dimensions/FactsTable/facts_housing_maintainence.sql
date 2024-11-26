select 
    row_number() over() as unique_key, *
from 
    (
    select location_id, 
    complaint_type_id, 
    date_id,
    space_id,
    status_id
    from {{ ref('dim_complaint_type') }}, 
    {{ ref('dim_date') }}, 
    {{ ref('dim_location') }},
    {{ ref('dim_space') }},
    {{ ref('dim_status') }} 
    )
where unique_key = problem_id
