#Vistas en MySQL

--Sirve para guardar información de varias tablas en una sola "etiqueta" para utilizarlo después

#Ejemplo

CREATE VIEW v_entrenador_sedes AS
SELECT c.id_clase, c.nombre AS Nombre_Clase, e.nombres, e.salario, s.nombre AS Nombre_sede, s.ciudad
FROM clase c INNER JOIN entrenadores e ON c.id_entrenador = e.id_entrenador INNER JOIN sedes s ON c.id_sede = s.id_sede;

SELECT * FROM v_entrenador_sedes;

DROP VIEW IF EXISTS v_entrenador_sede;

#DELIMITER

--Sirve para que MySQL entienda que lo que se va a realizar no es una consulta sino un procedimiento que sirve para optimizar código y no repetir consultas

DELIMITER //
 
CREATE PROCEDURE nombre_procedimiento()
BEGIN
 
    instrucciones SQL;
 
END //
 
DELIMITER ;

--Crear un procedimiento almacenado llamado listar_clientes que muestre todos los clientes registrados en el gimnasio

DELIMITER //
 
CREATE PROCEDURE listar_clientes()
BEGIN
 
    SELECT * FROM clientes;
 
END //
 
DELIMITER ;

--Para llamar al procedimiento se hace de la siguiente manera

CALL listar_clientes();

--Crear un procedimiento llamado listar_Clientes_Activos que muestre unicamente los clientes cuyo estado sea ACTIVO 

DELIMITER //
 
CREATE PROCEDURE listar_clientes_activos()
BEGIN
    SELECT id_cliente,
	   nombres,
	   apellidos,
	   teléfono,
	   correo,
	   estado
    FROM clientes
    WHERE estado = 'ACTIVO' 
END //
 
DELIMITER ;

--Crear un procedimiento que permita ingresar el ID de un cliente y consultar sus datos.

DROP PROCEDURE IF EXISTS buscar_cliente;

DELIMITER //
CREATE PROCEDURE buscar_cliente(IN p_id_cliente INT) --Sirve para que el cliente ponga el parámetro solicitado
BEGIN
	SELECT id_cliente,
	       nombre,
	       apellidos,
	       documento,
	       teléfono,
	       correo
	       estado
	FROM clientes
	WHERE id_cliente = p.id_cliente;
END //

DELIMITER ;

CALL buscar_cliente(1);

---Crear un procedimiento que reciba una categoría y muestre los productos correspondientes

DROP PROCEDURE IF EXISTS buscar_productos_categoria;

DELIMITER //

CREATE PROCEDURE buscar_productos_categoria(IN p_categoria VARCHAR(30) INT)

BEGIN
	SELECT id_producto
	       nombre,
	       categoría,
	       precio_venta,
	FROM productos
	WHERE categoria = p.categoria;
END //

DELIMITER ;
  	
CALL buscar_productos_categoria('BEBIDA');

#OUT

--Sirve para devolver información

#EJEMPLO

--Que cuente todos los clientes con estado activo y nos devuelva el valor en numero

DELIMITER //

CREATE PROCEDURE contar_clientes_activos (OUT p_total INT) --Guarda la información 

BEGIN
	SELECT COUNT(*)
	INTO p_total --Pone el dato dentro de "p_total"
	FROM clientes
	WHERE estado = 'ACTIVO';
END //

DELIMITER ;

CALL contar_clientes_activos(@total); --Se almacena dato del procedimiento
SELECT @total; --Se llamada el dato

--Crear un procedimiento que reciba un producto y determine si tiene suficiente inventario

DROP PROCEDURE revisar_stock(IN p_id_producto INT)

DELIMITER //

CREATE PROCEDURE revisar_stock(IN p_id_producto INT)

BEGIN
	DECLARE v_stock INT;
	SELECT stock
	INTO v_stock
	FROM productos
	WHERE id_producto = p_id_producto;
	IF v_stock = 0 THEN
		SELECT 'PRODUCTO AGOTADO' AS mensaje;
	ELSEIF v_stock <= 20 THEN
		SELECT 'STOCK BAJO' AS mensaje;
	ELSE
		SELECT 'STOCK  SUFICIENTE AS mensaje;
	END IF;
END //
DELIMITER ;

CALL revisar_stock(6);