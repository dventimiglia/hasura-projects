-- -*- sql-product: postgres; -*-

create policy query on account for select using (true);

create policy mutation on account for all using ((current_setting('hasura.user')::jsonb->>'x-hasura-user-id')::uuid = id);

create policy query on "order" for select using (true);

create policy mutation on "order" for all using ((current_setting('hasura.user')::jsonb->>'x-hasura-user-id')::uuid = account_id);

create policy query on order_detail for select using (true);

create policy mutation on order_detail for all using (exists (select 1 from "order" where id = order_id and (current_setting('hasura.user')::jsonb->>'x-hasura-user-id')::uuid = account_id));
