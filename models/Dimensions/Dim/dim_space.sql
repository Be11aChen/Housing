select
    row_number() over() as space_id, *
from
    (
        select distinct space_type
        from `cis-4400-semester-project.dataset.HousingMaintenance` 
    )
order by space_id asc