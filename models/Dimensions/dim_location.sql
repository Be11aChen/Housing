select row_number() over () as location_id, *
from
    (
        select distinct
            sr.unique_key,
            sr.borough,
            sr.city,
            sr.incident_zip as zip_code,
            hm.council_district,
            hm.block
        from `cis-4400-semester-project.dataset.311-service-requests` sr
        inner join
            `cis-4400-semester-project.dataset.HousingMaintenance` hm
            on hm.problem_id = sr.unique_key

    )
where city is not null
order by location_id asc
