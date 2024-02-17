/*
Heather Slanec
Project 2
trigger.sql
Created 12/08/23
*/
USE CIS111_FoodieTours
GO

--if Location_INSERT_UPDATE trigger exists, drop it
IF OBJECT_ID('Location_INSERT_UPDATE') IS NOT NULL
	DROP TRIGGER Location_INSERT_UPDATE
GO

--create trigger that is used when Orders table has an insert or update
CREATE TRIGGER Location_INSERT_UPDATE
	ON Orders
	AFTER INSERT, UPDATE
AS

--delete new/edited row
DELETE FROM Orders

--if row meets this sorting criteria
WHERE
	--aircraft 1 is selected but customer not going to Bordeaux, France
	(Orders.AircraftID = 1 AND Orders.Destination != 'Bordeaux, France')

	--aircraft 2 is selected but customer not going to Tuscany, Italy
	OR (Orders.AircraftID = 2 AND Orders.Destination != 'Tuscany, Italy')

	--aircraft 3 is selected but customer not going to Tokyo, Japan
	OR (Orders.AircraftID = 3 AND Orders.Destination != 'Tokyo, Japan')

	--aircraft 4 is selected but customer not going to Bangkok, Thailand
	OR (Orders.AircraftID = 4 AND Orders.Destination != 'Bangkok, Thailand')

	--aircraft 5 is selected but customer not going to London, England
	OR (Orders.AircraftID = 5 AND Orders.Destination != 'London, England')

	--aircraft 6 is selected but customer not going to Melbourne, Australia
	OR (Orders.AircraftID = 6 AND Orders.Destination != 'Melbourne, Australia')

--print error message to Messages tab
PRINT 'Invalid input: row deleted. Specified aircraft does not fly to specified location.'
GO


--add a bad row to Orders to test trigger - pairing AircraftID 3 w/ 'Bordeaux, France' location
/*
USE CIS111_FoodieTours

--create new row
INSERT INTO Orders
	(AircraftID, CustomerID, EmployeeID, Destination, PartySize, DomesticFlightNumber,
	AbroadFlightNumber, OrderDate, PaymentDueDate, AmountPaid, AmountOwed, Notes)
VALUES
(3, 1, 5, 'Bordeaux, France', 56, 'NK 1234', 'NK 3215', '2023-03-26 08:50:15:015', '2024-04-26 23:59:00', 0.00, 0.00, 'TEST ROW')
*/

--double check that bad row wasn't added to Orders
/*
USE CIS111_FoodieTours

--select all data from Orders table
SELECT * 
FROM Orders
*/