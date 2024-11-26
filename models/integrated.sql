select *
from {{ ref("facts_housing_maintainence") }},{{ ref("facts_service_request") }}
