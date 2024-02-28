/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select title from film where film_id in (SELECT DISTINCT inventory.film_id
FROM inventory
LEFT JOIN
        (SELECT inventory.film_id FROM inventory
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id) WHERE country ilike '%nited state%') as t 
on inventory.film_id=t.film_id
where t.film_id is null)
ORDER BY title;
