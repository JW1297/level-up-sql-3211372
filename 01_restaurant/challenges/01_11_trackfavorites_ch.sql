-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

-- Find Cleo Goldwater's CustomerID
SELECT CustomerID FROM Customers
WHERE FirstName = 'Cleo' AND LastName = 'Goldwater';

-- Find Cleo's Favourite DishID
SELECT DishID FROM Dishes
WHERE NAME = 'Quinoa Salmon Salad';

-- Update Cleo's Favourite Dish
UPDATE Customers
SET FavoriteDish = (SELECT DishID FROM Dishes
WHERE NAME = 'Quinoa Salmon Salad')
WHERE CustomerID = (SELECT CustomerID FROM Customers
WHERE FirstName = 'Cleo' AND LastName = 'Goldwater');

-- Check to see if Cleo's Favourite Dish has been updated
SELECT FavoriteDish FROM Customers
WHERE FirstName = 'Cleo' AND LastName = 'Goldwater';


