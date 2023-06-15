-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

-- Dracula Book ID's
SELECT BookID FROM Books
WHERE Title = 'Dracula';

-- Number of Dracula Books Owned
SELECT COUNT(BookID) FROM Books
WHERE Title = 'Dracula';

-- Number of Dracula Books Out On Loan
SELECT COUNT(BookID) FROM Loans
WHERE (ReturnedDate IS NULL)
AND (BookID IN (SELECT BookID FROM Books
WHERE Title = 'Dracula'));

-- Number of Dracula Books Available to Loan
SELECT (SELECT COUNT(BookID) FROM Books
WHERE Title = 'Dracula') - (SELECT COUNT(BookID) FROM Loans
WHERE (ReturnedDate IS NULL)
AND (BookID IN (SELECT BookID FROM Books
WHERE Title = 'Dracula'))) AS DraculaBooksAvailable;