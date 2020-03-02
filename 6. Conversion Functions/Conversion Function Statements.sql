Query 6
--Shows who ordered the delivery on January 19, and how much it clost
SELECT TO_CHAR(order_cost, '$99.00') AS "Cost", order_placerfirstname || ' ' || order_placerlastname AS "Name"
FROM itemorder
WHERE order_orderdate = TO_DATE('January 19, 2019', 'Month DD YYYY');

--Query 7
-- Shows the items that have uncommon meats
SELECT item_number AS "Item Number", (Case WHEN meat_type = 'Pastrami' THEN 'Pastrami'
             WHEN meat_type = 'Spam' THEN 'Spam' ELSE 'Not Uncommon' END) AS "Uncommon meats"
FROM ingredients
ORDER BY -1;
