--Query 12
--Shows the sandwich and the maker who made the specific sandwich
SELECT sandwich_type AS "Type",maker_id AS "Sandwich"
FROM sandwiches
WHERE sandwich_datemade = (SELECT sandwich_datemade
                           FROM sandwiches
                           WHERE maker_id = 103)
ORDER BY 1;
--Query 13
-- Shows the items that weren't lost
SELECT stockitem_name AS "Item", ingredients_lost AS "Lost"
FROM stock 
WHERE ingredients_lost IN (SELECT ingredients_lost
                           FROM stock
			   WHERE ingredients_lost = 0)
ORDER BY 1;