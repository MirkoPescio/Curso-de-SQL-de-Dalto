/* JOINS
   Los joins son una operación que solemos utilizar en las bases de
   datos para poder combinar la información de 2 o más tablas en una
   base de datos, y que esa información se muestre en q sola
  tabla */
  
-- Empezamos con el JOIN más simple => INNER JOIN

/* Pero antes, vamos a ver como aplicar el inner join de forma
   implícita */
   
-- Por ejemplo:
SELECT * FROM Employees e, Orders o
WHERE e.EmployeeID = o.EmployeeID;

SELECT * FROM Employees e, Orders o; /* Este es un ejemplo de
   cross join de forma implícita */
   
-- INNER JOIN de forma explícita:

SELECT * FROM Employees e INNER JOIN Orders o
WHERE e.EmployeeID = o.EmployeeID;

SELECT * FROM Employees e INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID;

SELECT FirstName AS nombre, LastName AS apellido
FROM Employees e INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID;
