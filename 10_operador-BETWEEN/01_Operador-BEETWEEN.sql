/* Operador Between */

SELECT * FROM Products;

SELECT * FROM Products WHERE Price BETWEEN 20 AND 40;

SELECT * FROM Products WHERE Price BETWEEN 20 AND 40
OR CategoryID = 6;

/* También podemos usar el BETWEEN para establecer un
   rango entre fechas */
   
SELECT * FROM Employees WHERE BirthDate BETWEEN
"1960-0-1" AND "1970-0-1";
SELECT * FROM Employees WHERE BirthDate BETWEEN
"1950-0-1" AND "1960-0-1";

/* Hay que aclarar que el operador BETWEEN incluye los
   valores límite */
