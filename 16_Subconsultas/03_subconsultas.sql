/* Optimización de subconsultas */

SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
    (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) AS Precio,
	(SELECT ProductName FROM Products 
	 WHERE ProductID = OD.ProductID) AS Nombre,
	(ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID))) AS Total_recaudado
FROM [OrderDetails] OD
WHERE Price > 40
GROUP BY ProductID
ORDER BY Total_recaudado;

/* ¿Cómo hago para filtrar por el precio sin que muestre
    una columna de estos? RTA: la suconsulta se aplica con
    la cláusula WHERE */
	
SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	(SELECT ProductName FROM Products 
	 WHERE ProductID = OD.ProductID) AS Nombre,
	(ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID))) AS Total_recaudado
FROM [OrderDetails] OD
WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
GROUP BY ProductID
ORDER BY Total_recaudado;
-- No muestro el precio, sino, que solamente lo uso como
-- método de comparación

/* También lo que podemos hacer es ejecutar una consulta
   compleja, por ejemplo la anterior, como una subconsulta */

SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
); /* Lo que hace esto es transformar toda esa subconsulta
      en una tabla nueva */
	  
-- A partir de esta nueva tabla, puedo trabajar con valores
-- más específicos

SELECT Nombre, Total_recaudado 
FROM (SELECT ProductID, 
      SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
);

-- O aplicar un mejor filtrado:

SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
) WHERE Total_recaudado >= 1000;

SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
) WHERE Total_recaudado >= 10000;

-- Volver a ordenarlo:

SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
) WHERE Total_recaudado >= 10000
  ORDER BY Total_recaudado;
  
SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
) WHERE Total_recaudado >= 10000
  ORDER BY Total_recaudado DESC;
  
SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
) WHERE Cantidad_total_vendida >= 100
  ORDER BY Cantidad_total_vendida;
  
SELECT * FROM (SELECT ProductID, SUM(Quantity) AS Cantidad_total_vendida,
	   (SELECT ProductName FROM Products 
	    WHERE ProductID = OD.ProductID) AS Nombre,
	   (ROUND(SUM(Quantity) * (SELECT Price FROM Products 
	    WHERE ProductID = OD.ProductID))) AS Total_recaudado
     FROM [OrderDetails] OD
     WHERE (SELECT Price FROM Products 
	 WHERE ProductID = OD.ProductID) > 40
     GROUP BY ProductID
     ORDER BY Total_recaudado
) WHERE Cantidad_total_vendida >= 100
  ORDER BY Cantidad_total_vendida DESC;  
