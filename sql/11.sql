/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select DISTINCT "Actor Name" from (
    select first_name || ' ' || last_name as "Actor Name", unnest(special_features) as features 
    from actor
    join film_actor using (actor_id)
    join film using (film_id)
) t
where features = 'Behind the Scenes'
order by "Actor Name"; 
