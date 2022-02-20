/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select title from (
    select title from (
        select title, unnest(special_features) as features from film 
    ) t1
    where features = 'Behind the Scenes'
) T1
join (
    select title, sf from (
        select title, unnest(special_features) as sf from film
    ) t2
    where sf = 'Trailers'
) T2
using (title)
order by title;



