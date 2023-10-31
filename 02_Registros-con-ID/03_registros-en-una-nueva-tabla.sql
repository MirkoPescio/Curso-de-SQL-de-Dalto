INSERT INTO turnos_medicos (profesional, id_usuario, motivo, horario)
VALUES ("Dr. Ramirez", 6, "Dolor de panza", "12:30"),
       ("Dr. Belaustegui", 42, "Migraña", "11:45"),
	   ("Dra. Carmona", 30, "Dolor de muela", "13:15"),
	   ("Dra. Vázquez", 26, "análisis de sangre", "10:00");
	   
SELECT * FROM turnos_medicos;
SELECT * FROM usuarios;

INSERT INTO turnos_medicos (profesional, id_usuario, motivo, horario)
VALUES ("Dr. Ibañez", 2, "Dolor de rodilla", "10:35"),
       ("Dra. Vázquez", 3, "Chequeo general", "9:50");
	   