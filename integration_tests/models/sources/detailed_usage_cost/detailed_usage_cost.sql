{{
  config(
    materialized="view"
  )
}}

SELECT *
FROM {{ source(var('dbt-gcp-billing::detailed_usage_cost::dataset'), "dbt_gcp_billing__detailed_usage_cost") }}
