/*
Heather Slanec
Project 2
table data.sql
Created 12/04/23
*/


USE CIS111_FoodieTours
--add records to BranchLocations table
INSERT INTO BranchLocations
	(Address, City, State, Zip)
VALUES
('251 W 26th St', 'New York', 'NY', 10001),
('317 S Broadway', 'Los Angeles', 'CA', 90013)
GO


USE CIS111_FoodieTours
--add records to Assets table
INSERT INTO Assets
	(Name, Quantity, AcquisitionDate, RenewalDate, Notes, LocationID)
VALUES
('American Society of Travel Agents Membership Documentation', 1, '2018-11-30', '2024-11-30', 'Original documentation, renew every 2 years', 1),
('Travel Insurance Direct Documentation', 1, '2018-01-10', '2024-01-10', 'Original documentation, renew annually', 1),
('Allianz Global Assistance Travel Insurance Documentation', 1, '2019-01-11', '2024-01-11', 'Original documentation, renew annually', 1),
('WorldTrips Travel Insurance Documentation', 1, '2020-01-19', '2024-01-19', 'Original documentation, renew annually', 1),
('International Medical Group Medical Insurance Documentaion', 1, '2018-02-16', '2024-02-16', 'Original documentation, renew annually', 1),
('Berkshire Hathaway Medical Insurance Documentation', 1, '2019-12-03', '2024-12-03', 'Original documentation, renew annually', 1),
('United Healthcare Medical Insurance Documentation', 1, '2020-10-10', '2024-10-10', 'Original documentation, renew annually', 1),
('Allstate Liability Insurance Documentation', 1, '2019-05-15', '2024-05-15', 'Original documentation, renew annually', 1),
('iPhone 15 Pro', 8, '2023-09-22', NULL, NULL, 1),
('iPhone 13 Pro', 6, '2021-09-24', NULL, NULL, 2),
('Apple MacBook Pro 16', 1, '2023-10-05', NULL, NULL, 1),
('Apple MacBook Air 15', 7, '2023-06-13', NULL, NULL, 1),
('Apple MacBook Air 13', 6, '2022-07-15', NULL, NULL, 2),
('ADT Security Camera', 4, '2018-08-24', '2027-08-24', 'Renew every three years', 1),
('ADT Security Camera', 4, '2021-04-13', '2027-04-13', 'Renew every three years', 2),
('Intuit QuickBooks Advanced Software', 1, '2021-03-12', '2024-01-06', 'Original documentation, includes Payroll Elite, renew monthly', 1),
('HP Color LaserJet Enterprise MFP M480f Printer', 1, '2023-12-18', NULL, NULL, 1),
('Canon PIXMA TR7520 Printer', 1, '2021-04-20', NULL, NULL, 2)
GO


USE CIS111_FoodieTours
--add records to Employees table
INSERT INTO Employees
	(LocationID, FirstName, LastName, JobTitle, ReportsTo, StartDate, Phone,
	Email, Address, City, State, Zip, Certification)
VALUES
(1, 'Heather', 'Slanec', 'Owner', NULL, '2018-08-01', '212-453-3323', 'heatherslanec@att.net', 
	'245 W 18th St', 'New York', 'NY', 10011, 'Certified Travel Industry Executive'),--1
(1, 'Alexandra', 'Slanec', 'Assistant', 1, '2018-08-02', '212-453-0895', 'alexslanec@gmail.com', 
	'245 W 18th St', 'New York', 'NY', 10011, NULL),--2
(1, 'Hermione', 'Granger', 'Manager', 1, '2018-10-31', '332-864-1023', 'hgranger@gmail.com', 
	'436 W 23rd St Apt D', 'New York', 'NY', 10011, 'Global Travel Professional'),--3
(1, 'Elizabeth', 'Windsor', 'Assistant', 3, '2021-03-14', '332-785-1452', 'queen_elizabth@icloud.com',
	'520 W 28th St #33', 'New York', 'NY', 10001, NULL),--4
(1, 'Lucille', 'Ball', 'Agent', 3, '2019-11-01', '332-983-0006', 'i.love.lucy@yahoo.com', 
	'461 W 22nd St Apt A', 'New York', 'NY', 10011, 'Certified Travel Counselor'),--5
(1, 'Peter', 'Parker', 'Agent', 3, '2019-11-09', '646-665-6396', 'spider-man@aol.net', 
	'446 W 22nd St', 'New York', 'NY', 10011, 'Certified Travel Associate'),--6
(1, 'Harry', 'Potter', 'Agent', 3, '2020-03-03', '917-682-3467', 'h.potter@icloud.com', 
	'251 W 14th St #4C', 'New York', 'NY', 10011, 'Certified Travel Associate'),--7
(1, 'Satoru', 'Gojo', 'Agent', 3, '2018-12-17', '917-073-1173', 'gojosatoru@gmail.com', 
	'555 W 22nd St #11AW', 'New York', 'NY', 10011, 'Certified Travel Counselor'),--8
(2, 'Trixie', 'Pixie', 'Manager', 1, '2018-12-13', '213-555-1212', 'trixiepixie@yahoo.com', 
	'594 S Mapleton Dr', 'Los Angeles', 'CA', 9002, 'Global Travel Professional'),--9
(2, 'Slicksy', 'Pixie', 'Assistant', 9, '2023-06-26', '310-0103-3325', 'not.trixie@att.net', 
	'9501 Gloaming Dr', 'Beverly Hills', 'CA', 90210, NULL),--10
(2, 'Darth', 'Vader', 'Agent', 9, '2023-07-09', '424-987-6243', 'davader@aol.net', 
	'10710 Chalon Rd', 'Los Angeles', 'CA', 90077, 'Certified Travel Associate'),--11
(2, 'Tohru', 'Honda', 'Agent', 9, '2022-08-21', '661-147-8523', 'honda.tohru@icloud.com', 
	'17407 Rancho St', 'Encino', 'CA', 91316, 'Certified Travel Counselor'),--12
(2, 'Taylor', 'Swift', 'Agent', 9, '2023-07-01', '818-963-2587', 'tswift@gmail.com', 
	'10644 Bellagio Rd', 'Los Angeles', 'CA', 90077, 'Certified Travel Associate'),--13
(2, 'Betty', 'White', 'Agent', 9, '2021-04-04', '323-749-6315', 'bethany.w@aol.net', 
	'2601 Summitridge Dr', 'Beverly Hills', 'CA', 90210, 'Certified Travel Counselor')--14
GO


USE CIS111_FoodieTours
--add records to Customers table
INSERT INTO Customers
	(AgentID, FirstName, LastName, Phone, Email, Address, City, State, Zip)
VALUES
(5, 'Sophie', 'Hatter', '949-987-6325', 'ny.hatters@gmail.com', 
	'100 W 31st St', 'New York', 'NY', 10001),
(6, 'Edward', 'Cullen', '213-356-9854', 'sparkle123@yahoo.com', 
	'400 W 42nd St', 'New York', 'NY', 10036),
(7, 'Tom', 'Riddle', '818-256-0602', 'voldemort@att.net', 
	'132 W 26th St', 'New York', 'NY', 10001),
(8, 'Suguru', 'Geto', '626-003-4025', 'sgeto@gmail.com', 
	'525 W 28th St', 'New York', 'NY', 10001),
(11, 'Jack', 'Sparrow', '929-989-4526', 'sparrowj@aol.com', 
	'427 W 5th St', 'Los Angeles', 'CA', 90013),
(12, 'Elle', 'Woods', '845-888-2651', 'e.woods3@icloud.com', 
	'8655 Belford Ave', 'Los Angeles', 'CA', 90045),
(13, 'Wednesday', 'Addams', '518-626-4585', 'wednesday.addams@att.net', 
	'1000 W 8th St', 'Los Angeles', 'CA', 90017),
(14, 'Snoop', 'Dog', '585-336-9936', 'snoopy@icloud.com', 
	'732 Spring St', 'Los Angeles', 'CA', 90014),
(8, 'Shoko', 'Leiri', '209-672-2030', 'shoko_l@aol.com', 
	'420 W 42nd St', 'New York', 'NY', 10036),
(5, 'Howl', 'Penndragon', '925-604-7083', 'h.penndragon@yahoo.com', 
	'356 W 39th St', 'New York', 'NY', 10018)
GO


USE CIS111_FoodieTours
--add records to Airlines table
INSERT INTO Airlines
	(Company, TravelInsurance, TravelMedicalInsurance, FoodieFlightPoints, ComplimentaryItems, Destinations)
VALUES
('Spirit', 'Travel Insurance Direct', 'International Medical Group', 78100, NULL, 'Tuscany, Italy; Bordeaux, France'),
('Delta', 'WorldTrips', 'United Healthcare', 103400, 'Earbuds, snacks, meals, drinks', 'Tokyo, Japan; Bangkok, Thailand'),
('SouthWest', 'Allianz Global Assistance', 'Berkshire Hathaway', 59200, 'Two checked bags, carry-on bag, snacks' , 'London, England; Melbourne, Australia')
GO


USE CIS111_FoodieTours
--add records to Aircraft table
INSERT INTO Aircraft
	(Model, Seats, EntertainmentSystems, AirlineID)
VALUES
('Airbus A319 (319)', 145, NULL, 1),
('Airbus A321 (32B)', 228, NULL, 1),
('Airbus A330-900neo (339)', 281, 'TV', 2),
('Boeing 757-300 (75Y)', 234, 'TV', 2),
('Boeing 737-700', 143, 'TV', 3),
('Boeing 737-MAX 8', 175, 'TV', 3)
GO


USE CIS111_FoodieTours
--add records to Orders table
INSERT INTO Orders
	(AircraftID, CustomerID, EmployeeID, Destination, PartySize, DomesticFlightNumber,
	AbroadFlightNumber, OrderDate, PaymentDueDate, AmountPaid, AmountOwed, Notes)
VALUES
(1, 1, 5, 'Bordeaux, France', 12, 'NK 1234', 'NK 3215', '2022-03-26 08:50:15:015', '2022-04-26 23:59:00', 22000.00, 0.00, 'Party members paying separately'),
(3, 2, 6, 'Tokyo, Japan', 2, 'DL 9874', 'DL 3526', '2023-11-30 09:12:03:065', '2023-12-30 23:59:00', 0.00, 4000.00, NULL),
(5, 3, 7, 'London, England', 1, 'WN 3452', 'WN 1162', '2020-08-15 10:25:59:160', '2020-10-15 23:59:00', 12000.00, 0.00, 'Payment due date extended to 2020-10-15 on 2022-08-15'),
(2, 4, 8, 'Tuscany, Italy', 3, 'NK 6985', 'NK 6245', '2018-12-20 11:23:10:095', '2019-01-20 23:59:00', 1.00, 6999.00, 'Reported to IRS'),
(4, 5, 11, 'Bangkok, Thailand', 7, 'DL 5050', 'DL 6305', '2023-07-15 12:00:36:085', '2023-08-15 23:59:00', 100000.00, 5650.00, 'Expect payment on 2023-12-10'),
(6, 6, 12, 'Melbourne, Australia', 4, 'WN 6010', 'WN 3020', '2022-10-30 01:03:03:234', '2023-12-30 23:59:00', 4657.00, 453.00, 'Payment due dat extended to 2023-12-30 on 2022-11-30'),
(1, 7, 13, 'Bordeaux, France', 2, 'NK 2576', 'NK 3710', '2023-07-03 02:45:12:072', '2023-08-03 23:59:00', 5000.00, 0.00, NULL),
(4, 8, 14, 'Bangkok, Thailand', 9, 'DL 5552', 'DL 3525', '2021-04-19 03:15:21:173', '2021-05-19 23:59:00', 685250.00, 0.00, 'Party members paying separately'),
(5, 9, 8, 'London, England', 4, 'WN 1056', 'WN 7098', '2020-03-01 04:36:00:041', '2020-04-01 23:59:00', 80960.00, 0.00, NULL),
(3, 10, 5, 'Tokyo, Japan', 1, 'DL 3618', 'DL 5714', '2023-04-12 4:12:49:011', '2023-05-12 23:59:00', 1000.00, 2530.00, 'Reaching out to contact for payment')