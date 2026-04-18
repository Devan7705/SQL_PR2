CREATE DATABASE IF NOT EXISTS Data_Transformer;

USE Data_Transformer;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers VALUES
(1,'Amit','Sharma','amit.sharma@email.com','2022-01-10'),
(2,'Priya','Patel','priya.patel@email.com','2021-11-12'),
(3,'Rahul','Verma','rahul.verma@email.com','2023-02-15'),
(4,'Sneha','Reddy','sneha.reddy@email.com','2022-07-21'),
(5,'Vikram','Singh','vikram.singh@email.com','2021-09-30'),
(6,'Neha','Gupta','neha.gupta@email.com','2022-05-18'),
(7,'Karan','Mehta','karan.mehta@email.com','2023-01-01'),
(8,'Anjali','Nair','anjali.nair@email.com','2021-12-25'),
(9,'Rohit','Das','rohit.das@email.com','2022-03-14'),
(10,'Pooja','Joshi','pooja.joshi@email.com','2023-04-10');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(101,1,'2023-07-01',150.50),
(102,2,'2023-07-03',200.75),
(103,3,'2023-06-21',500.00),
(104,4,'2023-05-15',750.25),
(105,5,'2023-07-10',1200.00),
(106,6,'2023-06-11',300.40),
(107,7,'2023-04-05',900.90),
(108,8,'2023-03-19',450.60),
(109,9,'2023-02-28',1100.00),
(110,10,'2023-01-25',250.00);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1,'Arjun','Kapoor','Sales','2020-01-15',50000),
(2,'Meera','Iyer','HR','2021-03-20',55000),
(3,'Rakesh','Yadav','IT','2019-06-10',60000),
(4,'Sunita','Mishra','Finance','2022-02-01',48000),
(5,'Deepak','Chauhan','Sales','2020-09-25',52000),
(6,'Kavita','Bansal','HR','2021-07-18',53000),
(7,'Suresh','Pillai','IT','2018-11-30',65000),
(8,'Alok','Tiwari','Finance','2022-04-22',47000),
(9,'Nisha','Agarwal','Sales','2020-08-14',51000),
(10,'Manoj','Dubey','IT','2019-12-05',62000);

SELECT * FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT * FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
);

SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT OrderID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month
FROM Orders;

SELECT OrderID, DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

SELECT OrderID, DATE_FORMAT(OrderDate,'%d-%b-%Y') AS FormattedDate
FROM Orders;

SELECT CONCAT(FirstName,' ',LastName) AS FullName FROM Customers;

SELECT REPLACE(FirstName,'Amit','Amith') FROM Customers;

SELECT UPPER(FirstName), LOWER(LastName) FROM Customers;

SELECT TRIM(Email) FROM Customers;

SELECT OrderID, TotalAmount,
SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;

SELECT OrderID, TotalAmount,
RANK() OVER (ORDER BY TotalAmount DESC) AS RankOrder
FROM Orders;

SELECT OrderID, TotalAmount,
CASE 
    WHEN TotalAmount > 1000 THEN '10% OFF'
    WHEN TotalAmount > 500 THEN '5% OFF'
    ELSE 'No Discount'
END AS Discount
FROM Orders;

SELECT EmployeeID, Salary,
CASE 
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS Category
FROM Employees;