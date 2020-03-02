/*
Samuel Groom
Query 1-9 Updared 10/13/19
*/
-- Query 1
-- Query 1 shows which makers are older than 20 but younger than 30
SELECT maker_firstname || ' ' || maker_lastname "Name", maker_age "Age"
FROM maker
WHERE maker_age >= 20 AND maker_age <=29
ORDER BY maker_age;


--Query 2
-- Shows which sandwich meal has sandwiches with a certain bread type
-- It will also show what kind of meat is on the sandwich
DEFINE b_type
SELECT item_number "Sandwich Meal Number", meat_type "Meat"
FROM ingredients
WHERE bread_type LIKE '&b_type'
ORDER BY item_number;
UNDEFINE b_type;
SELECT * FROM ingredients;

--Query 3
-- Show the first 5 orders delivered that cost between 25 to 75 dollars
-- Along with displaying who took the order
SELECT Order_PlacerFirstName|| ' ' || Order_PlacerLastName "Name", order_id "ID", Order_DeliveryDate "Date Arrived", Order_Cost "Cost"
FROM ItemOrder
WHERE Order_cost BETWEEN 25 AND 75
ORDER BY Order_Cost ASC;
--FETCH FIRST 5 ROWS ONLY;

--Query 4
SELECT * FROM sandwiches;
-- Shows the item number along with the sandwich, made by worker 101
SELECT maker_id "Maker", RPAD(item_number,12,'.') || LPAD(sandwich_type,20,'.') "Item"
FROM sandwiches
WHERE INSTR(maker_id,1,-1) = LENGTH(maker_id)
ORDER BY sandwich_type;

--Query 5
--Shows the estimated price of a delivery on Friday, vs the actual price.
SELECT order_orderdate "Estimated Delivery Date", '$' || ROUND(order_cost,-1) "Estimated Delivery Cost",
'$' || order_cost "Actual Cost"
FROM itemorder
WHERE NEXT_DAY(order_orderdate,'FRIDAY') = order_deliverydate
ORDER BY order_orderdate;

--Query 6
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
HAVING MIN(ingredients_wasted) = 0;

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

--Query 12
--Shows the sandwich and the maker who made the specific sandwich
SELECT sandwich_type,maker_id AS "Sandwich"
FROM sandwiches
WHERE sandwich_datemade = (SELECT sandwich_datemade
                           FROM sandwiches
                           WHERE maker_id = 103)
ORDER BY 1;
--Query 13
-- Shows the items that weren't lost
SELECT stockitem_name AS "Item", ingredients_lost AS "Lost"
FROM stock 
WHERE ingredients_lost IN (SELECT MIN(ingredients_lost)
                           FROM stock)
ORDER BY 1;

--View1
--Shows which items were ordered, how many and who took it. Along with delivery date
CREATE OR REPLACE VIEW stockItemOrder AS 
SELECT si.orderlineItem AS Item, si.num_ordered AS Num_Ordered,i.order_placerfirstname || ' ' || i.order_placerlastname AS Order_Taker,
i.order_deliverydate AS Delivery_Date
FROM stock_itemorder si JOIN itemorder i
ON si.order_id = i.order_id
ORDER BY 1;
SELECT * FROM stockItemOrder;
SELECT * FROM stockItemOrder
WHERE num_ordered > 10;

--View2
--The view display as items with their info
CREATE OR REPLACE VIEW itemInfo AS
SELECT stockitem_name AS Item, MAX(ingredients_lost) AS Ing_Lost, MAX(ingredients_wasted) AS Ing_Wasted
FROM stock
GROUP BY stockitem_name
HAVING MAX(ingredients_lost)>0;
SELECT * FROM iteminfo;
SELECT * FROM iteminfo
WHERE ing_lost > 2;

--INDEX
-- Indexing the meat type, because meat is very important on sandwiches
CREATE INDEX meat_type_idx
            ON ingredients(meat_type);
--Flashback Exercise
CREATE TABLE TEMP_SP(Name Char(20));
INSERT INTO TEMP_SP VALUES('George Washington');
SELECT * FROM TEMP_SP;
DROP TABLE TEMP_SP;
SELECT * FROM TEMP_SP;
FLASHBACK TABLE TEMP_SP TO BEFORE DROP;
SELECT * FROM TEMP_SP;

--Query14
SELECT * FROM sandwiches;
SELECT * FROM itemorder;
--Shows which sandwiches and shipments were placed or made on the same day
SELECT item_Number AS "ID",sandwich_datemade AS "Date",'sandwich' AS "Role"
FROM sandwiches
UNION
SELECT order_id,order_orderDate,'shipment'
FROM itemorder
ORDER BY 1;
--Query15
SELECT * FROM stock;
SELECT * FROM stock_itemorder;
SELECT stock_id AS "ID", stockitem_name AS "Item"
FROM stock
MINUS 
SELECT order_id,orderlineitem
FROM stock_itemorder
ORDER BY 1;