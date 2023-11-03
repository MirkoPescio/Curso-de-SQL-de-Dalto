/* 5. Lista el nombre de los productos, el precio en euros y el precio en 
dólares estadounidenses (USD). Utiliza los siguientes alias para 
las columnas: nombre de producto, euros, dólares. */

SELECT nombre AS nombre_de_producto, 
ROUND(precio/350.02, 2) AS dolares, 
ROUND(precio/371.65, 2) AS euros 
FROM producto;
