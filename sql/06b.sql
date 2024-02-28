/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT
    title
FROM
    film
LEFT JOIN
    (SELECT DISTINCT
        film_id
     FROM
        film
     JOIN
        inventory USING (film_id)
     ORDER BY
        film_id) AS t
ON film.film_id=t.film_id
WHERE t.film_id IS NULL
ORDER BY title;
