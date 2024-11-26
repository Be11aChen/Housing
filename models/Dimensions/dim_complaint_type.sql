select
    row_number() over() as complaint_type_id, *
from
    (
        select distinct sr.complaint_type, hm.major_category, hm.minor_category
        from `cis-4400-semester-project.dataset.311-service-requests` sr
        inner join `cis-4400-semester-project.dataset.HousingMaintenance` hm on sr.unique_key=hm.problem_id
    )
where complaint_type = 'Housing Options'
order by complaint_type_id asc