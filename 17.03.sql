CREATE DATABASE LibraryDB_20

CREATE TABLE Libraries (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    LibraryId INT,
    FOREIGN KEY (LibraryId) REFERENCES Libraries(Id)
    ON DELETE SET DEFAULT
);

CREATE TABLE Readers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);

CREATE TABLE Loans (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ReaderId INT,
    BookId INT,
    LoanDate DATE,
    FOREIGN KEY (ReaderId) REFERENCES Readers(Id) ON DELETE CASCADE,
    FOREIGN KEY (BookId) REFERENCES Books(Id) ON DELETE SET NULL
);

INSERT INTO Readers (Name)

VALUES

(N'Петър Петров'),

(N'Мария Иванова'),

(N'Георги Димитров'),

(N'Елена Стоянова');

-- Вмъкване на библиотеки

INSERT INTO Libraries (Name)

VALUES

(N'Централна библиотека'),

(N'Градска библиотека'),

(N'Университетска библиотека');

-- Вмъкване на книги

INSERT INTO Books (Title, LibraryId)

VALUES

(N'1984', 1),

(N'Престъпление и наказание', 2),

(N'Хари Потър', 3),

(N'Граф Монте Кристо', 1);

-- Вмъкване на заеми

INSERT INTO Loans (ReaderId, BookId, LoanDate)

VALUES

(1, 1, '2023-05-10'),

(2, 2, '2023-06-15'),

(3, 3, '2023-07-20'),

(4, 4, '2023-08-25');

SELECT * FROM Books
SELECT * FROM Readers
SELECT * FROM Libraries
SELECT * FROM Loans

--1.
DELETE FROM Readers WHERE Id=1
--2.
DELETE FROM Books WHERE Title = N'Престъпление и наказание';

--3. 
INSERT INTO Books (Title, LibraryId) VALUES (N'Война и мир', 3);

--4. 
UPDATE Books SET LibraryId = 1 WHERE LibraryId = 3;
DELETE FROM Libraries WHERE Id = 3;
