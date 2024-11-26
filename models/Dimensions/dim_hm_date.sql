select row_number() over () as hm_date_id, *
from
    (
        select distinct
            received_date,
            extract(month from PARSE_DATETIME('%m/%d/%Y', received_date ))as month,
            extract(year from PARSE_DATETIME('%m/%d/%Y', received_date )) as year,
            extract(day from PARSE_DATETIME('%m/%d/%Y', received_date )) as day,
            extract(quarter from PARSE_DATETIME('%m/%d/%Y', received_date )) as quarter
        from `cis-4400-semester-project.dataset.HousingMaintenance`  
    )
order by hm_date_id asc