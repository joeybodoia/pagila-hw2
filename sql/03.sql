/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

/*
SELECT film_id
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY film_id
ORDER BY sum(payment.amount) DESC
limit 5;
*/


select customer.customer_id 
from film
join inventory using (film_id)
join rental using (inventory_id)
join customer using (customer_id)
where film.film_id in (
    SELECT film_id
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film_id
    ORDER BY sum(payment.amount) DESC
    limit 5
)
group by customer.customer_id
order by customer.customer_id;
