/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
JOIN film_actor USING(actor_id)
JOIN (SELECT film_id, unnest(special_features) AS special_feature FROM film) AS t USING(film_id)
WHERE t.special_feature = 'Behind the Scenes'
ORDER BY "Actor Name";
