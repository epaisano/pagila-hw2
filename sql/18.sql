/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
select rank, title, revenue, "total revenue", "percent revenue" from (select rank, title, revenue, "total revenue", CASE
    WHEN "percent revenue" < 100 THEN to_char("percent revenue", 'FM00.00')
    ELSE to_char("percent revenue", 'FM000.00')
  END as "percent revenue" from (SELECT r as rank, title, revenue, "total revenue", 100*"total revenue"/67416.51 as "percent revenue" from (SELECT
    r ,
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY revenue DESC) AS "total revenue"
FROM ( SELECT rank () over (order by revenue desc) AS r, title, revenue from (SELECT
    title,
    coalesce(SUM(amount), 0.00) AS revenue
FROM
    film
LEFT JOIN
    inventory USING (film_id)
LEFT JOIN
    rental USING (inventory_id)
LEFT JOIN
    payment USING(rental_id)
GROUP BY
    title
ORDER BY
    revenue DESC) as t
ORDER BY revenue DESC) as p
ORDER BY r, title) as q) as w) as z;
