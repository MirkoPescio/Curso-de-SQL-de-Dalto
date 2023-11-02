/* Operador LIKE */

SELECT * FROM Employees WHERE LastName LIKE "Fuller";
SELECT * FROM Employees WHERE LastName LIKE "Fuller ";

SELECT * FROM Employees WHERE LastName LIKE "%r"; /* Para
   este caso el símbolo de porcentaje '%' adelante
   quiere decir que va a buscar los apellidos que 
   terminen en 'r'.
   Adelante puede haber cualquier cosa, pero la
   terminación es la que especificamos a la derecha
   del porcentaje*/

SELECT * FROM Employees WHERE LastName LIKE "%uller";

/* Al revés pasa lo mismo */

SELECT * FROM Employees WHERE LastName LIKE "F%";

SELECT * FROM Employees WHERE LastName LIKE "%r%";
/* Este caso se lee: todos los apellidos que contengan
   la letra/caracteres 'r' */

SELECT * FROM Employees WHERE LastName LIKE "F____r";

SELECT * FROM Employees WHERE LastName LIKE "_u____";

