
CREATE DATABASE TaxiCompany;

CREATE TABLE Drivers (
    id INT  PRIMARY KEY  IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE Cars (
    id  INT  PRIMARY KEY  IDENTITY(1,1),
    license_plate VARCHAR(20) UNIQUE NOT NULL,
    model VARCHAR(100) NOT NULL
);

CREATE TABLE Customers (
    id INT  PRIMARY KEY  IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE Rides (
    id INT  PRIMARY KEY IDENTITY(1,1),
    driver_id INT,
    car_id INT,
    customer_id INT DEFAULT 1,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    fare DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES Drivers(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (car_id) REFERENCES Cars(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);

INSERT INTO Drivers (name, phone_number) VALUES
('Иван Петров', '0888123456'),
('Мария Иванова', '0888234567'),
('Георги Димитров', '0888345678'),
('Петър Василев', '0888456789'),
('Силвия Николова', '0888567890');

INSERT INTO Cars (license_plate, model) VALUES
('CA1234AB', 'Toyota Prius'),
('CB5678CD', 'Ford Focus'),
('CC9101EF', 'Honda Civic'),
('CA1122GH', 'BMW X5'),
('CB3344IJ', 'Mercedes E-Class');

INSERT INTO Customers (name, phone_number) VALUES
('Анна Георгиева', '0899123456'),
('Борис Петров', '0899234567'),
('Виктор Димитров', '0899345678'),
('Галина Василева', '0899456789'),
('Даниела Николова', '0899567890');

INSERT INTO Rides (driver_id, car_id, customer_id, pickup_location, dropoff_location, fare) VALUES
(1, 1, 1, 'София Център', 'Летище София', 25.50),
(2, 2, 2, 'Люлин', 'Младост', 15.00),
(3, 3, 3, 'Дружба', 'Студентски град', 18.75),
(4, 4, 4, 'Надежда', 'Обеля', 12.40),
(5, 5, 5, 'Слатина', 'Красно село', 20.00);

select * from Rides
select * from Drivers
select * from Cars
select * from Customers

DELETE FROM Drivers WHERE id = 1;

DELETE FROM Cars WHERE id = 2;

DELETE FROM Customers WHERE id = 3;

UPDATE Drivers SET name = 'Иван Иванов' WHERE id = 2;

UPDATE Cars SET model = 'Audi A4' WHERE id = 3;

UPDATE Customers SET name = 'Елена Стоянова' WHERE id = 4;
 

  