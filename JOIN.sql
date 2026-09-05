#JOIN y sus usos

#El INNER JOIN muestra lo que hay en las dos tablas

--Mostrar todas las reservas realizadas, indicando el identificador del cliente y la información de la reserva
SELECT c.id_cliente, c.nombres. r.*
FROM clientes c INNER JOIN reservas r ON
c.id:cliente = r.id_cliente;

-- Mostar únicamente los clientes que tienen pagos registrados
SELECT c.id_cliente, c.nombres. c.correo, p.id_membresia, p.fecha_pago, p.valor, p.concepto, p.estado
FROM clientes c INNER JOIN pagos p ON
c.id:cliente = p.id_cliente;

--Mostrar las membresías asignadas a los clientes junto con la información del plan contrarado
SELECT mc.*, pm.*
FROM planes_membresia pm INNER JOIN membresias_cliente mc ON
mc.id_plan = pm.id_plan

#El LEFT JOIN muestra la informacion aunque no este en las dos tablas

--Mostrar todos los clientes que tengan o no reservas registrada.
SELECT c.id_cliente, c nombres, r.fecha_reserva, r.estado
FROM clientes c LEFT JOIN reservas r ON
c.id_cliente = r.id_cliente 

--Mostrar todos los clientes cuando exista la infromación de sus pagos
SELECT c.id_cliente, c.nombre, p.valor, p.metodo
FROM clientes c LEFT JOIN pagos p ON 
c.id:cliente = p.id_cliente;

--Mostrar los clientes que no tiene ningun pago registrado
SELECT c.id_cliente, c.nombres, p.valor, p.metodo
FROM clientes c RIGHT JOIN pagos p ON
c.id_cliente = p.id:cliente IS NULL; 

--Mostrar las clases, junto con el entrenador responsable y  la sede donde se desarolla
SELECT c.id_clase, c.nombres, e.nombres, e.salario, s.nombre, s.ciudad
FROM clases c INNER JOIN entrenadores e ON 
	c.id_entrenador = e.id_entrenador
	INNER JOIN sedes s ON c.id_sede = s.id_sede;