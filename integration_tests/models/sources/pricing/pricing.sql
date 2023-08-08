{{
  config(
    materialized="view"
  )
}}

SELECT *
FROM {{ source(var('dbt-gcp-billing::pricing::dataset'), "dbt_gcp_billing__pricing") }}
