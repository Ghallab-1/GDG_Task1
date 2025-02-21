CREATE DATABASE RetailStoreDB;
GO
USE RetailStoreDB;
GO


CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    RegistrationDate DATE
);


CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);


CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('youssef', 'ghallab', 'youssefghallab@gmail.com', '2019-02-08'),
('ahmed', 'zaher', 'zaherahmed@gmail.com', '2015-07-03'),
('omar', 'wafa', 'wafa.o@gmail.com', '2022-11-20'),
('yassin', 'mahmoud', 'yassinmahmoud@gmail.com', '2025-02-01'),
('youssef', 'hassan', 'Y.hassan@gmail.com', '2024-01-05');


INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('milk', 'dairy', 25.00, 15),
('meat', 'protein', 30.00, 20),
('chocolate', 'sweets', 50.00, 10),
('chips', 'snacks', 10.00, 50),
('apple juice', 'juice', 15.00, 7);


INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(4, 1, '2024-11-16', 1),
(3, 3, '2030-11-12', 2),
(5, 2, '2022-04-06', 1),
(1, 4, '2024-07-02', 6),
(2, 5, '2020-05-08', 5);


SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;


SELECT * 
FROM Customers 
WHERE RegistrationDate > '2021-02-03';


SELECT TOP (3) * 
FROM Products 
ORDER BY Price DESC;


SELECT 
    o.OrderID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    p.ProductName,
    o.Quantity,
    o.OrderDate,
    p.Price,
    (o.Quantity * p.Price) AS TotalPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID;


SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(o.Quantity * p.Price) AS TotalAmountSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalAmountSpent DESC;


SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalOrders DESC;


SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(o.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSales DESC;
