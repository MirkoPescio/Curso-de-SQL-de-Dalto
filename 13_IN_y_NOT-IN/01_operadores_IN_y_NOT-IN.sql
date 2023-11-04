/* Operadores IN y NOT IN */

SELECT * FROM Products WHERE SupplierID = 3
OR SupplierID = 4 OR SupplierID = 5 OR SupplierID = 6;

/* Justamente con IN y NOT IN se pueden optimizar las consultas */

SELECT * FROM Products WHERE SupplierID IN (3, 4, 5, 6);

/* La cláusula IN se puede usar en SELECT, en UPDATE y en
   DELETE */

SELECT * FROM Employees
WHERE LastName IN ("Fuller", "King");
/* Y también la forma de negarlo: */
SELECT * FROM Employees
WHERE LastName NOT IN ("Fuller", "King");
