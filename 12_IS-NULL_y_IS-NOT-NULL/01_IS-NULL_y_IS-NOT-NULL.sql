
SELECT * FROM Products ORDER BY ProductName ASC;

SELECT * FROM Products
WHERE ProductName IS NOT NULL
ORDER BY ProductName ASC; /* Me devuelve todos los registros de la
   tabla 'Products' excepto los registros nulos [NULL] */
   
SELECT * FROM Products
WHERE ProductName IS NULL; /* Caso contrario si quiero solamente los
   registros nulos */
   