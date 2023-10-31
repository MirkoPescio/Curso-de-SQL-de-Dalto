  /* CONSULTAS CON CONDICIONALES: */

SELECT * FROM Products;

SELECT ProductName FROM ProductName;

/* Pedimos registros más específicos */

SELECT ProductName FROM Products
WHERE ProductID = 14;
SELECT * FROM Products
WHERE ProductID = 14;

SELECT * FROM Products WHERE Price <= 40;
SELECT * FROM Products WHERE Price > 40;
