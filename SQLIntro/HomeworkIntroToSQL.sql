USE TelerikAcademy
GO

--04. Write a SQL query to find all information about all departments (use "TelerikAcademy" database).
SELECT *
	FROM Departments
GO

--05. Write a SQL query to find all department names.
SELECT Name AS [Department Name]
	FROM Departments
GO

--06. Write a SQL query to find the salary of each employee.
SELECT FirstName + ' ' + LastName AS [Employee name], Salary 
	FROM Employees
GO

--07. Write a SQL to find the full name of each employee.
SELECT FirstName + ' ' + LastName AS [Employee fullname]
	FROM Employees
GO

--08. Write a SQL query to find the email addresses of each employee (by his first and last name). 
------Consider that the mail domain is telerik.com. Emails should look like “John.Doe@telerik.com". 
------The produced column should be named "Full Email Addresses".
SELECT FirstName + '.' + LastName + '@telerik.com' AS [Full Email Address]
	FROM Employees
GO

--09. Write a SQL query to find all different employee salaries.
SELECT DISTINCT Salary
	FROM Employees
GO

--10. Write a SQL query to find all information about the employees whose job title is “Sales Representative“.
SELECT *
	FROM Employees e
		WHERE e.JobTitle = 'Sales Representative'
GO

--11. Write a SQL query to find the names of all employees whose first name starts with "SA".
SELECT FirstName + ' ' + LastName AS [Full Name] 
	FROM Employees
		WHERE FirstName LIKE 'sa%'
GO

--12. Write a SQL query to find the names of all employees whose last name contains "ei".
SELECT FirstName + ' ' + LastName AS [Full Name] 
	FROM Employees
		WHERE LastName LIKE '%ei%'
GO

--13. Write a SQL query to find the salary of all employees whose salary is in the range [20000…30000].
SELECT FirstName + ' ' + LastName AS [Full Name], Salary 
	FROM Employees
		WHERE Salary BETWEEN 20000 AND 30000
GO

--14. Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.
SELECT FirstName + ' ' + LastName AS [Full Name], Salary 
	FROM Employees
		WHERE Salary IN (25000, 14000, 12500, 23600)
GO

--15. Write a SQL query to find all employees that do not have manager.
SELECT FirstName + ' ' + LastName AS [Full Name], Salary 
	FROM Employees
		WHERE ManagerID IS NULL
GO

--16. Write a SQL query to find all employees that have salary more than 50000. 
------Order them in decreasing order by salary.
SELECT FirstName + ' ' + LastName AS [Full Name], Salary 
	FROM Employees
		WHERE Salary > 50000
			ORDER BY Salary DESC
GO

--17. Write a SQL query to find the top 5 best paid employees.
SELECT TOP 5 FirstName + ' ' + LastName AS [Full Name], Salary 
	FROM Employees
		ORDER BY Salary DESC
GO

--18. Write a SQL query to find all employees along with their address. Use inner join with ON clause.
SELECT FirstName + ' ' + LastName AS [Full Name], AddressText AS [Address]
	FROM Employees e
		JOIN Addresses a
			ON e.AddressID = a.AddressID
GO

--19. Write a SQL query to find all employees and their address. Use equijoins (conditions in the WHERE clause).
SELECT FirstName + ' ' + LastName AS [Full Name], AddressText AS [Address]
	FROM Employees e, Addresses a
		WHERE e.AddressID = a.AddressID
GO

--20. Write a SQL query to find all employees along with their manager.
SELECT e.FirstName + ' ' + e.LastName AS [Employee Full Name],
	   m.FirstName + ' ' + m.LastName AS [Manager Full Name]
	FROM Employees e 
		JOIN Employees m
			ON e.ManagerID = m.EmployeeID
GO

--21. Write a SQL query to find all employees, along with their manager and their address. 
------Join the 3 tables: Employees e, Employees m and Addresses a.
SELECT e.FirstName + ' ' + e.LastName AS [Employee Full Name],
	   a.AddressText AS [Address],
	   m.FirstName + ' ' + m.LastName AS [Manager Full Name]
	FROM Employees e 
		JOIN Employees m
			ON e.ManagerID = m.EmployeeID
		JOIN Addresses a
			ON e.AddressID = a.AddressID
GO

--22. Write a SQL query to find all departments and all town names as a single list. Use UNION.
SELECT Name AS [Department]
	FROM Departments
UNION
SELECT Name
	FROM Towns
GO
--23. Write a SQL query to find all the employees and the manager for each of them along with the employees that do not have manager. 
------Use right outer join. Rewrite the query to use left outer join.
SELECT e.FirstName + ' ' + e.LastName AS [Employee Full Name],
	   m.FirstName + ' ' + m.LastName AS [Manager Full Name]
	FROM Employees e 
		LEFT JOIN Employees m
			ON e.ManagerID = m.EmployeeID
GO

--24. Write a SQL query to find the names of all employees from the departments "Sales" and "Finance" 
------whose hire year is between 1995 and 2005.
SELECT e.FirstName + ' ' + e.LastName AS [Employee Full Name]
	FROM Employees e
		JOIN Departments d
			ON (e.DepartmentID = d.DepartmentID
			AND (e.HireDate BETWEEN ('1995/01/01') AND ('2005/12/31'))
			AND d.Name IN ('Sales', 'Finance'))
GO