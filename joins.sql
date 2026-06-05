-- 1. List the product id, product name, unit price and category name of all products.
-- rder by category name and within that, by product name
SELECT
	P.ProductID,
    P.ProductName,
    P.UnitPrice,
    C.CategoryName
FROM
	Products P
    join Categories C ON (C.CategoryID = P.CategoryID)
ORDER BY
	C.CategoryName, P.ProductName;
    -- 2.List the product id, product name, unit price and supplier name of all products
-- that cost more than $75. Order by product name.
SELECT
	P.ProductID,
    P.ProductName,
    P.UnitPrice,
    S.CompanyName as supliername
FROM
	Products P
    join Suppliers S ON (S.SupplierID = P.SupplierID)
WHERE 
	P.UnitPrice > 75
ORDER BY
	P.ProductName
    -- 3. List the product id, product name, unit price, category name, and supplier name
of every product. Order by product name.
SELECT
	P.ProductID,
    P.ProductName,
    P.UnitPrice,
    C.CategoryName,
    S.CompanyName
FROM
	Products P
    join Categories C ON (C.CategoryID = P.CategoryID)
    join Suppliers S on (S.SupplierID = P.SupplierID)
ORDER BY
	P.ProductName
    -- 4. What is the product name(s) and categories of the most expensive products?
HINT: Find the max price in a subquery and then use that in your more complex
query that joins products with categories.

SELECT
    P.ProductName,
    C.CategoryName,
	P.UnitPrice
FROM
	Products P
    join Categories C ON (C.CategoryID = P.CategoryID)
WHERE
	P.UnitPrice = (SELECT max(UnitPrice) FROM Products)
ORDER BY
	P.ProductName


-- 5. List the order id, ship name, ship address, and shipping company name of every
order that shipped to Germany.
SELECT
    O.OrderID,
    O.ShipName,
	O.ShipAddress,
    O.ShipCountry,
    S.CompanyName
FROM
	Orders O
    join Shippers S ON (S.ShipperID = O.ShipVia)
WHERE
	O.ShipCountry = "germany"
-- 6. List the order id, order date, ship name, ship address of all orders that ordered
-- "Sasquatch Ale"?
SELECT
    O.OrderID,
    O.OrderDate,
    O.ShipName,
	O.ShipAddress,
    O.ShipCountry,
    P.ProductName
FROM
	Orders O
    join `Order Details` OD ON (OD.OrderID = O.OrderID)
    join Products P ON (P.ProductID = OD.ProductID)
WHERE
	P.ProductName = "Sasquatch Ale"

    

    

