/* 25. Lista todos los productos que tengan un precio entre 60€ y 200€.
Utilizando el operador BETWEEN */

SELECT * FROM producto
WHERE (precio >= 60) AND (precio <= 200);
