select row_number() over () as date_id, *
from
    (
        select distinct
            created_date,
            extract(day from created_date) as day,
            extract(month from created_date) as month,
            extract(year from created_date) as year,
            extract(quarter from created_date) as quarter
        from `cis-4400-semester-project.dataset.311-service-requests` sr 
    )
order by date_id asc