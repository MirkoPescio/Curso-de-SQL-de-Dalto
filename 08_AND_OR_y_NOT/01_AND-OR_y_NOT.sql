/* AND, OR y NOT */

SELECT * FROM Customers
WHERE CustomerID >= 50 and CustomerID < 55;

SELECT * FROM Employees
WHERE FirstName = "Nancy" OR FirstName = "Anne";

SELECT * FROM Products
WHERE Price < 20 OR CategoryID = 6;
SELECT * FROM Products
WHERE (Price < 20 OR CategoryID = 6) AND SupplierID = 7;

SELECT * FROM Products
WHERE NOT Price > 40; /* Esta consulta es exactamente lo
   mismo que la siguiente consulta: */
SELECT * FROM Products
WHERE Price <= 40;

SELECT * FROM Customers
WHERE NOT Country = "USA";
SELECT * FROM Customers
WHERE NOT Country = "USA" AND NOT Country = "France";

SELECT * FROM Customers
WHERE CustomerID >= 50
AND CustomerID < 55
AND NOT Country = "Germany";

/* ¿Cómo hago para obtener 5 registros a partir del CustomerID
   50? => Con LIMIT */
   
SELECT * FROM Customers
WHERE CustomerID >= 50
AND NOT Country = "Germany"
LIMIT 5;

SELECT * FROM Customers
WHERE CustomerID >= 50
AND NOT Country = "Germany"
AND NOT Country = "UK"
LIMIT 5;

SELECT * FROM Customers
WHERE CustomerID >= 50
AND NOT Country = "Germany"
AND NOT Country = "UK"
AND NOT Country = "USA"
LIMIT 5;

/* Supongamos que un cliente quiere ver nuestros productos pero
   entre ellos quiere que:
   + No sean de categoría 6
   + No sean del proveedor 1
   + Que los precios sean menores o iguales a U$S 30
   y que
   + Que muestre, como mucho, 3 productos
  La consulta a la base de datos sería la siguiente: */
  
SELECT * FROM Products
WHERE NOT CategoryID = 6
AND NOT SupplierID = 1
AND Price <= 30
LIMIT 3;

/* Y si quiere otros resultados? Random() */

SELECT * FROM Products
WHERE NOT CategoryID = 6
AND NOT SupplierID = 1
AND Price <= 30
ORDER BY RANDOM()
LIMIT 3;
