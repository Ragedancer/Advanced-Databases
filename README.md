# Advanced-Databases
## Description
Fall 2019. This repository is an accumulation of all databases, Astah documents, and SQL document created and used in ITEC 4200 Advanced Databases.

### Objective 
This database is designed to assist **Sandwich Shop** in keeping track of the sandwiches,
 workers, ingredients and the shipments.
- - -
## Goals 
The goal with this database project to provide a clean and organized way of storing and
retrieving important data that’s important a small sandwich shop. Along with queries and 
reports that hold important information about the ingredients, sandwich makers, and the 
stock that can help keep better track of the company’s assets.   
- - -
## Solution 
The solution is the creation of multiple database tables including the relationships between 
those tables.  The tables consist of the following: ***Makers Sandwiches Ingredients, 
***ItemOrder, Stock,*** and ***Stock_ItemOrder***.  These tables center on the key parts of a living 
sandwich shop, along with an associative table Stock_ItemOrder which combines both Stock 
and ItemOrder.  Using these tables, we can create the queries and reports that will provide 
the necessary information.  It will be implemented in using Oracle 11g Express. 
- - -
## Benefits to Users 
The database will help users better understand how a sandwich shop works, besides just making sandwiches. It will help the user and company see how ordering shipments work, all the way down to what goes on a sandwich.
- - -
## Project Outline 
The project will contain the following major components: 
•	Schema Design 
•	Entity-Relationship Diagram 
•	Table Implementation 
•	Queries 
•	Reports 	 
## Part II.  Schema Design 
 
**ItemOrder** _*(Order_ID, Order_OrderDate, Order_DeliveryDate, Order_Cost, Order_PlacerFirstName, Order_PlacerLastName)*_
 
**Maker** _*(Maker_ID, Maker_FirstName, Maker_LastName, Maker_PhoneNumber, Maker_Age)*_

**Stock** _*(Stock_ID, StockItem_Name, Ingredients_Wasted, Ingredients_Lost, Reorder_Qty)*_  
 
**Stock_ItemOrder** (_*OrderLine_Item, Stock_ID, Order_ID, Num_Ordered)*_
	
		FK Stock_ID -> STOCK
		FK Order_ID ->ITEMORDER

**Sandwiches** _*(Item_Number, Sandwich_Type, Sandwich_DateMade, Maker_ID)*_
		
		FK Maker_ID -> Maker 
 
 
**Ingredients** _*(Ingredients_ID, Meat_Type, Vegetable_Type, Sauce_Type, Bread_Type, Item_Number)*_ 
 	 
		FK Item_Number -> SANDWICHES 
             
 
  
##Entity-Relationship Diagram 

![image](https://user-images.githubusercontent.com/45640527/75711469-5f432900-5cbe-11ea-8e77-abf8c4eb07d9.png)


### Repo Location
- - -
[Advanced-Databases Repo](https://github.com/Ragedancer/Advanced-Databases)


### Tools Used
- - -
[NotePad++](https://notepad-plus-plus.org/)

[Oracle Live SQL](https://livesql.oracle.com/)

[Oracle Database 11gR2 Express Edition](https://www.oracle.com/database/technologies/xe-prior-releases.html)

[Astah Professional](http://astah.net/editions/professional)
- - -









- - -

`
