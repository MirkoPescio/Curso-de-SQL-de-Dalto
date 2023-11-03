/* 23. Lista el nombre de los productos que NO TIENEN un precio mayor o igual 
   a 400€ */

SELECT * FROM producto;

SELECT nombre FROM producto WHERE NOT precio >= 400;
