-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION refresh_account_summary_cached ()
--   RETURNS setof account_summary_cached AS $$
--   BEGIN
--     refresh materialized view account_summary_cached;
--     return query select * from account_summary_cached limit 1;
--   END;
-- $$ LANGUAGE plpgsql;
