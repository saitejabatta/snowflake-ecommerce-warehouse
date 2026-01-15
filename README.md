# ecom project snowflake dwh (raw -> satge -> mart)

this project builds a simple data warehouse in snowflake using:
- raw layer (stages + copy into raw tables)
- stage layer (cleaning + standardization)
- mart layer (dimensions + facts + views)
- kpis (analysis queries)

## repo structure

- sql/setup: warehouse + database + schemas
- raw: internal stages + file formats + raw tables + copy into
- stage: transformations (raw -> stage)
- mart: dimensional tables, fact tables, views
- kpis: kpi queries

## ececution order
1. run sql/setup/create_warehouse.sql
2. run sql/setup/create_database_&_schema.sql
3. run sql/raw(stage -> upload datasets to stage -> raw table -> copy into)
4. run sql/stage
5. run sql/mart
6. run sql/KPI's
7. run sql/data_quality_checks.sql

## upload data to snowflake internal stage

- make sure you have already created the internal stages for the respective datasets using the stage creation sql commands in sql/raw before uploading the data
- or you can try using the snowflake ui(snowsight) to upload the datasets to internal stages after creating the internal stages as mentioned above.

- you can use following sql command for uploading datasets
"put file:///<local_path>/filename.csv @<stage location> auto_compress = false;"



