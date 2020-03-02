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