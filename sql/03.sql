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
/* tells us the titles of the 5 most profitable movies:*/
select distinct foo.customer_id from (select customer_id, title 
from customer 
join rental using(customer_id) 
join inventory using(inventory_id) 
join film using(film_id) 
where title IN (
        select f.title 
        from (
                select film.title, sum(payment.amount) as profit 
                from payment 
                join rental using(rental_id) 
                join inventory using(inventory_id) 
                join film using(film_id) 
                group by film.title 
                order by profit desc limit 5) 
        as f)) as foo
order by customer_id;
