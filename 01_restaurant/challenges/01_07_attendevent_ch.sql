-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

-- First Method - Without nested query
SELECT CustomerID, Email FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com'

INSERT INTO CustomerResponses (CustomerID, PartySize)
VALUES (92, 3);

SELECT * FROM CustomerResponses;

UPDATE CustomerResponses
SET PartySize = 4
WHERE CustomerID = 92;

-- Another way to do it is using nested queries
-- This is where the output of one query is the
-- input into another query

-- Second Method - With Nested Query
INSERT INTO CustomerResponses (CustomerID, PartySize)
VALUES (
(SELECT CustomerID FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com'), 4);



