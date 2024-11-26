select row_number() over () as hm_complaint_type_id, *
from
    (
        select distinct major_category, minor_category
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    )

order by hm_complaint_type_id asc
