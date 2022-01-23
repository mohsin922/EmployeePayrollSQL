-------Welcome to PayRollService----------

--UC1
---Create DataBase PayRollService

CREATE DATABASE Payroll_Service
Go

USE Payroll_Service
Go

--UC2
--Retrieve PayRoll
Create table employee_payroll
(
   Id int identity primary key,
   name varchar(Max) Not null,
   salary money default 1000,
   startDate DateTime default GetDate()
)

exec sp_help employee_payroll

--UC3
--Update Salary
INSERT INTO employee_payroll (name,salary,startDate) VALUES
('Mohsin',100000.00,GETDATE()),
('Raj',200000.00,GETDATE()),
('Abdul',300000.00,GETDATE())

--Read
--UC4
Select *
from employee_payroll

--UC5
--Retrieve Specific Data
SELECT Name, Startdate FROM employee_payroll WHERE Name='Mohsin'
Go
SELECT * FROM employee_payroll WHERE StartDate between CAST('2019-03-14' as date) and GETDATE()
Go

--UC6
--Add Gender
Alter table employee_payroll
Add Gender char(1) Not null default 'M'
Go

UPDATE employee_payroll SET Gender='M' WHERE id=1
Go
SELECT * FROM employee_payroll
Go

---UC7
---Calculate sum, average, count, Min, Max and number of male and female employees
SELECT SUM(Salary) AS TotalSalary,Gender FROM employee_payroll GROUP BY Gender
Go
SELECT AVG(Salary) AS AverageSalary FROM employee_payroll GROUP BY Gender
Go
SELECT COUNT(Salary) AS TotalSalary,Gender FROM employee_payroll GROUP BY Gender
Go
SELECT MIN(Salary) AS  MinSalary,Gender FROM employee_payroll GROUP BY Gender
Go
SELECT MAX(Salary) AS MaxSalary,Gender FROM employee_payroll GROUP BY Gender
Go


--UC8
--Adding more information
ALTER TABLE employee_payroll ADD PhoneNumber bigint
GO
ALTER TABLE employee_payroll ADD Department varchar(MAX) not null default 'ENGG'
GO
ALTER TABLE employee_payroll ADD Address varchar(MAX) default 'Kashmir'
Go
SELECT * FROM employee_payroll
Go