/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
select f.title from (select title, count(title) from customer join rental using(customer_id) join inventory using(inventory_id) join film using(film_id) where customer_id = 1 group by title having count(title) > 1) as f;
