/* 4. Lista el nombre de los productos, el precio en euros y el precio en 
   dólares estadounidenses (USD) */

SELECT nombre, ROUND(precio/350.02, 2) AS precioDolares, 
ROUND(precio/371.65, 2) AS precioEuros FROM producto;
