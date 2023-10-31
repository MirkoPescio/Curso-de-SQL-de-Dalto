SELECT * FROM Employees;

/* El SELECT nos devuelve un nuevo conjunto que SQL 
   interpreta como nuevas tablas que a su vez, tiene
   nuevos valores */
   
SELECT LastName AS apellido FROM Employees;

SELECT FirstName AS nombre, LastName as apellido
FROM Employees;

SELECT Price FROM Products;
SELECT Price*2 FROM Products; /* Devuelve cada
   precio de los productos, pero ahora, duplicados */
   
/* Pero queda raro la nomenclatura anterior
   Por eso, lo podemos renombrar: */
   
SELECT Price*2 AS precio_duplicado FROM Products;
   
SELECT Price AS precio, Price*2 AS precio_duplicado
FROM Products;

