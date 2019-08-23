DROP TABLE ItemOrder CASCADE CONSTRAINTS;
DROP TABLE Maker CASCADE CONSTRAINTS;
DROP TABLE Stock CASCADE CONSTRAINTS;
DROP TABLE Stock_ItemOrder CASCADE CONSTRAINTS;
DROP TABLE Sandwiches CASCADE CONSTRAINTS;
DROP TABLE Ingredients CASCADE CONSTRAINTS;

-- Making the ItemOrder

CREATE TABLE ItemOrder
(Order_ID Number(5),
Order_OrderDate Date,
Order_DeliveryDate Date,
Order_Cost Number(4),
Order_PlacerFirstName VarChar(24),
Order_PlacerLastName VarChar(24),
CONSTRAINT Order_ID_PK PRIMARY KEY (Order_ID));

-- Making the Maker

CREATE TABLE Maker
(Maker_ID Number(5),
Maker_FirstName VarChar(24),
Maker_LastName VarChar(24),
Maker_PhoneNumber Number(10),
Maker_Age Number(2),
CONSTRAINT Maker_ID_PK PRIMARY KEY (Maker_ID));

-- Making the Stock

CREATE TABLE Stock 
(Stock_ID Number(5),
StockItem_Name VarChar(24),
Ingredients_Wasted Number(2),
Ingredients_Lost Number(2),
ReOrder_Qty Number(2),
CONSTRAINT Stock_ID_PK PRIMARY KEY (Stock_ID));

-- Create Associative Table for Stock and ItemOrder

CREATE TABLE Stock_ItemOrder
(OrderLineItem VarChar(24),
Stock_ID Number(5) REFERENCES Stock (Stock_ID),
Order_ID Number(5) REFERENCES ItemOrder (Order_ID),
Num_Ordered Number(2),
CONSTRAINT Stock_ItemOrder_PK PRIMARY KEY ((Stock_ID),(Order_ID)));


-- Making the Sandwiches

CREATE TABLE Sandwiches
(Item_Number Number(2),
Sandwich_Type VarChar(24),
Sandwich_DateMade Date,
Maker_ID Number(5),
CONSTRAINT Item_Number_PK PRIMARY KEY (Item_Number),
CONSTRAINT Maker_ID_FK FOREIGN KEY (Maker_ID)
REFERENCES Maker (Maker_ID));

-- Making the Ingredients

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

COMMIT;
