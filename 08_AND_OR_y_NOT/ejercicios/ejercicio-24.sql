/* Lista todos los productos que tengan un precio entre 80€ y 300€. 
Sin utilizar el operador BETWEEN */

SELECT * FROM producto
WHERE (precio >= 80) AND (precio <= 300);
