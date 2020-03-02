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