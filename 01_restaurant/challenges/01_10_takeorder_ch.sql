-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

-- Find Loretta in Customers table
SELECT * FROM Customers
WHERE FirstName = 'Loretta' AND LastName='Hundey';

-- Create New Order for Loretta using her
-- CustomerID
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (
(SELECT CustomerID FROM Customers
WHERE FirstName = 'Loretta' AND LastName='Hundey'),
'2022-09-20 14:00:00')

-- Find OrderID
SELECT OrderID FROM Orders
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName='Hundey') 
AND OrderDate= '2022-09-20 14:00:00';

-- DishID for each dish
SELECT DishID FROM Dishes
WHERE Name = 'House Salad';

SELECT DishID FROM Dishes
WHERE Name = 'Mini Cheeseburgers';

SELECT DishID FROM Dishes
WHERE Name = 'Tropical Blue Smoothie';

-- Add Each Dish to the Orders Dishes table
-- including the OrderID as reference
INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
(SELECT OrderID FROM Orders
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName='Hundey') 
AND OrderDate= '2022-09-20 14:00:00'), (SELECT DishID FROM Dishes 
WHERE Name = 'House Salad'));

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
(SELECT OrderID FROM Orders
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName='Hundey') 
AND OrderDate= '2022-09-20 14:00:00'), (SELECT DishID FROM Dishes
WHERE Name = 'Mini Cheeseburgers'));

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
(SELECT OrderID FROM Orders
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName='Hundey') 
AND OrderDate= '2022-09-20 14:00:00'), (SELECT DishID FROM Dishes
WHERE Name = 'Tropical Blue Smoothie'));

-- Query to Find Order Information 
SELECT FirstName, LastName, Name, Price FROM OrdersDishes 
LEFT JOIN Dishes ON OrdersDishes.DishID = Dishes.DishID
LEFT JOIN Orders ON OrdersDishes.OrderID = Orders.OrderID
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE OrdersDishes.OrderID = 1001;

-- Query to Find Total Price of Order
SELECT SUM(Price) FROM OrdersDishes 
LEFT JOIN Dishes ON OrdersDishes.DishID = Dishes.DishID
LEFT JOIN Orders ON OrdersDishes.OrderID = Orders.OrderID
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE OrdersDishes.OrderID = 1001;
