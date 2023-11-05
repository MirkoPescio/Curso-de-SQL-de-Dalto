/* Subconsultas.
   ¿Qué es una subconsulta? Intuitivamente se refiere a una
   consulta que está dentro de otra consulta.
   Estas nos permiten hacer cálculos/operaciones más avanzados/as,
   ya que, con el resultado de una subconsulta podemos usar ese
   valor en la consulta principal */
   
/* Otras aclaraciones:
   + Se puede tener subconsultas en otras subconsultas
   + Las subconsultas pueden usarse con SELECT, UPDATE, DELETE
   + Las subconsultas tienen que ser obligatoriamente SELECT, ya
     que, nos brindan datos. Ej: UPDATE(SELECT)
	 Esto se debe a que las subconsultas no pueden modificar la
	 base de datos. Solamente puede traer los mismos.
   + Las subconsultas se ponen entre paréntesis.
   + Las subconsultas devuelven 1 SOLA columna
*/
	 
SELECT ProductName FROM Products;
SELECT ProductName FROM Products WHERE ProductName IS NOT NULL;

SELECT ProductID, Quantity FROM OrderDetails;

-------------------------------------------------------------------

SELECT ProductID AS pID,
       Quantity,
	   (SELECT ProductName FROM Products) AS Nombre,
	   (SELECT CategoryID FROM Products)
FROM OrderDetails;

SELECT ProductID,
       Quantity,
	   (SELECT ProductName FROM Products 
	    WHERE OrderDetails.ProductID = ProductID) AS Nombre
FROM OrderDetails;

SELECT ProductID,
       Quantity,
	   (SELECT ProductName FROM Products 
	    WHERE OD.ProductID = ProductID) AS Nombre
FROM OrderDetails AS OD;

SELECT ProductID,
       Quantity,
	   (SELECT ProductName FROM Products 
	    WHERE OD.ProductID = ProductID) AS Nombre,
	   (SELECT Price FROM Products 
	    WHERE OD.ProductID = ProductID) AS Precio
FROM OrderDetails AS OD;

