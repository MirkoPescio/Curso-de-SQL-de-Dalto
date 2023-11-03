/* 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en 
mayúsculas los dos primeros caracteres del nombre del fabricante. */

SELECT * FROM fabricante;

SELECT nombre, (SUBSTRING(nombre, 1, 2)) AS iniciales
FROM fabricante;
