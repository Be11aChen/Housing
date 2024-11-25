{{ config(materialized='table') }}

with location as (
    select
        unique_key as id,
        borough,
        incident_zip as zip_code,
        city
    from `cis-4400-semester-project.dataset.311-service-requests`
),
complaint_type as (
    select
        unique_key as id,
        complaint_type
    from `cis-4400-semester-project.dataset.311-service-requests`
),
service_request as (
    select
        location.id,
        complaint_type.complaint_type,
        location.city,
        location.borough,
        location.zip_code
    from location
    join complaint_type using (id)
)

select * from service_request