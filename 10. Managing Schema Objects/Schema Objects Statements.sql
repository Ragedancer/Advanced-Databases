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
