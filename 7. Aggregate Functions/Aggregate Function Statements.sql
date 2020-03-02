--Query 8
--Sandwiches made by maker
SELECT maker_id AS "Maker", COUNT(sandwich_type) AS "Number of Sandwiches"
FROM sandwiches
GROUP BY maker_id
ORDER BY 1;

--Query 9
-- Shows which items havent been wasted
SELECT stockitem_name AS "Item", MIN(ingredients_wasted) AS "Wasted Items"
FROM stock
GROUP BY stockitem_name
HAVING MIN(ingredients_wasted) = 0
ORDER BY 1;