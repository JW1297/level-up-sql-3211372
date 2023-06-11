-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

-- Include: First and last name, email, sorted by number 
-- of orders
SELECT Customers.FirstName, Customers.LastName, 
Customers.Email, COUNT(Orders.CustomerID)
From Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Orders.CustomerID
ORDER BY COUNT(Orders.CustomerID) DESC
LIMIT 15;





