with
    facts_housing_maintainence as (
        select * from {{ ref("facts_housing_maintainence") }}
    ),
    facts_service_request as (select * from {{ ref("facts_service_request") }}),
    intergrated as (
        select distinct *
        from facts_housing_maintainence fhm
        join facts_service_request fsr on fsr.request_key = fhm.maintain_key
    )
select *
from intergrated
