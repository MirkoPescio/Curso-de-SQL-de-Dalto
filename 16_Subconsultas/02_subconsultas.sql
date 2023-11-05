/* Subconsultas con funciones de agregación */

SELECT ProductID, SUM(Quantity) AS total_vendido
FROM OrderDetails GROUP BY ProductID;

SELECT ProductID, SUM(Quantity) AS total_vendido,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio
FROM [OrderDetails] OD
GROUP BY ProductID;

-- RECORDAR QUE => OrderDetails AS OD = [OrderDetails] OD
-- Son 2 formas para renombrar a la tabla 'OrderDetails'

/* Ahora quiero obtener el total recaudado de c/producto
   También se va a usar paréntesis pero no es una subconsulta
   sino una operación */
   
SELECT ProductID, SUM(Quantity) AS cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID)) AS Total_recaudado
FROM [OrderDetails] OD
GROUP BY ProductID;
   
SELECT ProductID, SUM(Quantity) AS cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID)) AS Total_recaudado
FROM [OrderDetails] OD
GROUP BY ProductID
ORDER BY cantidad_total_vendida DESC; /* Producto que
   más cantidad vendió */

SELECT ProductID, SUM(Quantity) AS cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID))) AS Total_recaudado
FROM [OrderDetails] OD
GROUP BY ProductID
ORDER BY Total_recaudado DESC; /* Producto que más
   ingresos generó */
   
SELECT ProductID, SUM(Quantity) AS cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(SELECT ProductName FROM Products 
	 WHERE ProductID = OD.ProductID) AS Nombre,
	(ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID))) AS Total_recaudado
FROM [OrderDetails] OD
GROUP BY ProductID
ORDER BY Total_recaudado DESC; /* Agrego la columna nombre */
   
/* Ahora quiero saber cual fué el que menos cantidad vendió
   y si fué también el que menos ingresos generó */
   
SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(SELECT ProductName FROM Products 
	 WHERE ProductID = OD.ProductID) AS Nombre,
	(ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID))) AS Total_recaudado
FROM [OrderDetails] OD
GROUP BY ProductID
ORDER BY Cantidad_total_vendida;

SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(SELECT ProductName FROM Products 
	 WHERE ProductID = OD.ProductID) AS Nombre,
	(ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID))) AS Total_recaudado
FROM [OrderDetails] OD
GROUP BY ProductID
ORDER BY Total_recaudado;
/* Efectivamente con las 2 consultas anteriores se
   demuestra que el producto con ProductID = 67 fué el
   que menos vendió (stock) y que menos recaudó (ingresos) */
-- Con esto tenemos estadísticas más detalladas --
   
   