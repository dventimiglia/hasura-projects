with
  "user" as (
    select
      "user".id,
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
      from "user", project) user_item
       join "user" on "user".id = user_item.user_id
	   and user_item.ordinal <= "user".items;
