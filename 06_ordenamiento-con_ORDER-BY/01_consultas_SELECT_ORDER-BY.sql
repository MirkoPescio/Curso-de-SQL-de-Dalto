SELECT * FROM Products;

SELECT * FROM Products ORDER BY price; /* Ordena los registros
   por el precio de forma ascendente */

SELECT * FROM Products ORDER BY price ASC; /* Es lo mismo */

SELECT * FROM Products ORDER BY price DESC; /* Ordena los registros
   por el precio de forma descendente */
   
SELECT * FROM Products ORDER BY ProductName; /* Ordena los 
   registros por el nombre de forma ascendente [A - Z] */
   
SELECT * FROM Products ORDER BY ProductName DESC; /* Ordena los 
   registros por el nombre de forma descendente [Z - A] */
   
/* ¿y si quiero que me muestre todos los datos pero los nulos
    al final? */

SELECT * FROM Products
ORDER BY ProductName ASC NULLS LAST;

/* Al contrario sería: */

SELECT * FROM Products
ORDER BY ProductName ASC NULLS FIRST; /* Es lo mismo no ponerlo
ya que, por defecto, los valores nulls aparecen al principio */

/* Ordenar de forma aleatoria es con Random() */

SELECT * FROM Products ORDER BY RANDOM();

/* Ordenar por 2 o más propiedades */

SELECT * FROM Products ORDER BY ProductName, SupplierID ASC;

SELECT * FROM Products ORDER BY ProductName, ProductID DESC;

/* Si hay más de un registro con el mismo valor y quiero una tabla
   con solamente 1, es decir, que no me repita otros registros con
   el mismo valor, uso la cláusula DISTINCT */
   
SELECT DISTINCT ProductName FROM Products;
SELECT DISTINCT ProductName FROM Products
ORDER BY ProductName ASC;
SELECT DISTINCT ProductName FROM Products
ORDER BY ProductName DESC;
SELECT DISTINCT ProductName FROM Products
ORDER BY Random();
