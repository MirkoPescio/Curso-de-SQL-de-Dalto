-- INDICES

SELECT * FROM Products WHERE ProductName = "Chais";

/* Vamos a establecer en la tabla de empleados 'Employees' 
   que no se repitan registros en los que el nombre y el apellido
   sean iguales 
*/

CREATE UNIQUE INDEX name ON Employees (FirstName, LastName);

-- verifico:

SELECT * FROM Products;

---------------------------------------------------------------

SELECT * FROM OrderDetails od
JOIN Orders o
WHERE o.OrderID = od.OrderID
AND OrderDate > "1996-07-04"
AND od.Quantity > 10;

CREATE INDEX idx_orderdetails_quantity ON OrderDetails (Quantity);

CREATE INDEX idx_orders_orderdate ON Orders (OrderDate);

-- AVISO: no siempre agregar índices optimiza las consultas, ya que,
-- las mismas ocupan bastante espacio en memoria

