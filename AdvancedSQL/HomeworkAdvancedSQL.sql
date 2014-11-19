USE TelerikAcademy
GO

--01. Write a SQL query to find the names and salaries of the employees 
------that take the minimal salary in the company. Use a nested SELECT statement.
SELECT e.FirstName, e.LastName, e.Salary
	FROM Employees e
		WHERE e.Salary = 
			(SELECT MIN(Salary)
				FROM Employees)
GO

--02. Write a SQL query to find the names and salaries of the employees 
------that have a salary that is up to 10% higher than the minimal salary for the company.
SELECT e.FirstName, e.LastName, e.Salary
	FROM Employees e
		WHERE e.Salary <= 
			(SELECT MIN(Salary) + (MIN(Salary) / 10)
				FROM Employees)
GO

--03. Write a SQL query to find the full name, salary and department of the employees 
------that take the minimal salary in their department. Use a nested SELECT statement.
SELECT e.FirstName + ' ' + e.LastName AS [Full Name], e.Salary
	FROM Employees e
		WHERE e.Salary = 
			(SELECT MIN(Salary)
				FROM Employees)
GO
--04. Write a SQL query to find the average salary in the department #1.
SELECT AVG(e.Salary) AS [Average Salary]
	FROM Employees e
		WHERE e.DepartmentID = 1
GO

--05. Write a SQL query to find the average salary  in the "Sales" department.
SELECT AVG(e.Salary) AS [Average Salary]
	FROM Employees e
		JOIN Departments d
			ON e.DepartmentID = d.DepartmentID
				WHERE d.Name = 'Sales'
GO

--06. Write a SQL query to find the number of employees in the "Sales" department.
SELECT COUNT(*) AS [Employees in 'Sales'] 
	FROM Employees e
		JOIN Departments d
			ON e.DepartmentID = d.DepartmentID
				WHERE d.Name = 'Sales'
GO

--07. Write a SQL query to find the number of all employees that have manager.
SELECT COUNT(*) AS [Employees With Manager] 
	FROM Employees e
		WHERE e.ManagerID IS NOT NULL
GO

--08. Write a SQL query to find the number of all employees that have no manager.
SELECT COUNT(*) AS [Employees With No Manager] 
	FROM Employees e
		WHERE e.ManagerID IS NULL
GO

--09. Write a SQL query to find all departments and the average salary for each of them.
SELECT d.Name AS [Department Name], AVG(e.Salary) AS [Average Salary]
	FROM Employees e
		JOIN Departments d
			ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name
GO

--10. Write a SQL query to find the count of all employees in each department and for each town.
SELECT d.Name AS [Department], t.Name AS [Town], COUNT(e.EmployeeID) AS [Employees]
	FROM Departments d
		JOIN Employees e
			ON e.DepartmentID = d.DepartmentID
		JOIN Addresses a
			ON e.AddressID = a.AddressID
		JOIN Towns t
			ON t.TownID = a.TownID
GROUP BY t.Name, d.Name
GO

--11. Write a SQL query to find all managers that have exactly 5 employees. 
------Display their first name and last name.
SELECT m.FirstName, m.LastName
	FROM Employees m 
		JOIN Employees e
			ON m.EmployeeID = e.ManagerID
GROUP BY m.LastName, m.FirstName
HAVING COUNT(e.EmployeeID) = 5
GO

--12. Write a SQL query to find all employees along with their managers. 
------For employees that do not have manager display the value "(no manager)".
SELECT e.FirstName + ' ' + e.LastName AS [Employee Name],
		ISNULL(m.FirstName + ' ' + m.LastName, 'no manager') AS [Manager Name]
	FROM Employees m 
		RIGHT JOIN Employees e
			ON m.EmployeeID = e.ManagerID
GO

--13. Write a SQL query to find the names of all employees whose last name is exactly 5 characters long. 
------Use the built-in LEN(str) function.
SELECT  e.FirstName + ' ' + e.LastName AS [Employee Name]
	FROM Employees e
		WHERE LEN(e.LastName) = 5
GO

--14. Write a SQL query to display the current date and time in the following format 
------"day.month.year hour:minutes:seconds:milliseconds". 
------Search in  Google to find how to format dates in SQL Server.
SELECT CONVERT(nvarchar, GETDATE(), 104) + ' ' + CONVERT(varchar, GETDATE(), 114) AS [Current Time]
GO

--15. Write a SQL statement to create a table Users. 
------Users should have username, password, full name and last login time. 
------Choose appropriate data types for the table fields. 
------Define a primary key column with a primary key constraint. 
------Define the primary key column as identity to facilitate inserting records. 
------Define unique constraint to avoid repeating usernames. 
------Define a check constraint to ensure the password is at least 5 characters long.
CREATE TABLE Users (
	UserID int IDENTITY,
	Username varchar(50) NOT NULL UNIQUE,
	Password varchar(100) NOT NULL CHECK(LEN(Password) >= 5),
	FullName nvarchar(100),
	LastLoginTime datetime,
	CONSTRAINT PK_Users PRIMARY KEY(UserID))
GO

--16. Write a SQL statement to create a view that displays the users 
------from the Users table that have been in the system today. Test if the view works correctly.
CREATE VIEW [Users In The System Today] AS
	SELECT u.Username
		FROM Users u
			WHERE DATEPART(YEAR, u.LastLoginTime) = DATEPART(YEAR, GETDATE()) 
				AND DATEPART(MONTH, u.LastLoginTime) = DATEPART(MONTH, GETDATE())
				AND DATEPART(DAY, u.LastLoginTime) = DATEPART(DAY, GETDATE())
GO

--17. Write a SQL statement to create a table Groups. 
------Groups should have unique name (use unique constraint). 
------Define primary key and identity column.
CREATE TABLE Groups (
	GroupID int IDENTITY,
	Name nvarchar(50) NOT NULL UNIQUE,
	CONSTRAINT PK_Groups PRIMARY KEY(GroupID))
GO

--18. Write a SQL statement to add a column GroupID to the table Users. 
------Fill some data in this new column and as well in the Groups table. 
------Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.
ALTER TABLE Users
	ADD GroupID int
GO

ALTER TABLE Users
	ADD CONSTRAINT FK_Users_Groups
		FOREIGN KEY (GroupID)
		REFERENCES Groups(GroupID)
GO

--19. Write SQL statements to insert several records in the Users and Groups tables.
INSERT 
	INTO Users (
		Username,
		Password,
		FullName)
	VALUES (
		'SomeOtherUser',
		'someOtherUsersPass',
		'Some Other User')
GO

INSERT
	INTO Groups (
		Name)
	VALUES (
		'GroupToBeDeleted')
GO

--20. Write SQL statements to update some of the records in the Users and Groups tables.
UPDATE Users
	SET GroupID = 1
		WHERE Username = 'SomeUser'
GO

UPDATE Groups
	SET Name = 'SomeRenamedGroup'
		WHERE Name = 'SomeOtherGroup'
GO

--21. Write SQL statements to delete some of the records from the Users and Groups tables.
DELETE
	FROM Groups
		WHERE Name = 'GroupToBeDeleted'
GO

DELETE
	FROM Users
		WHERE Username = 'asdasd'
GO

--22. Write SQL statements to insert in the Users table the names of all employees 
------from the Employees table. Combine the first and last names as a full name. 
------For username use the first letter of the first name + the last name (in lowercase). 
------Use the same for the password, and NULL for last login time.
INSERT 
	INTO Users (
		FullName,
		Username,
		Password)
	SELECT e.FirstName + ' ' + e.LastName,
			LOWER(SUBSTRING(e.FirstName, 1, 1) + SUBSTRING(e.LastName, 1, 1)),
			LOWER(SUBSTRING(e.FirstName, 1, 1) + SUBSTRING(e.LastName, 1, 1)) + '_pass' -- Need Three More Symbols
		FROM Employees e
GO

--23. Write a SQL statement that changes the password to NULL for all users 
------that have not been in the system since 10.03.2010.
UPDATE Users
	SET Password = NULL
		WHERE LastLoginTime < '2010/03/10' --I've made the column so it can't be NULL, but the query would work.
GO

--24. Write a SQL statement that deletes all users without passwords (NULL password).
DELETE
	FROM Users
		WHERE Username IS NULL --I've made the column so it can't be NULL, but the query would work.
GO

--25. Write a SQL query to display the average employee salary by department and job title.
SELECT d.Name AS [Department Name], e.JobTitle, AVG(e.Salary) AS [Average Salary]
	FROM Employees e
		JOIN Departments d
			ON e.DepartmentID = d.DepartmentID
GROUP BY e.JobTitle, d.Name
GO

--26. Write a SQL query to display the minimal employee salary by department 
------and job title along with the name of some of the employees that take it.
SELECT MIN(e.FirstName + ' ' + e.LastName) AS [Employee Name], d.Name AS [Department Name], e.JobTitle, AVG(e.Salary) AS [Average Salary]
	FROM Employees e
		JOIN Departments d
			ON e.DepartmentID = d.DepartmentID
GROUP BY e.JobTitle, d.Name
GO
--27. Write a SQL query to display the town where maximal number of employees work.
DECLARE @max_count int
SET @max_count = (SELECT MAX(q1.EmployeeCount) FROM (SELECT COUNT(e.EmployeeID)  AS EmployeeCount
                                  FROM Employees e     
                                  INNER JOIN Addresses a ON e.AddressID = a.AddressID
                                  INNER JOIN Towns t ON a.TownID = t.TownID
                                  GROUP BY t.Name) q1)
 
SELECT * FROM Towns
WHERE TownID = (SELECT e1.TownId FROM (
                                        SELECT t.TownId, COUNT(e.EmployeeID) as EmployeeCount
                                        FROM Towns t
                                        INNER JOIN Addresses a ON a.TownID = t.TownId
                                        INNER JOIN Employees e ON e.AddressID = a.AddressID
                                        GROUP BY t.TownID) e1
                                WHERE e1.EmployeeCount = @max_count)
                               
/* 28. Write a SQL query to display the number of managers from each town. */
SELECT t.*, COUNT(e.EmployeeID) as ManagerCount
FROM Towns t
INNER JOIN Addresses a ON a.TownID = t.TownId
INNER JOIN Employees e ON e.AddressID = a.AddressID
 
WHERE e.EmployeeID IN(
SELECT DISTINCT m.EmployeeID FROM Employees m
INNER JOIN Employees e ON m.EmployeeID = e.ManagerID)
GROUP BY t.Name, t.TownID
 
/* 29. Write a SQL to create table WorkHours to store work reports for each employee
(employee id, date, task, hours, comments). Don't forget to define  identity,
primary key and appropriate foreign key.
        Issue few SQL statements to insert, update and delete of some data in the table.
        Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
        For each change keep the old record data, the new record data and the command
   (insert / update / delete). */
   
 CREATE TABLE [dbo].[WorkHours](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [EmployeeId] [int] NOT NULL,
        [Date] [date] NOT NULL,
        [Task] [nvarchar](80) NOT NULL,
        [Hours] [float] NOT NULL,
        [Comments] [nvarchar] (300) NOT NULL,
 CONSTRAINT [PK_WorkHours] PRIMARY KEY CLUSTERED
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
 
GO
 
ALTER TABLE [dbo].[WorkHours]  WITH CHECK ADD  CONSTRAINT [FK_WorkHours_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
 
ALTER TABLE [dbo].[WorkHours] CHECK CONSTRAINT [FK_WorkHours_Employees]
GO
 
----------------------------------------------------------------------------------------------------
INSERT INTO WorkHours
VALUES (5, '12-05-2012', 'Added new product', 2.30, 'The new product will be developed')
 
INSERT INTO WorkHours
VALUES (12, '10-25-2011', 'Found a new bug', 2.30, 'Found a bug in an existing project')
 
INSERT INTO WorkHours
VALUES (181, '7-7-2012', 'Fixed a fe bugs', 2.30, 'Fixed some bugs before the release')
 
UPDATE WorkHours
SET EmployeeId = 141
WHERE Id = 3
 
UPDATE WorkHours
SET EmployeeId = 13
WHERE EmployeeId = 10
 
DELETE FROM WorkHours
WHERE EmployeeId = 5
 
DELETE FROM WorkHours
WHERE Date = '10-24-2011'
 
--------------------------------------------------------------------------------------------------
 
CREATE TABLE [dbo].[WorkHoursLogs](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [OldEmployeeId] [int],
        [OldDate] [date],
        [OldTask] [nvarchar](80),
        [OldHours] [float],
        [OldComments] [nvarchar] (300),
        [NewEmployeeId] [int],
        [NewDate] [date],
        [NewTask] [nvarchar](80),
        [NewHours] [float],
        [NewComments] [nvarchar] (300),
        [Command] [nvarchar] (30),
 CONSTRAINT [PK_WorkHoursLogs] PRIMARY KEY CLUSTERED
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
 
----------------------------------------------------------------------------------------------------
 
USE [TelerikAcademy]
GO
/****** Object:  Trigger [dbo].[WorkHoursInsert]    Script Date: 24.12.2012 ?. 16:00:28 ?. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE TRIGGER [dbo].[WorkHoursInsert] ON [dbo].[WorkHours]
AFTER INSERT
AS
DECLARE @newEmployeeId int, @newDate date, @newTask nvarchar (80),
        @newHours float, @newComment nvarchar (max)
 
SELECT @newEmployeeId = i.EmployeeId, @newDate = i.Date,
        @newTask = i.Task, @newHours = i.Hours, @newComment = i.Comments
FROM [dbo].[WorkHours] AS p INNER JOIN inserted i
ON p.Id = i.Id
 
INSERT INTO WorkHoursLogs (NewEmployeeId, NewDate, NewTask,
        NewHours, NewComments, Command)
VALUES (@newEmployeeId, @newDate, @newTask, @newHours, @newComment, 'Insert')
 
 
USE [TelerikAcademy]
GO
/****** Object:  Trigger [dbo].[WorkHoursUpdate]    Script Date: 25.12.2012 ?. 12:21:00 ?. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE TRIGGER [dbo].[WorkHoursUpdate] ON [dbo].[WorkHours]
AFTER UPDATE
AS
DECLARE @newEmployeeId int, @newDate date, @newTask nvarchar (80),
        @newHours float, @newComment nvarchar (300),
        @oldEmployeeId int, @oldDate date, @oldTask nvarchar (80),
        @oldHours float, @oldComment nvarchar (300)
 
SELECT @oldEmployeeId = i.EmployeeId, @oldDate = i.Date,
        @oldTask = i.Task, @oldHours = i.Hours, @oldComment = i.Comments
FROM [dbo].[WorkHours] AS p INNER JOIN deleted i
ON p.Id = i.Id
 
SELECT @newEmployeeId = i.EmployeeId, @newDate = i.Date,
        @newTask = i.Task, @newHours = i.Hours, @newComment = i.Comments
FROM [dbo].[WorkHours] AS p INNER JOIN inserted i
ON p.Id = i.Id
 
INSERT INTO WorkHoursLogs (OldEmployeeId, OldDate, OldTask,
        OldHours, OldComments, NewEmployeeId, NewDate, NewTask,
        NewHours, NewComments, Command)
VALUES (@oldEmployeeId, @oldDate, @oldTask, @oldHours, @oldComment,
                @newEmployeeId, @newDate, @newTask, @newHours, @newComment,
                'Update')
               
               
USE [TelerikAcademy]
GO
/****** Object:  Trigger [dbo].[WorkHoursDelete]    Script Date: 25.12.2012 ?. 12:42:59 ?. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE TRIGGER [dbo].[WorkHoursDelete] ON [dbo].[WorkHours]
AFTER DELETE
AS
DECLARE @oldEmployeeId int, @oldDate date, @oldTask nvarchar (80),
        @oldHours float, @oldComment nvarchar (300)
 
SELECT @oldEmployeeId = i.EmployeeId, @oldDate = i.Date,
           @oldTask = i.Task, @oldHours = i.Hours, @oldComment = i.Comments
FROM deleted i
 
INSERT INTO WorkHoursLogs (OldEmployeeId, OldDate, OldTask,
        OldHours, OldComments, Command)
VALUES (@oldEmployeeId, @oldDate, @oldTask, @oldHours, @oldComment,
                'Delete')
               
/* 30. Start a database transaction, delete all employees from the 'Sales' department
along with all dependent records from the pother tables.
At the end rollback the transaction. */
USE TelerikAcademy
GO
 
BEGIN TRAN DeleteEmployees
 
DECLARE @id int, @managerId int
SET @id = (SELECT DepartmentID FROM Departments
WHERE Name = 'Sales')
SET @managerId = (SELECT ManagerID
FROM Departments WHERE DepartmentID = @id)
 
DELETE FROM Employees
WHERE DepartmentID = @id AND EmployeeID != @managerId
 
ROLLBACK TRAN DeleteEmployees
 
/* 31. Start a database transaction and drop the table EmployeesProjects.
Now how you could restore back the lost table data? */
USE TelerikAcademy
GO
 
BEGIN TRAN
 
DROP TABLE EmployeesProjects
 
ROLLBACK TRAN
 
/* 32. Find how to use temporary tables in SQL Server. Using temporary tables backup all records
from EmployeesProjects and restore them back after dropping and re-creating the table */
BEGIN TRAN
 
CREATE TABLE #EmployeesProjectsTemp(
        EmployeeID int NOT NULL,
        ProjectID int NOT NULL,
        PRIMARY KEY (EmployeeID, ProjectID)
)
 
GO
 
INSERT INTO #EmployeesProjectsTemp (EmployeeID, ProjectID)
SELECT EmployeeID, ProjectID FROM EmployeesProjects
 
SELECT * FROM #EmployeesProjectsTemp
 
DROP TABLE EmployeesProjects
 
GO
 
CREATE TABLE EmployeesProjects(
        EmployeeID int NOT NULL,
        ProjectID int NOT NULL,
        PRIMARY KEY (EmployeeID, ProjectID)
)
 
GO
 
INSERT INTO EmployeesProjects (EmployeeID, ProjectID)
SELECT EmployeeID, ProjectID FROM #EmployeesProjectsTemp
 
SELECT EmployeeID, ProjectID FROM EmployeesProjects