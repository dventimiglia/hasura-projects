create or replace view snowflake_account_summary as
select
  account.id,
  sum(units*price)
  from snowflake.account
       join snowflake."invoice" on "invoice".account_id = account.id
       join snowflake.line_item on line_item.invoice_id = "invoice".id
       join snowflake.product on product.id = line_item.product_id
 group by account.id;
