/* Creamos una tabla 'Rewards' (recompensas) que va a estar relacionada
   con la tabla Employees [empleados] */
   
CREATE TABLE "Rewards" (
    "RewardID" INTEGER,
	"EmployeeID" INTEGER,
	"Reward" INTEGER,
	"Month" TEXT,
	PRIMARY KEY("RewardID" AUTOINCREMENT)
);

INSERT INTO Rewards (EmployeeID, Reward, Month) VALUES
(3, 200, "January"),
(2, 180, "February"),
(5, 250, "March"),
(1, 280, "April"),
(8, 160, "May"),
(null, null, "June");

SELECT * FROM Rewards;

SELECT FirstName AS Nombre, Reward AS Recompensa, Month AS Mes
FROM Employees e
INNER JOIN Rewards r ON e.EmployeeID = r.EmployeeID;

-- En conclusión, INNER JOIN nos devuelve las coincidencias entre las
-- tablas
