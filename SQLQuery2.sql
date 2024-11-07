CREATE DATABASE ProductCategories
USE ProductCategories


CREATE TABLE Categories (
    categoryID INT PRIMARY KEY IDENTITY,
    [name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Colors (
    colorID INT PRIMARY KEY IDENTITY,
    [name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    productID INT PRIMARY KEY IDENTITY,
    [name] NVARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    categoryID INT,
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

CREATE TABLE ProductColors (
    productID INT,
    colorID INT,
    PRIMARY KEY (productID, colorID),
    FOREIGN KEY (productID) REFERENCES Products(productID),
    FOREIGN KEY (colorID) REFERENCES Colors(colorID)
);



INSERT INTO Categories 
VALUES ('School Supplies');
INSERT INTO Categories
VALUES ('Art Supplies');


INSERT INTO Colors 
VALUES ('Red');
INSERT INTO Colors
VALUES ('Blue');
INSERT INTO Colors
VALUES ('Green');
INSERT INTO Colors
VALUES ('Black');



INSERT INTO Products
VALUES ('Notebook', 3.50, 2.00, 1);

INSERT INTO Products 
VALUES ('Eraser', 0.80, 0.30, 1);

INSERT INTO Products 
VALUES ('Pen', 1.20, 0.50, 1);





INSERT INTO Products 
VALUES ('Paint Set', 15.00, 8.00, 2);

INSERT INTO Products
VALUES ('Brush', 5.00, 2.50, 2);





INSERT INTO ProductColors 
VALUES (1, 2);
INSERT INTO ProductColors
VALUES (2, 3);
INSERT INTO ProductColors
VALUES (3, 1);
INSERT INTO ProductColors 
VALUES (4, 3);
INSERT INTO ProductColors
VALUES (5, 4);



SELECT * FROM Products
SELECT * FROM Categories
SELECT * FROM Colors
SELECT * FROM ProductColors



SELECT 
    Products.Name AS ProductName,
    Categories.Name AS CategoryName,
    Colors.Name AS ColorName
FROM 
    Products
JOIN 
    Categories ON Products.categoryID = Categories.categoryID
JOIN 
    ProductColors ON Products.productID = ProductColors.productID
JOIN 
    Colors ON ProductColors.colorID = Colors.colorID;