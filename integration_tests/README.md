# Integration tests

## How to run integration tests

### Declare the dbt variables in dbt_project.yml

Following the instruction of [README](../README.md), we declare the dbt variables in [dbt_project.yml](./dbt_project.yml).

### Execute integration tests

```shell
cd integration_tests

INTEGRATION_TESTS_PROJECT="your-gcp-project" dbt build --profiles-dir profiles
```
