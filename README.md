# dbt-gcp-billing
A dbt Package to deal with Google Cloud billing exported to BigQuery.

<!-- toc -->

- [Installation Instructions](#installation-instructions)
- [Requirements](#requirements)
- [How to use](#how-to-use)
  * [dbt variables](#dbt-variables)

<!-- tocstop -->

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/yu-iskw/dbt_gcp_billing/latest/) for the latest installation instructions.

## Requirements
- dbt-core: 1.0.0 or later

## How to use

### dbt variables

We declare the projects, datasets and tables of Google Cloud billing to be used in the dbt project as follows.

```yaml
vars:
  "dbt-gcp-billing::standard_usage_cost::project": "project1"
  "dbt-gcp-billing::standard_usage_cost::dataset": "dataset1"
  "dbt-gcp-billing::standard_usage_cost::table": "gcp_billing_export_v1_xxxxxxx"
  "dbt-gcp-billing::detailed_usage_cost::project": "project2"
  "dbt-gcp-billing::detailed_usage_cost::dataset": "dataset2"
  "dbt-gcp-billing::detailed_usage_cost::table": "gcp_billing_export_resource_v1_xxx"
  "dbt-gcp-billing::pricing::project": "project3"
  "dbt-gcp-billing::pricing::dataset": "dataset3"
  "dbt-gcp-billing::pricing::table": "cloud_pricing_export"
```
