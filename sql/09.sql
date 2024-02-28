/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
SELECT special_feature AS special_features, COUNT(special_feature) FROM (
        SELECT title, unnest(special_features) AS special_feature FROM film
) AS t
GROUP BY special_feature
ORDER BY special_feature;
