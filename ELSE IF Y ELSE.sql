-- ELSEIF Y ELSE

DELIMITER //
CREATE PROCEDURE estado_viaje(IN p_id_viaje INT)

BEGIN
     DECLARE v_estado VARCHAR(20);
     SELECT estado
     INTO v_estado
     FROM viajes
     WHERE id_viaje = p_id_viaje;
     IF v_estado = 'SOLICITADO' THEN
	SELECT 	'El viaje aún espera asignación' AS mensaje;
     ELSEIF v_estado = 'EN CURSO' THEN
	SELECT 'El viaje se encuentra en ejecución' AS mensaje;
     ELSEIF v_estado = 'FINALIZADO' THEN
	SELECT 'El viaje ya termino' AS mensaje;
     END IF;
END //

DELIMITER ;

-- Ejemplo: Cambiar disponibilidad de un conductor

DELIMITER //
CREATE PROCEDURE cambiar_disponibilidad(IN p_id_conductor INT, 
IN p_disponibilidad VARCHAR(20)
)
BEGIN
     IF p_disponibilidad = 'DISPONIBLE' OR p_disponibilidad = 'OCUPADO' OR p_disponibilidad = 'DESCONECTADO' THEN
	UPDATE conductores SET
	    disponibilidad = p_disponibilidad WHERE id_conductor = p_id_conductor;
	SELECT 'Disponibilidad actualizada' AS mensaje;
	ELSE
	     SELECT 'Disponibilidad no valida' AS mensaje;
	END IF;
END //
DELIMITER ;

--Cambio de disponibilidad dependiendo de la fecha de inicio

DELIMITER //
CREATE PROCEDURE Disponibilidad_Viaje(IN p_id_vehiculo INT)
BEGIN
	DECLARE v_fecha_inicio DATETIME;
    SELECT fecha_inicio
    INTO v_fecha_inicio
    FROM viajes
    WHERE id_vehiculo = p_id_vehiculo
    
    IF v_fecha_inicio IS NOT NULL THEN
    	UPDATE vehiculos
        SET disponibilidad = 'OCUPADO'
        WHERE id_vehiculo = p_id_vehiculo;
        
        SELECT 'Vehiculo Ocupado' AS mensaje;
        
    ELSE
    	UPDATE vehiculos
        SET disponibilidad = 'DESOCUPADO'
        WHERE id_vehiculo = p_id_vehiculo;
        
        SELECT 'Vehiculo Desocupado' AS mensaje;
    END IF;
END //

DELIMITER ;

--Cambio de Disponibilidad dependiendo de el estado del viaje

DELIMITER //

CREATE PROCEDURE Disponibilidad_Viaje(
    IN p_id_vehiculo INT
)
BEGIN
    DECLARE v_estado VARCHAR(20);

    SELECT estado 
    INTO v_estado
    FROM viajes
    WHERE id_vehiculo = p_id_vehiculo
    LIMIT 1;

    IF v_estado = 'ACTIVO' THEN
        UPDATE vehiculos
        SET estado = 'OCUPADO'
        WHERE id_vehiculo = p_id_vehiculo;

        SELECT 'Vehículo OCUPADO' AS mensaje;
    ELSE
        UPDATE vehiculos
        SET estado = 'DESOCUPADO'
        WHERE id_vehiculo = p_id_vehiculo;

        SELECT 'Vehículo DESOCUPADO' AS mensaje;
    END IF;
END //

DELIMITER ;