SELECT * FROM turnos_medicos;

/* Si agrego un registro con un dato equivocado ¿cómo 
   puedo modificarlo? */
   
UPDATE turnos_medicos SET horario = "10:30"
WHERE id_turno = 5;

UPDATE turnos_medicos SET motivo = "Dolor de espalda"
WHERE id_turno = 1;

/* O para actualizar 2 campos o más en una sola
   consulta */
   
UPDATE turnos_medicos
SET horario = "10:15", 
    motivo = "Análisis de sangre y orina"
WHERE id_turno = 4;


