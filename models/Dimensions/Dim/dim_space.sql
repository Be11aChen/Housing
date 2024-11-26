select
    row_number() over() as space_id, *
from
    (
        select distinct hm.space_type
        from `cis-4400-semester-project.dataset.311-service-requests` sr
        inner join `cis-4400-semester-project.dataset.HousingMaintenance` hm on sr.unique_key=hm.problem_id
    )
order by space_id asc