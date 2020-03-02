--Query 10
--Shows which sandwiches were made the same day as the delivery
SELECT sa.item_number "Sandwiches", o.order_deliveryDate "Date"
FROM sandwiches sa INNER JOIN itemorder o
ON (sa.sandwich_datemade = o.order_deliveryDate)
ORDER BY 1;

--Query 11
--Shows which breads were wasted
SELECT i.bread_type "Meats", s.ingredients_wasted "Ingredients wasted"
FROM ingredients i right OUTER JOIN stock s
ON (i.bread_type = s.stockitem_name)
ORDER BY 1; 