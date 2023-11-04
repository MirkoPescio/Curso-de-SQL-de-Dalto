/* Operadores GROUP BY y HAVING */

SELECT SupplierID, ROUND(AVG(Price), 2) AS promedio FROM Products 
GROUP BY SupplierID;

SELECT SupplierID, ROUND(AVG(Price), 2) AS promedio FROM Products
GROUP BY SupplierID ORDER BY promedio ASC;

SELECT CategoryID, ROUND(AVG(Price), 2) AS promedio FROM Products
WHERE CategoryID IS NOT NULL
GROUP BY CategoryID;

/* Ahora quiero saber el promedio de los precios por categoría */

SELECT CategoryID, ROUND(AVG(Price)) AS promedio FROM Products
GROUP BY CategoryID;

/* Ahora, si quiero que me muestre los registros donde el
   promedio sea mayor a 40? Para eso usamos la cláusula HAVING.
   La diferencia entre WHERE y HAVING es que mientras WHERE
   filtra registros, HAVING filtra grupos.
   HAVING se usa después de GROUP BY => obligatoriamente.
   El HAVING no se puede usar sin el GROUP BY */
   
SELECT SupplierID, ROUND(AVG(Price), 2) AS promedio FROM products
GROUP BY SupplierID HAVING promedio > 40; /* Pero esto está mal
   al momento de calcular un promedio, ya que, estoy trabajando
   con datos nulos [NULLS]. Lo correcto sería aplicar la siguiente
   consulta */

SELECT SupplierID, ROUND(AVG(Price), 2) AS promedio FROM products
WHERE ProductName IS NOT NULL
GROUP BY SupplierID HAVING promedio > 40;

-----------------------------------------------------------------

SELECT * FROM OrderDetails;

SELECT ProductID, Quantity FROM OrderDetails;

SELECT ProductID, SUM(Quantity) AS Total FROM OrderDetails
GROUP BY ProductID
ORDER BY Total;

SELECT ProductID, SUM(Quantity) AS Total FROM OrderDetails
GROUP BY ProductID
HAVING Total < 50
ORDER BY Total;

/* Y si quiero el registro con el producto que se vendió en
   mayor cantidad */

SELECT ProductID, SUM(Quantity) AS Total FROM OrderDetails
GROUP BY ProductID
ORDER BY Total DESC
LIMIT 1;

