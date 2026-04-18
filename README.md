# 🗄️ SQL Data Analysis Project
### Data Transformer

---

## 🚀 Project Overview

This project demonstrates **SQL data analysis and transformation skills** using a structured dataset of **Customers**, **Orders**, and **Employees**.

It focuses on extracting meaningful insights using **joins, aggregations, ranking, and date functions**.

✨ Built to showcase:
- Real-world SQL querying
- Data transformation techniques
- Analytical thinking
- Clean query structuring

---

## 📁 Project Structure

```
SQL_PR2/
├── DataTransformer.sql       # All SQL queries
├── README.md                 # Project documentation
└── Screenshots/              # Query output screenshots
    ├── s1.png
    ├── s2.png
    ├── s3.png
    ├── s4.png
    ├── s5.png
    ├── s6.png
    └── s7.png
```

---

## 🗃️ Database & Tables

**Database:** `Data_Transformer`

| Table | Columns | Records |
|---|---|---|
| Customers | CustomerID, FirstName, LastName, Email, RegistrationDate | 10 |
| Orders | OrderID, CustomerID, OrderDate, TotalAmount | 10 |
| Employees | EmployeeID, FirstName, LastName, Department, HireDate, Salary | 10 |

---

## 📋 Queries Covered

### 1. 🔗 Joins

**INNER JOIN** — Customers with their Orders
```sql
SELECT * FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
```

**LEFT JOIN** — All Customers, with or without Orders
```sql
SELECT * FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

**RIGHT JOIN** — All Orders, matched with Customers
```sql
SELECT * FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

**FULL OUTER JOIN** (using UNION)
```sql
SELECT * FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT * FROM Customers c RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

---

### 2. 🎯 Subqueries

**Customers with above-average order amounts**
```sql
SELECT * FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
);
```

**Employees earning above average salary**
```sql
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
```

---

### 3. 📅 Date Functions

**Extract Year & Month from Orders**
```sql
SELECT OrderID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month
FROM Orders;
```

**Days since each order was placed**
```sql
SELECT OrderID, DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;
```

**Formatted date display**
```sql
SELECT OrderID, DATE_FORMAT(OrderDate,'%d-%b-%Y') AS FormattedDate
FROM Orders;
```

---

### 4. 🔤 String Functions

```sql
SELECT CONCAT(FirstName,' ',LastName) AS FullName FROM Customers;
SELECT REPLACE(FirstName,'Amit','Amith') FROM Customers;
SELECT UPPER(FirstName), LOWER(LastName) FROM Customers;
SELECT TRIM(Email) FROM Customers;
```

---

### 5. 🪟 Window Functions

**Running Total of Orders**
```sql
SELECT OrderID, TotalAmount,
SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;
```

**Ranking Orders by Amount**
```sql
SELECT OrderID, TotalAmount,
RANK() OVER (ORDER BY TotalAmount DESC) AS RankOrder
FROM Orders;
```

---

### 6. 🔀 CASE Statements

**Discount categories based on order amount**
```sql
SELECT OrderID, TotalAmount,
CASE 
    WHEN TotalAmount > 1000 THEN '10% OFF'
    WHEN TotalAmount > 500 THEN '5% OFF'
    ELSE 'No Discount'
END AS Discount
FROM Orders;
```

**Salary category for employees**
```sql
SELECT EmployeeID, Salary,
CASE 
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS Category
FROM Employees;
```

---

## 📸 Query Outputs (Screenshots)

### 🔗 INNER JOIN — Full Data Representation
<p align="center">
  <img src="Screenshots/s1.png" width="800">
</p>

---

### 🔗 LEFT JOIN Output
<p align="center">
  <img src="Screenshots/s2.png" width="800">
</p>

---

### 📋 Full Data Representation
<p align="center">
  <img src="Screenshots/s3.png" width="800">
</p>

---

### 🎯 Filtered Customers (Condition Applied)
<p align="center">
  <img src="Screenshots/s4.png" width="800">
</p>

---

### 📅 Extract Year & Month from Orders
<p align="center">
  <img src="Screenshots/s5.png" width="800">
</p>

---

### ⏱️ Days Difference Calculation
<p align="center">
  <img src="Screenshots/s6.png" width="800">
</p>

---

### 🏆 Rank Orders by Amount
<p align="center">
  <img src="Screenshots/s7.png" width="800">
</p>

---

## ▶️ How to Run

1. Open **MySQL Workbench** or any SQL client
2. Open the file `DataTransformer.sql`
3. Run the full script to create the database, tables, and insert data
4. Execute individual queries to view outputs
5. View outputs and compare with screenshots

---

## 🛠️ Tools Used

- **MySQL** — Database engine
- **MySQL Workbench** — Query execution and output viewing
- **Git & GitHub** — Version control and project hosting
