/* FULL JOIN
   La diferencia con un cross join es que full join nos devuelve
   todo, pero multiplicado */

-- INICIO DE LA CONSULTA
SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID

UNION

-- Simulando un RIGHT JOIN invirtiendo las tablas 'Rewards' y
-- 'Employees'
SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Rewards r
LEFT JOIN Employees e ON e.EmployeeID = r.EmployeeID;
-- FINAL DE LA CONSULTA
/* Me devuelve todos los datos de recompensas, aunque no tengan
   empleados; y todos los datos de empleados, aunque no tengan
   recompensas
   Es decir mostramos los datos de ambas tablas en su totalidad */



-- ¿QUÉ PASA SI USO UNION ALL?



-- INICIO DE LA CONSULTA
SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID

UNION ALL

-- Simulando un RIGHT JOIN invirtiendo las tablas 'Rewards' y
-- 'Employees'
SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Rewards r
LEFT JOIN Employees e ON e.EmployeeID = r.EmployeeID;
-- FINAL DE LA CONSULTA

-- UNION ALL me devuelve todo, y repetidos aquellos registros que
-- no tienen valores NULL

-- De todas formas UNION y UNION ALL se va a explicar con su
-- propia sección en la próxima parte del curso
