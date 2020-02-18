USE Northwind;

--=================EXERCISE 1.1=================--

SET CONCAT_NULL_YIELDS_NULL OFF  --Sets concatenating any fields with an empty value to not return a null. ON by default
SELECT
	CustomerID
	,CompanyName
	,City + ', ' + Country + ', ' + PostalCode + ', ' + Region AS 'Customer Address' --Region has an empty feild. However, have kept in the query in terms of future proofing should a new region feild be added
FROM Customers
WHERE City IN ('London', 'Paris')
ORDER BY "CompanyName" ASC;

--WHERE clause can also be written as WHERE City = 'London' OR City = 'Paris'

--=================EXERCISE 1.2=================--

SELECT
	ProductID
	,ProductName
	,QuantityPerUnit AS "Unit Quantity Per Bottle"
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%' 
ORDER BY ProductID;

--=================EXERCISE 1.3=================--

SELECT 
	s.SupplierID
	,s.CompanyName
	,s.Country
	,p.QuantityPerUnit AS "Unit Quantity Per Bottle"
FROM Products p
    INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID
WHERE QuantityPerUnit LIKE '%bottle%'
ORDER BY SupplierID ASC;

--=================EXERCISE 1.4=================--

SELECT 
	c.CategoryName
	,COUNT(c.CategoryID) AS "Number of Products Per Category"
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY "CategoryName" DESC;

--=================EXERCISE 1.5=================--

USE Northwind

SELECT
	CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName) 'Employee Details' --Concatination can also be written as TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Employee Details'
	,City
FROM Employees;

--=================EXERCISE 1.6=================--

SELECT 
r.RegionDescription
--,SUM((od.UnitPrice * od.Quantity) * (1- od.Discount)) AS 'Net Sales Total Without Formatting'
,ROUND(SUM((od.UnitPrice * od.Quantity) * (1- od.Discount)), 2) AS 'Net Sales Total' --Round to two decimal places based on currency
FROM Region r
INNER JOIN Territories t ON t.RegionID = r.RegionID
INNER JOIN EmployeeTerritories et ON et.TerritoryID = t.TerritoryID
INNER JOIN Orders o ON o.EmployeeID = et.EmployeeID
INNER JOIN [Order Details] od ON od.OrderID= o.OrderID
GROUP BY r.RegionDescription
HAVING SUM((od.UnitPrice * od.Quantity) * (1- od.Discount)) > 1000000;

--=================EXERCISE 1.7=================--

SELECT 
	ShipCountry
	,COUNT(Freight) AS 'Total Freight Orders Greater Than 100' 
FROM Orders
    WHERE Freight > 100 AND ShipCountry IN ('USA','UK')
GROUP BY ShipCountry;

--=================EXERCISE 1.8=================--

SELECT TOP 5 
OrderID
,Discount
,(Quantity * UnitPrice) AS 'Total Price' 
,(Quantity * UnitPrice) * (1-Discount) AS 'Net Price'
,(Quantity * UnitPrice) - (Quantity * UnitPrice) * (1-Discount) AS 'Total Saved'
FROM [Order Details] 
GROUP BY 
OrderID
,Discount
,(Quantity * UnitPrice)
ORDER BY 'Total Saved' DESC;