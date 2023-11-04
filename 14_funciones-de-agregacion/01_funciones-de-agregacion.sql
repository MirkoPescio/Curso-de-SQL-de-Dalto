/* Funciones de agregación: nos permiten agrupar datos, resumirlos
   e incluso trabajar con estadísticas sobre los datos.
   Se utilizan con la cláusula SELECT => SELECT funcion() */

SELECT FirstName, LastName FROM Employees;

SELECT count(FirstName) AS Cantidad_de_nombres FROM Employees;

SELECT Price FROM Products;

SELECT SUM(Price) FROM Products;

SELECT AVG(Price) AS Promedio FROM Products; /* AVG se usa para 
   calcular el promedio entre los valores indicados */
   
SELECT ROUND(AVG(Price), 2) AS Promedio FROM Products; /* Redondeo 
   el promedio a 2 decimales */

SELECT MIN(Price) AS Minimo FROM Products;

SELECT MIN(Price) AS Minimo FROM Products
WHERE ProductName IS NOT NULL;

SELECT ProductName AS nombre_producto,
MIN(Price) AS Minimo FROM Products
WHERE ProductName IS NOT NULL;
