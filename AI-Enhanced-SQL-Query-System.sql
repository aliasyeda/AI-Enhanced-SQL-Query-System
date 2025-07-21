CREATE DATABASE SQLPracticeDB;
USE SQLPracticeDB;

-- Use of Subquery
-- Employees earning above average

-- Create table
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(50),
    Salary INT
);
INSERT INTO Employees VALUES
(1, 'Ramesh', 40000),
(2, 'Priya', 55000),
(3, 'Ankit', 30000),
(4, 'Swetha', 70000);
-- Employees earning more than average salary
SELECT Name
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);


-- JOIN with GROUP BY Tables:
-- JOIN + GROUP BY

-- Create tables
CREATE TABLE Students (
    ID INT,
    Name VARCHAR(50)
);

CREATE TABLE Marks (
    StudentID INT,
    Subject VARCHAR(50),
    Marks INT
);

-- Insert data
INSERT INTO Students VALUES
(1, 'Arjun'),
(2, 'Neha'),
(3, 'Kiran');

INSERT INTO Marks VALUES
(1, 'Math', 80),
(1, 'Science', 70),
(2, 'Math', 90),
(2, 'Science', 85),
(3, 'Math', 60),
(3, 'Science', 55);

-- Total marks of each student
SELECT S.Name, SUM(M.Marks) AS TotalMarks
FROM Students S
JOIN Marks M ON S.ID = M.StudentID
GROUP BY S.Name;


-- String Function
-- Extract Email Domain

-- Create table
CREATE TABLE Users (
    ID INT,
    FullName VARCHAR(50),
    Email VARCHAR(100)
);
-- Insert data
INSERT INTO Users VALUES
(1, 'Ali Khan', 'ali.khan@gmail.com'),
(2, 'Sara Roy', 'sara.roy@yahoo.com'),
(3, 'Vikram Das', 'vikram.das@outlook.com');

--  Extract domain from email
SELECT FullName, 
       SUBSTRING(Email, LOCATE('@', Email) + 1) AS Domain
FROM Users;

-- Date Function
-- Orders in last 30 days

-- Create table
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE
);

-- Insert data
INSERT INTO Orders VALUES
(1, 'Ravi', CURDATE() - INTERVAL 5 DAY),
(2, 'Sneha', CURDATE() - INTERVAL 40 DAY),
(3, 'Manoj', CURDATE() - INTERVAL 15 DAY);

-- Orders in last 30 days
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;


-- CASE Statement
-- Grade using CASE

-- Create table
CREATE TABLE StudentsMarks (
    ID INT,
    Name VARCHAR(50),
    Marks INT
);

-- Insert data
INSERT INTO StudentsMarks VALUES
(1, 'Zoya', 95),
(2, 'Imran', 78),
(3, 'Fatima', 62),
(4, 'Ravi', 55);

-- Query: Grade using CASE
SELECT ID, Name, Marks,
    CASE 
        WHEN Marks >= 90 THEN 'A'
        WHEN Marks >= 75 THEN 'B'
        WHEN Marks >= 60 THEN 'C'
        ELSE 'F'
    END AS Grade
FROM StudentsMarks;


-- Update and Delete

-- Create table
CREATE TABLE Inventory (
    ItemID INT,
    ItemName VARCHAR(50),
    Quantity INT
);

-- Insert data
INSERT INTO Inventory VALUES
(1, 'Mouse', 20),
(2, 'Keyboard', 10),
(3, 'Monitor', 0),
(4, 'Printer', 5);

-- Task 1: Update quantity of 'Keyboard' to 50
UPDATE Inventory
SET Quantity = 50
WHERE ItemName = 'Keyboard';

-- Task 2: Delete items with quantity 0
DELETE FROM Inventory
WHERE Quantity = 0;
