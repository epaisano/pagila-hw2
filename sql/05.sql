/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 05b you will use the LEFT JOIN clause.
 */
SELECT last_name, first_name
from actor act 
WHERE last_name NOT IN (SELECT distinct actor.last_name
FROM actor
JOIN film_actor on actor.actor_id=film_actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
JOIN inventory ON film.film_id=inventory.film_id
JOIN rental ON inventory.inventory_id=rental.inventory_id
JOIN customer ON actor.first_name = customer.first_name AND actor.last_name = customer.last_name) or first_name not in (SELECT distinct actor.first_name
FROM actor
JOIN film_actor on actor.actor_id=film_actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
JOIN inventory ON film.film_id=inventory.film_id
JOIN rental ON inventory.inventory_id=rental.inventory_id
JOIN customer ON actor.first_name = customer.first_name AND actor.last_name = customer.last_name)
order by last_name, first_name;
