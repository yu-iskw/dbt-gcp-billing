{{
  config(
    materialized="view"
  )
}}

SELECT *
FROM {{ source(var('dbt-gcp-billing::standard_usage_cost::dataset'), "dbt_gcp_billing__standard_usage_cost") }}
