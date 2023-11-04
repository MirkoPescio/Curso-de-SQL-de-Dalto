/* 26. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de
fabricante sea igual a 6 */

SELECT * FROM producto
WHERE (precio > 200) AND (id_fabricante = 6);
