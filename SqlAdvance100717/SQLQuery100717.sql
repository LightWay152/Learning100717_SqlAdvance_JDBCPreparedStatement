SELECT * FROM Categories WHERE Id=1002
SELECT * FROM Products WHERE CategoryId=1002

SELECT * FROM Customers WHERE Id='ANTON'
SELECT * FROM Orders WHERE CustomerId='ANTON'

SELECT * FROM Orders WHERE Id=10677
SELECT * FROM OrderDetails WHERE OrderId=10677

/*Products which have Name include 'on' letters*/
SELECT * FROM Products WHERE Name LIKE '%on%'

/*Products which have Name include 'o_g' letters 
and between og letters is any one letter*/
SELECT * FROM Products WHERE Name LIKE '%o_g%'

/*Products which have UnitPrice between 5 and 10*/
SELECT * FROM Products WHERE UnitPrice>=5 AND UnitPrice<=10

/*Products which have UnitPrice from 5 to 10*/
SELECT * FROM Products WHERE UnitPrice BETWEEN 5 AND 10

/*Products which have ProductDate=2009*/
SELECT * FROM Products WHERE YEAR(ProductDate)=2009

/*Products which have CategoryId is 1002 or 1005*/
SELECT * FROM Products WHERE CategoryId IN (1002,1005)

/*Products which have ProductDate from 2009 to 2011*/
SELECT * FROM Products WHERE YEAR(ProductDate) IN (2009,2011)

/*Products which have Description is null*/
SELECT * FROM Products WHERE Description IS NULL

/*Products which have Description is not null*/
SELECT * FROM Products WHERE Description IS NOT NULL

/*Category which have Name include 'on letters'*/
SELECT * FROM Categories WHERE Name LIKE '%on%'

/*Category which have Name include 'on letters' and only get id of record*/
SELECT Id FROM Categories WHERE Name LIKE '%on%'

/*Category which have CategoryId=1006*/
SELECT * FROM Products WHERE CategoryId IN (SELECT Id FROM Categories WHERE Name LIKE '%on%')

/*Category which have
DATEPART: get Quarter in Year, week in month,...
DATEDIFF: get Take the time deviation*/
SELECT Name, ProductDate, YEAR(ProductDate) Year, 
	DATEPART(QUARTER,ProductDate) Quarter, GETDATE()  Now,
	DATEDIFF(YEAR,ProductDate,GETDATE())
FROM Products

/*Products which ProductDate in quarter 1 or 4*/
SELECT * FROM Products WHERE(DATEPART(QUARTER,ProductDate) IN (1,4))

/*Products which ProductDate created larger than 20 years ago*/
SELECT * FROM Products WHERE DATEDIFF(YEAR,ProductDate,GETDATE())>=20

/*JOIN = INNER JOIN*/
SELECT c.NameVN, p.Name 
FROM Products p 
	JOIN Categories c ON c.Id=p.CategoryId
	
/*RIGHT JOIN = RIGHT OUTER JOIN: write code in a line to verify RIGHT/LEFT of table*/
SELECT c.NameVN, p.Name 
FROM Products p 
	RIGHT JOIN Categories c ON c.Id=p.CategoryId

/*GROUP BY, COUNT*/
SELECT
	YEAR(ProductDate) Nam,
	COUNT(*) SoSP
FROM Products
GROUP BY YEAR(ProductDate)

SELECT
	c.NameVN Loai,
	COUNT(*) SoSP,
	MIN(UnitPrice) GiaTN,
	MAX(UnitPrice) GiaCN,
	AVG(UnitPrice) GiaTB
FROM Products p
	JOIN Categories c ON c.Id=p.CategoryId
WHERE YEAR(ProductDate) NOT IN (2009)
GROUP BY c.NameVN
	HAVING COUNT(*)>=10
	
/*JDBC Advance - update*/
SELECT * FROM Categories