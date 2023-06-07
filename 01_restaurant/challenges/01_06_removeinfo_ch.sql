-- Remove incorrect information from the database.

-- A customer named Maggi has notified us she won't 
-- be able to keep her reservation on 2022-05-11 20:00:00. 

-- The Query
SELECT * FROM Reservations 
LEFT JOIN Customers 
ON Reservations.CustomerID = Customers.CustomerID
WHERE Customers.FirstName = 'Maggi' AND Date = '2022-05-11 20:00:00';

-- The Delete
DELETE FROM Reservations
WHERE ReservationID = 1943;

-- I was hoping for a more integrated solution 
-- rather than calling the queried ID