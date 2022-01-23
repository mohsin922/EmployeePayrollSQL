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
