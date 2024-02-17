/*
Heather Slanec
Project 2
procedure.sql
Created 12/08/23
*/
USE CIS111_FoodieTours
GO

--if SalesPerEmployee procedure exists, drop it
IF OBJECT_ID('SalesPerEmployee') IS NOT NULL
DROP PROC SalesPerEmployee
GO

--create the SalesPerEmployee procedure
CREATE PROC SalesPerEmployee
	--parameter for the branch location
	@BranchLocation INT,
	--parameter for the job title
	@JobTitle VARCHAR(20)
AS

--select attributes that will identify the customer & items sold, per employee
SELECT Employees.FirstName + ' ' + Employees.LastName AS [Employee],
	Customers.FirstName + ' ' + Customers.LastName AS [Customer],
	Orders.PartySize, 
	Customers.Phone AS [CustomerPhone], 
	Customers.Email AS [CustomerEmail],
	CONCAT(Customers.Address, ', ', Customers.City, ', ', Customers.State, ', ', 
		Customers.Zip) AS [CustomerAddress],
	Orders.OrderID, Orders.OrderDate, Orders.Destination, Airlines.Company, 
	Orders.DomesticFlightNumber, Orders.AbroadFlightNumber, Orders.PaymentDueDate, 
	Orders.AmountPaid, Orders.AmountOwed, Orders.Notes

--take data from these tables, inner joined
FROM Customers JOIN Orders
		ON Customers.CustomerID = Orders.OrderID
	JOIN Employees
		ON Customers.AgentID = Employees.EmployeeID
	JOIN Aircraft
		ON Orders.AircraftID = Aircraft.AircraftID
	JOIN Airlines
		ON Aircraft.AirlineID = Airlines.AirlineID

--filter output by @BranchLocation and @JobTitle parameters
WHERE Employees.LocationID = @BranchLocation 
	AND Employees.JobTitle = @JobTitle

--order output by Employee last name
ORDER BY Employees.LastName
GO


--output the results of the SalesPerEmployee procedure for Agents at location #1
 EXEC SalesPerEmployee @BranchLocation = 1, @JobTitle = 'Agent'
 GO

--output the results of the SalesPerEmployee procedure for Agents at location #2
 EXEC SalesPerEmployee @BranchLocation = 2, @JobTitle = 'Agent'