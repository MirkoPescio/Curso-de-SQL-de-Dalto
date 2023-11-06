/* LEFT JOIN y RIGHT JOIN */

-- LEFT JOIN: nos devuelve una tabla y parte de la información de la otra
-- tabla

SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID;

/* Lamentablemente en la base de datos de SQLite no se pueden hacer
   RIGHT JOINs, por lo que tenemos que hacer un LEFT JOIN invirtiendo el
   orden de las tablas */

SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Rewards r
LEFT JOIN Employees e ON e.EmployeeID = r.EmployeeID;
