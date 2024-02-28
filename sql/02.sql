/*
 * A film's rating can be either G, PG, PG-13, etc.
 * First, generate a query that returns the two most popular ratings.
 * Then, use a subquery to select the film_id and title columns
 * for all films whose rating is one of the two most popular.
 * Use the film table and order by title.
 */
select film_id, title from film where rating in (select t.rating from (select rating, count(rating) from film group by rating order by count desc limit 2) as t) order by title;
