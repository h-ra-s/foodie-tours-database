/*
Heather Slanec
Project 2
database and table creation.sql
Created 12/03/23
*/

--use master database
USE master
--create the CIS111_FoodieTours database if it doesn't exist
IF DB_ID('CIS111_FoodieTours') IS NULL
	CREATE DATABASE CIS111_FoodieTours
GO

--drop the foreign keys in the CIS111_FoodieTours database if they exist
USE CIS111_FoodieTours
WHILE(EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE='FOREIGN KEY'))
  BEGIN
	DECLARE @sql NVARCHAR(2000)
	SELECT TOP 1 @sql=('Alter Table ' + TABLE_SCHEMA + 
	  '.[' + TABLE_NAME + '] Drop Constraint [' + CONSTRAINT_NAME + ']')
	FROM information_schema.table_constraints
	WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
	EXEC (@sql)
  END
 GO

--drop the tables in the CIS111_FoodieTours database if they exist
USE CIS111_FoodieTours
IF OBJECT_ID('Orders') IS NOT NULL
	DROP TABLE Orders
IF OBJECT_ID('Aircraft') IS NOT NULL
	DROP TABLE Aircraft
IF OBJECT_ID('Airlines') IS NOT NULL
	DROP TABLE Airlines
IF OBJECT_ID('Customers') IS NOT NULL
	DROP TABLE Customers
IF OBJECT_ID('Employees') IS NOT NULL
	DROP TABLE Employees
IF OBJECT_ID('Assets') IS NOT NULL
	DROP TABLE Assets
IF OBJECT_ID('BranchLocations') IS NOT NULL
	DROP TABLE BranchLocations
GO

--create BranchLocations table
USE CIS111_FoodieTours
CREATE TABLE BranchLocations
(LocationID	TINYINT		NOT NULL IDENTITY PRIMARY KEY,
Address		VARCHAR(20)	NOT NULL,
City		VARCHAR(20)	NOT NULL,
State		CHAR(2)		NOT NULL,
Zip			INT			NOT NULL)
GO

--create Assets table
USE CIS111_FoodieTours
CREATE TABLE Assets
(AssetID		TINYINT			NOT NULL IDENTITY PRIMARY KEY,
Name			VARCHAR(100)	NOT NULL,
Quantity		SMALLINT		NOT NULL,
AcquisitionDate	DATE			NOT NULL,
RenewalDate		DATE			NULL,
Notes			VARCHAR(200)	NULL,
LocationID		TINYINT			NOT NULL REFERENCES BranchLocations(LocationID))
GO

--create Employees table
USE CIS111_FoodieTours
CREATE TABLE Employees
(EmployeeID		TINYINT			NOT NULL IDENTITY PRIMARY KEY,
FirstName		VARCHAR(20)		NOT NULL,
LastName		VARCHAR(30)		NOT NULL,
JobTitle		VARCHAR(20)		NOT NULL,
ReportsTo		TINYINT			NULL,
StartDate		DATE			NOT NULL,
Phone			VARCHAR(13)		NOT NULL,
Email			VARCHAR(30)		NOT NULL,
Address			VARCHAR(20)		NOT NULL,
City			VARCHAR(20)		NOT NULL,
State			CHAR(2)			NOT NULL,
Zip				INT				NOT NULL,
Certification	VARCHAR(50)		NULL,
LocationID		TINYINT			NOT NULL REFERENCES BranchLocations(LocationID))
GO

--create Customers table
USE CIS111_FoodieTours
CREATE TABLE Customers
(CustomerID	SMALLINT	NOT NULL IDENTITY PRIMARY KEY,	
FirstName	VARCHAR(20)	NOT NULL,
LastName	VARCHAR(30)	NOT NULL,
Phone		VARCHAR(13)	NOT NULL,
Email		VARCHAR(30)	NOT NULL,
Address		VARCHAR(20)	NOT NULL,
City		VARCHAR(20)	NOT NULL,
State		CHAR(2)		NOT NULL,
Zip			INT			NOT NULL,
AgentID		TINYINT		NOT NULL REFERENCES Employees(EmployeeID))
GO

--create Airlines table
USE CIS111_FoodieTours
CREATE TABLE Airlines
(AirlineID			TINYINT		NOT NULL IDENTITY PRIMARY KEY,
Company				VARCHAR(20)	NOT NULL,
TravelInsurance		VARCHAR(50)	NOT NULL,
TravelMedicalInsurance	VARCHAR(50)	NOT NULL,
FoodieFlightPoints	INT			NOT NULL,
ComplimentaryItems	VARCHAR(50)	NULL,
Destinations		VARCHAR(40)	NOT NULL)
GO

--create Aircraft table
USE CIS111_FoodieTours
CREATE TABLE Aircraft
(AircraftID				TINYINT		NOT NULL IDENTITY PRIMARY KEY,	
Model					VARCHAR(30)	NOT NULL,
Seats					SMALLINT	NOT NULL,
EntertainmentSystems	VARCHAR(50)	NULL,
AirlineID				TINYINT		NOT NULL REFERENCES Airlines(AirlineID))
GO

--create Orders table
USE CIS111_FoodieTours
CREATE TABLE Orders
(OrderID				SMALLINT		NOT NULL IDENTITY PRIMARY KEY,
Destination				VARCHAR(20)		NOT NULL,
PartySize				TINYINT			NOT NULL,
DomesticFlightNumber	VARCHAR(7)		NOT NULL,
AbroadFlightNumber		VARCHAR(7)		NOT NULL,
OrderDate				DATETIME		NOT NULL,
PaymentDueDate			DATETIME		NOT NULL,
AmountPaid				MONEY			NOT NULL,
AmountOwed				MONEY			NOT NULL,
Notes					VARCHAR(200)	NULL,
AircraftID				TINYINT			NOT NULL REFERENCES Aircraft(AircraftID),
CustomerID				SMALLINT		NOT NULL REFERENCES Customers(CustomerID),
EmployeeID				TINYINT			NOT NULL REFERENCES Employees(EmployeeID))