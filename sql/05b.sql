/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT actor.last_name, actor.first_name
FROM actor
LEFT JOIN (select distinct actor.last_name, actor.first_name from actor join film_actor on actor.actor_id=film_actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
JOIN inventory ON film.film_id=inventory.film_id
JOIN rental ON inventory.inventory_id=rental.inventory_id
JOIN customer ON actor.first_name = customer.first_name AND actor.last_name = customer.last_name) as t
on actor.last_name=t.last_name and actor.first_name=t.first_name
where t.last_name is null and t.first_name is null
ORDER BY last_name, first_name;

