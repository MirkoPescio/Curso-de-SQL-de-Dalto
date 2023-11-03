/* 10. Lista los nombres y los precios de todos los productos de la tabla producto, 
truncando el valor del precio para mostrarlo sin ninguna cifra decimal. */

SELECT nombre, CAST(ROUND(precio, 0) AS INT) AS precio FROM producto;
