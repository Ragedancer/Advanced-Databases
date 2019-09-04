-- Samuel Groom
DROP TABLE ItemOrder CASCADE CONSTRAINTS;
DROP TABLE Maker CASCADE CONSTRAINTS;
DROP TABLE Stock CASCADE CONSTRAINTS;
DROP TABLE Stock_ItemOrder CASCADE CONSTRAINTS;
DROP TABLE Sandwiches CASCADE CONSTRAINTS;
DROP TABLE Ingredients CASCADE CONSTRAINTS;
DROP SEQUENCE ItemOrder_seq;
DROP SEQUENCE Maker_seq;
DROP SEQUENCE Stock_seq;
DROP SEQUENCE Sand_seq;
DROP SEQUENCE Ing_seq;
-- Making the ItemOrder table along with sequence

CREATE TABLE ItemOrder
(Order_ID Number(5),
Order_OrderDate Date,
Order_DeliveryDate Date,
Order_Cost Number(3),
Order_PlacerFirstName VarChar(24),
Order_PlacerLastName VarChar(24),
CONSTRAINT Order_ID_PK PRIMARY KEY (Order_ID));

CREATE SEQUENCE ItemOrder_seq
START WITH 1
INCREMENT BY 1;

-- Making the Maker table and sequence

CREATE TABLE Maker
(Maker_ID Number(5),
Maker_FirstName VarChar(24),
Maker_LastName VarChar(24),
Maker_PhoneNumber Number(10),
Maker_Age Number(2),
CONSTRAINT Maker_ID_PK PRIMARY KEY (Maker_ID));

CREATE SEQUENCE Maker_seq
START WITH 101
INCREMENT BY 1;

-- Making the Stock table and sequence

CREATE TABLE Stock 
(Stock_ID Number(5),
StockItem_Name VarChar(24),
Ingredients_Wasted Number(2),
Ingredients_Lost Number(2),
ReOrder_Qty Number(2),
CONSTRAINT Stock_ID_PK PRIMARY KEY (Stock_ID));

CREATE SEQUENCE Stock_seq
START WITH 201
INCREMENT BY 1;

-- Create Associative Table for Stock and ItemOrder

CREATE TABLE Stock_ItemOrder
(OrderLineItem VarChar(24),
Stock_ID Number(5),
Order_ID Number(5) ,
Num_Ordered Number(2),
CONSTRAINT Stock_ItemOrder_PK PRIMARY KEY (Stock_ID,Order_ID),
 CONSTRAINT Stock_ID_FK FOREIGN KEY (Stock_ID) REFERENCES Stock(Stock_ID),
 CONSTRAINT Order_ID_FK FOREIGN KEY (Order_ID) REFERENCES ItemOrder(Order_ID));


-- Making the Sandwiches table and sequence

CREATE TABLE Sandwiches
(Item_Number Number(2),
Sandwich_Type VarChar(24),
Sandwich_DateMade Date,
Maker_ID Number(5),
CONSTRAINT Item_Number_PK PRIMARY KEY (Item_Number),
CONSTRAINT Maker_ID_FK FOREIGN KEY (Maker_ID)
REFERENCES Maker (Maker_ID));

CREATE SEQUENCE Sand_seq
START WITH 10
INCREMENT BY 1;

-- Making the Ingredients table and sequence

CREATE TABLE Ingredients
(Ingredients_ID Number(5),
Meat_Type VarChar(24),
Vegetable_Type VarChar(24),
Sauce_Type VarChar(24),
Bread_Type VarChar(24),
Item_Number Number(5),
CONSTRAINT Ingredients_ID_PK PRIMARY KEY (Ingredients_ID),
CONSTRAINT Item_Number_FK FOREIGN KEY (Item_Number)
REFERENCES Sandwiches (Item_Number));

CREATE SEQUENCE Ing_seq
START WITH 300
INCREMENT BY 2;


--Inputting data into ItemOrder
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-18',DATE '2019-01-19',50,'Bruce','Greene');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-19',DATE '2019-01-20',52,'Bruce','Greene');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-20',DATE '2019-01-22',60,'Adam','Kovic');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-23',DATE '2019-01-24',45,'Lawrence','Sonntag');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-24',DATE '2019-01-25',32,'Bruce','Greene');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-25',DATE '2019-01-26',73,'James','Willems');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-26',DATE '2019-01-27',43,'Bruce','Greene');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-27',DATE '2019-01-29',97,'Lawrence','Sonntag');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-29',DATE '2019-01-30',49,'James','Willems');
INSERT INTO ItemOrder(Order_ID,Order_OrderDate,Order_DeliveryDate,Order_Cost,Order_PlacerFirstName,Order_PlacerLastName)
    VALUES(ItemOrder_seq.NEXTVAL,DATE '2019-01-30',DATE '2019-01-31',32,'Adam','Kovic');
    
    
-- Insert data into Maker

INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Sam','Groom',1234567890,22);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'LindaRose','King',2345678901,23);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Isaac','Dickson',3456789012,20);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Zollie','Chastain',4567890123,17);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Kaycee','Valentine',5678901234,21);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Nicholas','Lawhead',6789012345,25);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Bryan','McCanna',7890123456,35);
INSERT INTO Maker(Maker_ID,Maker_FirstName,Maker_LastName,Maker_PhoneNumber,Maker_Age)
    VALUES(Maker_seq.NEXTVAL,'Ethan','Bollinger',8901234567,18);

-- Insert data into Stock
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Tomato',5,3,20);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Iceberg Lettuce',1,8,20);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Pastrami',0,2,8);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Turkey',2,3,6);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Spam',8,10,5);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Chicken Breast',4,2,12);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'White Bread',4,1,10);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Rye Bread',0,0,5);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Pumpernickel',2,1,6);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Mayonnaise',0,1,5);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Mustard',1,0,3);
INSERT INTO Stock(Stock_ID,StockItem_Name,Ingredients_Wasted,Ingredients_Lost,ReOrder_Qty)
    VALUES(Stock_seq.NEXTVAL,'Bread&Butter Pickle',0,0,10);

-- Insert data into Stock_ItemOrder
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Tomato',201,1,20);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Iceberg Lettuce',202,2,20);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Pastrami',203,3,8);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Turkey',204,4,6);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Spam',205,5,5);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Chicken Breast',206,6,12);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('White Bread',207,7,10);
INSERT INTO Stock_ItemOrder(OrderLineItem,Stock_ID,Order_ID,Num_Ordered)
    VALUES('Rye Bread',208,8,5);

-- Insert data into sandwiches
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Pastrami Sandwich',DATE '2019-01-22',101);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Turkey Club',DATE '2019-01-22',101);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Tomato Sandwich',DATE '2019-01-25',104);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'All Meat Sandwich',DATE '2019-01-26',107);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Chicken Salad Sandwich', DATE '2019-01-29',103);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Spam Sandwich',DATE '2019-01-18',106);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Chicken Sandwich',DATE '2019-01-18',101);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Pastrami&Turkey Sandwich',DATE '2019-01-19',108);
INSERT INTO Sandwiches(Item_Number,Sandwich_Type,Sandwich_DateMade,Maker_ID)
    Values(Sand_seq.NEXTVAL,'Spam on a Stick',DATE '2019-01-31',108);

--Insert data into Ingredients

INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Pastrami','Bread and Butter Pickle','Mayonnaise','White Bread',10);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Turkey','Iceberg Lettuce','Mustard','White Bread',11);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,NULL,'Tomato','Mayonnaise','White Bread',12);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Pastrami','Bread and Butter Pickle',NULL,'Rye Bread',13);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Chicken Breast','Iceberg Lettuce','Mayonnaise','Pumpernickel',14);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Spam',NULL,'Mustard','White Bread',15);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Chicken Breast','Bread and Butter Pickle',NULL,'Rye Bread',16);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Pastrami','Bread and Butter Pickle','Mustard','White Bread',17);
INSERT INTO Ingredients(Ingredients_ID,Meat_Type,Vegetable_Type,Sauce_Type,Bread_Type,Item_Number)
    VALUES(Ing_seq.NEXTVAL,'Spam',NULL,NULL,NULL,18);

COMMIT;

-- Display all tables

SELECT * FROM ItemOrder;
SELECT * FROM Maker;
SELECT * FROM Stock;
SELECT * FROM Stock_ItemOrder;
SELECT * FROM Sandwiches;
SELECT * FROM Ingredients;