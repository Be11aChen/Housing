select row_number() over () as maintain_key, *
from
    (
        select hm_location_id, hm_complaint_type_id, hm_date_id, space_id, status_id
        from
            {{ ref("dim_hm_complaint_type") }},
            {{ ref("dim_hm_date") }},
            {{ ref("dim_hm_location") }},
            {{ ref("dim_space") }},
            {{ ref("dim_status") }}
        join
            {{ ref("facts_service_request") }} sr
            on sr.complaint_type_id = complaint_type_id
        join {{ ref("facts_service_request") }} sr2 on sr2.location_id = location_id
    )
