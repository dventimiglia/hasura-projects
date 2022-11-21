#!/usr/bin/bash 

psql <<EOF

-- -*- sql-product: postgres; -*-

create extension if not exists jdbc_fdw;

drop schema if exists snowflake cascade;

create schema if not exists snowflake;

drop server if exists snowflake cascade;

create server if not exists snowflake foreign data wrapper jdbc_fdw options(
  drivername 'net.snowflake.client.jdbc.SnowflakeDriver',
  url 'jdbc:snowflake://jwwigcl-fyb31202.snowflakecomputing.com?user=dventimihasura&password=${PASSWORD}&db=postgres&warehouse=postgres',
  jarfile '/usr/share/java/snowflake-jdbc-3.13.20.jar'
);
		
create user mapping if not exists for current_user server snowflake options(username 'dventimihasura', password 'Tmtctmtsts4!');

create foreign table snowflake.account (id text, name text, created_at timestamptz, updated_at timestamptz) server snowflake;

create foreign table snowflake.invoice (id text, region text, status text, account_id text, created_at timestamptz, updated_at timestamptz) server snowflake;

create foreign table snowflake.line_item (id text, invoice_id text, product_id text, units integer, created_at timestamptz, updated_at timestamptz) server snowflake;

create foreign table snowflake.product (id text, name text, price integer, created_at timestamptz, updated_at timestamptz) server snowflake;

EOF
