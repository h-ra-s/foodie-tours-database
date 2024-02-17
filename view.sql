/*
Heather Slanec
Project 2
view.sql
Created 12/08/23
*/
USE CIS111_FoodieTours
GO

--if view already exists, drop it
IF OBJECT_ID('PurchaseHistory') IS NOT NULL
	DROP VIEW PurchaseHistory
GO

--create the PurchaseHistory view
CREATE VIEW PurchaseHistory
AS

--select  attributes that identify the customer & order info to show purchase history
SELECT Customers.CustomerID, 
	Customers.FirstName + ' ' + Customers.LastName AS [Customer],
	Customers.Phone, Customers.Email,
	CONCAT(Customers.Address, ', ', Customers.City, ', ', Customers.State, ', ', 
		Customers.Zip) AS [Address],
	Employees.LastName + ', ' + Employees.FirstName AS [Agent],
	Orders.OrderID, Orders.Destination, Airlines.Company, Orders.DomesticFlightNumber,
	Orders.AbroadFlightNumber, Orders.PartySize, Orders.OrderDate, Orders.PaymentDueDate, 
	Orders.AmountOwed, Orders.AmountPaid, Orders.Notes

--take data from these tables, inner joined
FROM Customers JOIN Orders
		ON Customers.CustomerID = Orders.OrderID
	JOIN Employees
		ON Customers.AgentID = Employees.EmployeeID
	JOIN Aircraft
		ON Orders.AircraftID = Aircraft.AircraftID
	JOIN Airlines
		ON Aircraft.AirlineID = Airlines.AirlineID
GO


--show view
USE CIS111_FoodieTours

--select all data
SELECT *

--from PurchaseHistory view
FROM PurchaseHistory