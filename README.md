# dbt-gcp-billing
A dbt Package to deal with Google Cloud billing exported to BigQuery.

> Cloud Billing export to BigQuery enables you to export detailed Google Cloud billing data (such as usage, cost estimates, and pricing data) automatically throughout the day to a BigQuery dataset that you specify.
> Then you can access your Cloud Billing data from BigQuery for detailed analysis, or use a tool like Looker Studio to visualize your data.
> quoted from [Export Cloud Billing data to BigQuery](https://cloud.google.com/billing/docs/how-to/export-data-bigquery)

<!-- toc -->

- [Installation Instructions](#installation-instructions)
- [Requirements](#requirements)
- [How to use](#how-to-use)
  * [Supported tables](#supported-tables)
  * [dbt variables](#dbt-variables)
  * [Reference to the tables](#reference-to-the-tables)

<!-- tocstop -->

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/yu-iskw/dbt_gcp_billing/latest/) for the latest installation instructions.

## Requirements
- dbt-core: 1.0.0 or later

## How to use

### Supported tables
The dbt Package supports the following three tables exported from Google Cloud billing to BigQuery.

- Standard usage cost data - Contains standard Cloud Billing account cost usage information, such as account ID, invoice date, services, SKUs, projects, labels, locations, cost, usage, credits, adjustments, and currency.
- Detailed usage cost data - Contains detailed Cloud Billing account cost usage information. Includes everything in the standard usage cost data plus resource-level cost data, like a virtual machine or SSD that generates service usage.
- Pricing data - Contains Cloud Billing account pricing information, such as account ID, services, SKUs, products, geographic metadata, pricing units, currency, aggregation, and tiers.

### dbt variables

We declare the projects, datasets and tables of Google Cloud billing to be used in the dbt project as follows.
We need to declare dbt variables the projects, datasets and tables respectively.

For instance, we can declare the dbt variables in the `dbt_project.yml` as follows.
We can also pass the dbt variables via the command line using the `--vars` flag of a dbt command.

```yaml
# dbt_project.yml
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

### Reference to the tables

#### Standard usage cost data

```sql
SELECT *
FROM {{ source(var('dbt-gcp-billing::standard_usage_cost::dataset'), "dbt_gcp_billing__standard_usage_cost") }}
```

#### Detailed usage cost data

```sql
SELECT *
FROM {{ source(var('dbt-gcp-billing::detailed_usage_cost::dataset'), "dbt_gcp_billing__detailed_usage_cost") }}
```

#### Pricing data

```sql
SELECT *
FROM {{ source(var('dbt-gcp-billing::pricing::dataset'), "dbt_gcp_billing__pricing") }}
```
