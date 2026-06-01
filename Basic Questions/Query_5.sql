CREATE DATABASE OnlineBookstore;
DROP DATABASE OnlineBookstore;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID	SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	Customer_ID	SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID	INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;
-- Import data into book table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\PROJECTS\Final project\SQL Project\Books.csv'
CSV HEADER;

-- Import data into customer table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\PROJECTS\Final project\SQL Project\Customers.csv'
CSV HEADER;

-- Import data into Orders table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'D:\PROJECTS\Final project\SQL Project\Orders.csv'
CSV HEADER;

-- 1) Retrieve all books in the "fiction" genre.
SELECT * FROM Books
WHERE genre='Fiction';

-- 2) Find books published after the year 1950.
SELECT * FROM Books
WHERE published_year>1950;

-- 3) List all customers from the Canada.
SELECT *FROM Customers
WHERE city='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of book available:
SELECT SUM(stock) FROM Books;
