select
    row_number() over() as complaint_type_id, *
from
    (
        select distinct sr.complaint_type
        from `cis-4400-semester-project.dataset.311-service-requests` 
    )
where complaint_type = 'Housing Options'
order by complaint_type_id asc