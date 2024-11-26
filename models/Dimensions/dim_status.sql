select row_number() over () as status_id, *
from
    (
        select distinct complaint_status
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    )
order by status_id asc
