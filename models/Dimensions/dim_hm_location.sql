select row_number() over () as hm_location_id, *
from
    (
        select distinct council_district, block
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    )
where council_district is not null
order by hm_location_id asc
