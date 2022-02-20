/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */


-- select customer_id of customers who live in the US
/*
select customer_id from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
where country.country = 'United States';
*/
select title from film
join inventory using (film_id)
where film.film_id not in (
    select film_id from film
    join inventory using (film_id)
    join rental using (inventory_id)
    join customer using (customer_id)
    join address using (address_id)
    join city using (city_id)
    join country using (country_id)
    where country.country = 'United States'
)
group by title
order by title;
