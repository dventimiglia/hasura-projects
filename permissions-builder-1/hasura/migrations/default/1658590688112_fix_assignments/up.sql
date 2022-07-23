delete from assignment;

with
  "user" as (
    select
      "user".id,
      "user".organization_id,
      (random()*9 + 1)::int items
      from "user")
    insert into assignment (user_id, project_id)
select
  user_id,
  project_id
  from (
    select
      "user".id user_id,
      project.id project_id,
      row_number() over (partition by "user".id) ordinal
      from
	"user",
	project join organization on organization_id = organization.id
     where
       "user".organization_id = organization.id
  ) user_item
       join "user" on "user".id = user_item.user_id
	   and user_item.ordinal <= "user".items;
