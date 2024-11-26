select row_number() over () as location_id, *
from
    (
        select distinct
            unique_key,
            borough,
            city,
            incident_zip as zip_code,
        from `cis-4400-semester-project.dataset.311-service-requests` 
    )
where city is not null
order by location_id asc
