/* Supongamos que queremos ver la cantidad de ventas
   que obtuvo un empleado.
   Este ejercicio nos prepara para después ver JOIN */

/* EJERCICIO: Obtener a los empleados [tabla Employees]
   que obtuvieron más cantidad de ventas que el
   promedio */
   
SELECT * FROM Orders;
SELECT * FROM Employees;
SELECT * FROM OrderDetails;
   
-- razonamiento: relacionar OrderID, EmployeeID y
-- Quantity

SELECT FirstName AS nombre, 
       LastName AS apellido,
	   (
	     SELECT SUM(od.Quantity) FROM [Orders] o,
		 [OrderDetails] od 
		 WHERE o.EmployeeID = e.EmployeeID
		 AND od.OrderID = o.OrderID
	   ) AS unidades_totales
FROM [Employees] e;

/* Bien! Relacionamos 3 tablas [Orders, OrderDetails
   y Employees].
   Hasta acá tenemos la cantidad de unidades que vendió
   cada empleado.
   
   EL PROBLEMA VIENE AHORA CON EL WHERE
  
   puedo hacer comparaciones con la cantidad de unidades
   pero no puedo ejecutar el promedio */
   
SELECT FirstName AS nombre, 
       LastName AS apellido,
	   (
	     SELECT SUM(od.Quantity) FROM [Orders] o,
		 [OrderDetails] od 
		 WHERE o.EmployeeID = e.EmployeeID
		 AND od.OrderID = o.OrderID
	   ) AS unidades_totales
FROM [Employees] e
WHERE unidades_totales >= 100;

SELECT FirstName AS nombre, 
       LastName AS apellido,
	   (
	     SELECT SUM(od.Quantity) FROM [Orders] o,
		 [OrderDetails] od 
		 WHERE o.EmployeeID = e.EmployeeID
		 AND od.OrderID = o.OrderID
	   ) AS unidades_totales
FROM [Employees] e
WHERE unidades_totales >= 1000;

/*
SELECT FirstName AS nombre, 
       LastName AS apellido,
	   (
	     SELECT SUM(od.Quantity) FROM [Orders] o,
		 [OrderDetails] od 
		 WHERE o.EmployeeID = e.EmployeeID
		 AND od.OrderID = o.OrderID
	   ) AS unidades_totales
FROM [Employees] e
WHERE unidades_totales >= AVG(unidades_totales);
*/

-- Esto no es así, ya que, no podemos usar funciones
-- de agregación en un WHERE, sino en un HAVING
-- Pero esto se va a resolver con otra subconsulta:

SELECT FirstName AS nombre, 
       LastName AS apellido,
	   (
	     SELECT SUM(od.Quantity) FROM [Orders] o,
		 [OrderDetails] od 
		 WHERE o.EmployeeID = e.EmployeeID
		 AND od.OrderID = o.OrderID
	   ) AS unidades_totales
FROM [Employees] e
WHERE unidades_totales > (SELECT AVG(unidades_totales)
   FROM (
      SELECT (SELECT SUM(od.Quantity) FROM [Orders] o,
		    [OrderDetails] od 
		    WHERE o.EmployeeID = e2.EmployeeID
		    AND od.OrderID = o.OrderID
	        ) AS unidades_totales FROM [Employees] e2
	  GROUP BY e2.EmployeeID
   )
);

-- O también, el caso en el que quiera que las unidades
-- totales vendidas sean menor al promedio:

SELECT FirstName AS nombre, 
       LastName AS apellido,
	   (
	     SELECT SUM(od.Quantity) FROM [Orders] o,
		 [OrderDetails] od 
		 WHERE o.EmployeeID = e.EmployeeID
		 AND od.OrderID = o.OrderID
	   ) AS unidades_totales
FROM [Employees] e
WHERE unidades_totales < (SELECT AVG(unidades_totales)
   FROM (
      SELECT (SELECT SUM(od.Quantity) FROM [Orders] o,
		    [OrderDetails] od 
		    WHERE o.EmployeeID = e2.EmployeeID
		    AND od.OrderID = o.OrderID
	        ) AS unidades_totales FROM [Employees] e2
	  GROUP BY e2.EmployeeID
   )
);
