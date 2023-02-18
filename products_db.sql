CREATE DATABASE products_db
GO

USE products_db;
GO

CREATE TABLE Products
(
	ProductId INT NOT NULL,
	ProductName NVARCHAR(20),
	CONSTRAINT PK_ProductId PRIMARY KEY(ProductId)
);
GO

CREATE TABLE Categories
(
	CategoryId INT NOT NULL,
	CategoryName NVARCHAR(20),
	CONSTRAINT PK_CategoryId PRIMARY KEY(CategoryId)
);
GO

CREATE TABLE ProductCategories
(
	ProductId INT FOREIGN KEY REFERENCES Products(ProductId),
	CategoryId INT FOREIGN KEY REFERENCES Categories(CategoryId),
	CONSTRAINT PK_ProductCategoryId PRIMARY KEY(ProductId, CategoryId)
);
GO

INSERT INTO Products VALUES
(1, 'Milk'),
(2, 'Salmon'),
(3, 'Cucumber'),
(4, 'Potato'),
(5, 'Orange')

INSERT INTO Categories VALUES
(1, 'Dairy products'),
(2, 'Seafood'),
(3, 'Vegetables'),
(4, 'Fruits'),
(5, 'Meat')

INSERT INTO ProductCategories VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4)

SELECT Products.ProductName, Categories.CategoryName
FROM Products
LEFT JOIN ProductCategories ON ProductCategories.ProductId = Products.ProductId
LEFT JOIN Categories ON ProductCategories.CategoryId = Categories.CategoryId