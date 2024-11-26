with
    location as (
        select unique_key as id, 
        borough, incident_zip as zip_code, 
        city
        from `cis-4400-semester-project.dataset.311-service-requests`
    ),
    complaint_type as (
        select unique_key as id, complaint_type
        from `cis-4400-semester-project.dataset.311-service-requests`
        where complaint_type = "Housing Options"
    ),
    date_ as (
        select 
        unique_key as id, 
        extract(day from created_date) as day,
        extract(month from created_date) as month,
        extract(year from created_date) as year,
        extract(quarter from created_date) as quarter
        from `cis-4400-semester-project.dataset.311-service-requests`
    ),
    service_request as (
        select
            location.id,
            location.city,
            location.borough,
            location.zip_code,
            date_.year,
            date_.month,
            date_.day,
            date_.quarter
        from location
        join complaint_type using (id)
        join date_ using (id)
    )

select * from service_request
