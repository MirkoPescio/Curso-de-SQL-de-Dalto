/* UNION y UNION ALL

   DATO IMPORTANTE: Las uniones [sean UNION o UNION
     ALL], tienen que tener la misma cantidad de
	 columnas con el mismo tipo de dato */
	 
/* Diferencia entre UNION y UNION ALL:
   UNION ALL devuelve todos los registros, es decir,
   todas las filas aunque estas se repitan, en cambio
   UNION devuelve todas las filas pero si una de estas
   se repite una o más veces, no devuelve las
   repeticiones */	 

-- UNION
SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID

UNION

SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Rewards r
LEFT JOIN Employees e ON e.EmployeeID = r.EmployeeID;
   

-- UNION ALL
SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID

UNION ALL

SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Rewards r
LEFT JOIN Employees e ON e.EmployeeID = r.EmployeeID;
