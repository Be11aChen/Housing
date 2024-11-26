select
    row_number() over() as status_id, *
from
    (
        select distinct hm.complaint_status
        from `cis-4400-semester-project.dataset.311-service-requests` sr
        inner join `cis-4400-semester-project.dataset.HousingMaintenance` hm on sr.unique_key=hm.problem_id
    )
order by status_id asc