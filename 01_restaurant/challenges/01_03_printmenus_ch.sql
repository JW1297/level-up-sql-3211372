-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

-- Report 1
-- SELECT Name, Price FROM Dishes
-- ORDER BY Price ASC;

-- Report 2
-- SELECT Name, Type FROM Dishes
-- WHERE Type = 'Appetizer' OR Type = 'Beverage';

-- Report 3
-- SELECT * FROM Dishes
-- WHERE TYPE != 'Beverage';