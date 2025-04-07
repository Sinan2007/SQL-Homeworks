CREATE DATABASE ElectronicsStore

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(200) NOT NULL UNIQUE
)

CREATE TABLE Brands(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(200) NOT NULL UNIQUE
)

CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(200) NOT NULL,
CategoryId INT,
BrandId INT,
Price DECIMAL(10,2) NOT NULL CHECK(Price>=0),
Stock INT NOT NULL CHECK(Stock>=0),
FOREIGN KEY(CategoryId) REFERENCES Categories(Id) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(BrandId) REFERENCES Brands(Id) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(100) NOT NULL,
LastName NVARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(15) NOT NULL UNIQUE
)

CREATE TABLE Sales(
Id INT PRIMARY KEY IDENTITY(1,1),
ProductId INT DEFAULT 1,
CustomerId INT,
SaleDate DATE NOT NULL,
Quantity INT NOT NULL CHECK(Quantity>=0),

FOREIGN KEY(ProductId) REFERENCES Products(Id) ON DELETE SET DEFAULT,
FOREIGN KEY(CustomerId) REFERENCES Customers(Id) ON DELETE CASCADE
)


-- Insert into Categories
INSERT INTO Categories (Name) VALUES
('Smartphones'),
('Laptops'),
('Tablets'),
('Accessories'),
('Televisions');

-- Insert into Brands
INSERT INTO Brands (Name) VALUES
('Apple'),
('Samsung'),
('Sony'),
('Dell'),
('Lenovo');

-- Insert into Products
INSERT INTO Products (Name, CategoryId, BrandId, Price, Stock) VALUES
('iPhone 14 Pro', 1, 1, 999.99, 50),
('Galaxy S23', 1, 2, 899.99, 40),
('Xperia Z5', 1, 3, 699.99, 30),
('Dell XPS 13', 2, 4, 1199.99, 25),
('Lenovo ThinkPad X1', 2, 5, 1299.99, 20);

-- Insert into Customers
INSERT INTO Customers (FirstName, LastName, PhoneNumber) VALUES
('John', 'Doe', '1234567890'),
('Jane', 'Smith', '2345678901'),
('Alice', 'Johnson', '3456789012'),
('Bob', 'Williams', '4567890123'),
('Eve', 'Davis', '5678901234');

-- Insert into Sales
INSERT INTO Sales (ProductId, CustomerId, SaleDate, Quantity) VALUES
(1, 1, '2025-04-01', 1),
(2, 2, '2025-04-02', 2),
(3, 3, '2025-04-03', 1),
(4, 4, '2025-04-04', 1),
(5, 5, '2025-04-05', 1);


--1
SELECT * FROM Products
--2
--Gospojo ne vidqh che trqbva da ima nad 2000leva zatova go pisha s 1000 :/
SELECT * FROM Products WHERE Price>1000
--3
SELECT * FROM Products WHERE BrandId=(SELECT Id FROM Brands WHERE Name='Samsung')
--4
SELECT TOP(1) * FROM Products ORDER BY Price DESC 
--5
SELECT * FROM Customers ORDER BY LastName 
--6
SELECT c.FirstName,c.LastName,s.SaleDate
FROM Customers c
LEFT JOIN Sales s ON c.Id=s.CustomerId
--7
SELECT SUM(Price*Stock) AS TotalPrice FROM Products
--8
--vsichki sa napravili poruchka
SELECT * FROM Customers WHERE Id NOT IN(SELECT DISTINCT CustomerId FROM Sales)
--9
UPDATE Products
SET Price=Price*1.1
WHERE BrandId=(SELECT Id FROM Brands WHERE Name='Apple')
--10

--11
DELETE FROM Customers WHERE Id=3
--12
DELETE FROM Products WHERE Id=1 AND BrandId=(SELECT Id FROM Brands WHERE Name='Apple')
--13
DELETE FROM Products WHERE Id=2

SELECT * FROM Customers
SELECT * FROM Products