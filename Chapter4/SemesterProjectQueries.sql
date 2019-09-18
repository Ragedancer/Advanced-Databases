/*
Samuel Groom
Query 1-3 Written 9/10/19
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

--Query 3
-- Show the first 5 orders delivered that cost between 25 to 75 dollars
-- Along with displaying who took the order
SELECT Order_PlacerFirstName|| ' ' || Order_PlacerLastName "Name", order_id "ID", Order_DeliveryDate "Date Arrived", Order_Cost "Cost"
FROM ItemOrder
WHERE Order_cost BETWEEN 25 AND 75
ORDER BY Order_Cost ASC
FETCH FIRST 5 ROWS ONLY;