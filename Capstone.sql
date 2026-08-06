/* =============================================
          Senamile Nokuhle Mzimela
   =============================================  */

/* =============================================
         Activity 1: Create Database/Tabl   =============================================  */

CREATE TABLE Customers (
    CustomerId VARCHAR(10) PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NULL,
    Email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Orders (
    OrderId VARCHAR(10) PRIMARY KEY,
    CustomerId VARCHAR(10) NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    StatusCode CHAR(1) NOT NULL CHECK (StatusCode IN ('P', 'D', 'C')),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

/* =============================================
         Activity 2: Populate Tables
   =============================================  */
INSERT INTO Customers 
(CustomerId, FirstName, LastName, City, Phone, Email) 
VALUES
('C001','Nomcebo', 'Dlamini', 'Joburg', '0821234567', 'nomcebo.dlams@email.com'),
('C002','LeeShay', 'Van der Merwe', 'Cape Town', NULL, 'shay.vdm@email.com'),
('C003','Mamello', 'Molefe', 'Pretoria', '0719876543', 'barbie.mlf@email.com'),
('C004','Amile', 'Botha', 'Cape Town', '0835551234', 'amile.b@email.com'),
('C005','Slindokuhle', 'Smith', 'Joburg', NULL, 'slindokuhle.smth@email.com'),
('C006','Nonjabulo', 'Khumalo', 'Pretoria', '0603338888', 'nonj.k@email.com'),
('C007','Reeva', 'Naude', 'Joburg', NULL, 'reeva.n@email.com');

INSERT INTO Orders 
(OrderId, CustomerId, OrderDate, StatusCode, TotalAmount) 
VALUES
('ORD001', 'C007', '2026-01-15 10:30:00', 'D', 1499.99),
('ORD002', 'C007', '2026-03-22 14:15:00', 'D', 350.00),
('ORD003', 'C001', '2026-02-10 09:00:00', 'D', 820.50),
('ORD004', 'C001', '2026-06-05 16:45:00', 'P', 2100.00),
('ORD005', 'C003', '2026-04-18 11:20:00', 'C', 150.75),
('ORD006', 'C006', '2026-07-01 08:00:00', 'D', 4999.00),
('ORD007', 'C002', '2026-09-14 13:10:00', 'P', 750.25),
('ORD008', 'C004', '2026-08-30 17:00:00', 'D', 120.00),
('ORD009', 'C006', '2026-11-12 12:35:00', 'P', 3450.80),
('ORD010', 'C005', '2026-12-01 15:50:00', 'C', 90.00);

/* =============================================
        Activity 3: Basic Data Retrieval
   =============================================  */
SELECT 
    CustomerId AS [Customer ID],
    CONCAT(FirstName, ' ', LastName) AS [Customer Name],
    'South Africa' AS Country,
    City,
    COALESCE(Phone, 'No Phone Number') AS Phone
FROM Customers;

/* =============================================
        Activity 4: Basic Data Retrieval
   =============================================  */

SELECT 
    CONCAT(FirstName, ' ', LastName) AS [Customer Name],
    Email,
    City
FROM Customers
WHERE City IN ('Joburg', 'Pretoria');

SELECT 
    OrderId AS [Order ID],
    CustomerId AS [Customer ID],
    OrderDate AS [Order Date],
    StatusCode AS Status,
    TotalAmount AS [Total Amount]
FROM Orders
WHERE OrderDate BETWEEN '2026-01-01 00:00:00' AND '2026-03-31 23:59:59';

/* =============================================
             Activity 5: SQL Joins
   =============================================  */
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Name],
    o.OrderId AS [Order ID],
    o.OrderDate AS [Order Date],
    o.TotalAmount AS [Total Amount]
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerId = o.CustomerId;

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Name],
    o.OrderId AS [Order ID],
    o.OrderDate AS [Order Date],
    o.TotalAmount AS [Total Amount]
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerId = o.CustomerId;

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Name],
    o.OrderId AS [Order ID],
    o.OrderDate AS [Order Date],
    o.TotalAmount AS [Total Amount]
FROM Customers c
RIGHT JOIN Orders o 
    ON c.CustomerId = o.CustomerId;

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Name],
    o.OrderId AS [Order ID],
    o.OrderDate AS [Order Date],
    o.TotalAmount AS [Total Amount]
FROM Customers c
FULL OUTER JOIN Orders o 
    ON c.CustomerId = o.CustomerId;
