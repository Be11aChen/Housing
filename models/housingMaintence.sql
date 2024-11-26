with
    location as (
        select unique_key as id, 
        borough, 
        post_code as zip_code, 
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    ),
    complaint_type as (
        select unique_key as id, 
        major_category,
        minor_category
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    ),
    date_as as (
        select 
        unique_key as id, 
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    ),
    space_ as (
        select unique_key as id, 
        space_type
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    ),
    status as (
        select 
        unique_key as id, 
        complaint_status
        from `cis-4400-semester-project.dataset.HousingMaintenance`
    ),
    complaints as (
        select
            location.borough,
            location.zip_code,
            complaint_type.major_category,
            complaint_type.minor_category,
            space_.space_type,
            status.complaint_status
        from location
        join complaint_type using (id)
        join date_as using (id)
        join space_ using (id)
        join status using (id)
    )

select * from complaints