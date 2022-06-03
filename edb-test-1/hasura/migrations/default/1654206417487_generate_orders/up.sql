begin;
with
  account as (
    select
      account.id,
      (random()*5)::int orders
      from account)
insert into "order" (account_id)
select
  account_id
    from (
      select
	account.id account_id,
	row_number() over (partition by account.id order by account.name) ordinal
	from account, generate_series(1, 5)) orders
	 join account on account.id = orders.account_id
		and orders.ordinal <= account.orders;


with
  "order" as (
    select
      "order".id,
      (random()*9 + 1)::int items
      from "order")
insert into order_detail (order_id, product_id, units)
select
  order_id,
  product_id,
  (random()*9 + 1)::int units
    from (
      select
	"order".id order_id,
	product.id product_id,
	row_number() over (partition by "order".id) ordinal
	from "order", product) user_item
	 join "order" on "order".id = user_item.order_id
	     and user_item.ordinal <= "order".items;
commit;
