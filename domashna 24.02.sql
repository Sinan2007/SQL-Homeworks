CREATE DATABASE CarsShowroom

CREATE TABLE Categories 
(
[id] INT PRIMARY KEY IDENTITY (1,1),
[name] NVARCHAR(100)
);

CREATE TABLE Engines 
(
[id] INT PRIMARY KEY IDENTITY(1,1),
[type] NVARCHAR(100)
);

CREATE TABLE Cars 
(
[id] INT PRIMARY KEY IDENTITY (1,1),
[brand] NVARCHAR(100),
[model] NVARCHAR(100)  ,
[category_id] INT FOREIGN KEY REFERENCES [Categories] ([id]),
[engine_id] INT FOREIGN KEY REFERENCES [Engines] ([id]),
[color] NVARCHAR(100),
[produce_year] INT,
[price] DECIMAL(10,2),
);

CREATE TABLE Clients 
(
[id] INT PRIMARY KEY IDENTITY (1,1),
[first_name] NVARCHAR(100),
[last_name] NVARCHAR(100),
[phone_number] NVARCHAR(100)
);

CREATE TABLE Sales 
(
[id] INT PRIMARY KEY IDENTITY (1,1),
[car_id] INT FOREIGN KEY REFERENCES [Cars]([id]),
[client_id] INT FOREIGN KEY REFERENCES [Clients]([id]),
[sale_date] DATE,
);

INSERT INTO Categories ([name]) VALUES
(N'Ван'), (N'Джип'), (N'Кабрио'), (N'Комби'), (N'Купе'),
(N'Миниван'), (N'Пикап'), (N'Седан'), (N'Стреч лимузина'), (N'Хечбек');

INSERT INTO Engines ([type]) VALUES
(N'Бензинов'), (N'Дизелов'), (N'Електрически'), (N'Хибриден'), (N'Plug-In Хибрид');

INSERT INTO Cars (Brand, Model, category_id, engine_id, color, produce_year, price) VALUES
(N'VW', N'Golf', 1, 1, N'Черен', 2022, 20000),
(N'Audi', N'A3', 2, 2, N'Сив', 2021, 25000),
(N'BMW', N'3 Series', 2, 1, N'Бял', 2020, 30000),
(N'Mercedes-Benz', N'C-Class', 2, 1, N'Бял', 2022, 35000),
(N'Toyota', N'Corolla', 1, 3, N'Сив', 2021, 22000),
(N'Audi', N'A5', 1, 1, N'Черен', 2020, 32000),
(N'BMW', N'6 Series', 1, 2, N'Черен', 2019, 35000),
(N'Audi', N'A8', 3, 1, N'Черен мат', 2023, 75000),
(N'Mercedes-Benz', N'G 500', 2, 3, N'Черен', 2022, 68000),
(N'Peugeot', N'308', 1, 2, N'Син', 2022, 23000);

INSERT INTO Clients (first_name, last_name, phone_number) VALUES
(N'Иван', N'Иванов', N'0888123456'),
(N'Петър', N'Петров', N'0899123456'),
(N'Георги', N'Георгиев', N'0877123456'),
(N'Мартин', N'Маринов', N'0885123456'),
(N'Алекс', N'Александров', N'0897123456'),
(N'Борис', N'Борисов', N'0886123456'),
(N'Кирил', N'Кирилов', N'0876123456'),
(N'Даниел', N'Данев', N'0896123456'),
(N'Стоян', N'Стоянов', N'0884123456'),
(N'Николай', N'Николов', N'0875123456');

INSERT INTO Sales (car_id, client_id, sale_date) VALUES
(6, 8, '2022-01-16'),
(2, 3, '2022-02-09'),
(5, 1, '2022-11-30'),
(7, 4, '2022-04-19'),
(1, 6, '2023-05-21');

--1
SELECT * FROM Cars
--2
SELECT * FROM Cars WHERE produce_year<2020
--3
SELECT brand,color,produce_year,price FROM Cars WHERE brand='Audi'
--4. Изведете марка, модел, година и цена за колите с двигател 1 (бензинов)
SELECT brand,model,produce_year,price FROM Cars WHERE engine_id=1
--5. Изведете марка, модел, година и цена за колите от категория 1 ('Ван')
SELECT brand,model,produce_year,price FROM Cars WHERE category_id=1
--6. Изведете всички данни за колите, които са черни или сини
SELECT * FROM Cars WHERE Cars.color=N'Черен' or Cars.color=N'Син'
--7. Изведете марка, модел, година и цена на най-евтиния автомобил
SELECT TOP(1) brand,model,produce_year,price FROM Cars ORDER BY  price ASC
--8. Изведете марка, модел, цвят, година и цена за всички бензинови автомобили, подредени в намаляващ ред по цена
SELECT brand,model,color,produce_year,price FROM Cars WHERE engine_id=1 ORDER BY price DESC 
--9
SELECT Cars.brand, Cars.model, Cars.category_id, Cars.produce_year,Cars.price FROM Cars 
JOIN Categories ON Categories.id=Cars.engine_id
WHERE Categories.name= N'Ван';


--10
SELECT Clients.first_name, Clients.last_name, Cars.brand, Cars.model, Cars.color, Cars.price FROM Cars
JOIN Sales ON Sales.car_id = Cars.id 
JOIN Clients ON Clients.id = Sales.client_id
ORDER BY Cars.brand, Cars.price;


--11
SELECT Cars.brand, Cars.model, Cars.produce_year, Cars.price, Categories.name FROM Cars
JOIN Categories ON Categories.id=Cars.category_id
WHERE Cars.price BETWEEN 20000 AND 30000 AND Categories.name=N'Джип';

--12
SELECT Clients.first_name, Clients.last_name, Cars.brand, Cars.model, Cars.color, Cars.price FROM Sales 
JOIN Clients ON Sales.client_id = Clients.id
JOIN Cars ON Sales.car_id = Cars.id
WHERE Cars.Color = N'Черен' 
ORDER BY Cars.Price;


--13
SELECT c.[name]
FROM Categories c
LEFT JOIN Cars car ON c.[id] = car.category_id
WHERE car.id IS NULL;


--14
SELECT Clients.first_name, Clients.last_name, Sales.sale_date FROM Clients
LEFT JOIN Sales ON Sales.client_id=Clients.id;


--15 
SELECT Clients.first_name, Clients.last_name FROM Clients
LEFT JOIN Sales ON Sales.client_id=Clients.id
WHERE Sales.id IS NULL;