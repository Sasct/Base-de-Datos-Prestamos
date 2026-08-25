CREATE DATABASE ejercicio_1;
USE ejercicio_1;

CREATE TABLE estudiante (
    ID_Estudiante INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(15),
    Apellido VARCHAR(15),
    Correo VARCHAR(50),
    Programa VARCHAR(25)
);

CREATE TABLE equipo (
    ID_Equipo INT PRIMARY KEY AUTO_INCREMENT,
    Codigo_Inventario VARCHAR(50),
    Marca VARCHAR(30),
    Modelo VARCHAR(50),
    Estado VARCHAR(15)
);

CREATE TABLE prestamos (
    ID_Prestamo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Estudiante INT,
    ID_Equipo INT,
    Fecha_Prestamo DATETIME,
    Fecha_Devolucion DATETIME,

FOREIGN KEY (ID_Estudiante) REFERENCES estudiante(ID_Estudiante),
FOREIGN KEY (ID_Equipo) REFERENCES equipo(ID_Equipo)

);

INSERT INTO Equipo (Codigo_Inventario,Estado,Marca,Modelo) VALUES 
('A1', 'Prestado', 'Asus', '2026'),
('A2', 'Disponible', 'Lenovo', '2020'),
('A3','Prestado', 'HP', '2015'),
('A4', 'Disponible', 'Dell', '2026'),
('A5', 'Mantenimiento', 'ASUS', '2025'),
('A6', 'Prestado', 'Acer', '2025');

INSERT INTO Estudiante (Apellido, Correo, Nombre, Programa) VALUES
('Pérez', 'carlos.perez@uni.edu', 'Carlos', 'Ingeniería de Sistemas'),
('Gómez', 'laura.gomez@uni.edu', 'Laura', 'Administración de Empresas'),
('Rodríguez', 'juan.rodriguez@uni.edu', 'Juan', 'Contaduría Pública'),
('Martínez', 'ana.martinez@uni.edu', 'Ana', 'Psicología'),
('Fernández', 'diego.fernandez@uni.edu', 'Diego', 'Derecho'),
('López', 'maria.lopez@uni.edu', 'María', 'Medicina');

INSERT INTO Prestamo (Fecha_Devolucion, Fecha_Prestamo, ID_Equipo, ID_Estudiante) VALUES
('2026-08-25', '2026-08-20 10:30:00', 1, 1),
('2026-08-28', '2026-08-22 14:15:00', 2, 2),
('2026-08-30', '2026-08-23 09:00:00', 3, 3),
('2026-09-01', '2026-08-24 16:45:00', 4, 4),
('2026-09-02', '2026-08-25 11:20:00', 5, 5),
('2026-09-05', '2026-08-26 13:10:00', 6, 6);

#Codigo para buscar en la base de datos
#Mostar Nombre y Apellidos de estudiante
SELECT Nombre, Apellido
FROM estudiante;

#Mostrar una caracteristica en especial
SELECT Marca, Modelo, Estado
FROM equipo
WHERE Estado = "Disponible";

#Mostrar el codigo inventario, marca y estado de los equipos en mantenimiento
SELECT Codigo_Inventario, Marca, Estado
FROM equipo
WHERE Estado = "Mantenimiento"

#Mostar el Apellido, Nombre y correo de los estuidantes de Ingenieria de Sistemas
SELECT Apellido, Nombre, Correo
FROM estudiante
WHERE Programa = "Ingenieria de Sistemas"

#Consultar la informacion correspondiente al estudiante con identificacion 103
SELECT *
FROM estudiante
WHERE ID_Estudiante = "103"

#Busque el equipo por codigo de inventario PC-003 Y muestre identificador, marca y estado
SELECT ID_Equipo, Marca, Estado
FROM equipo
WHERE Codigo_Inventario = "PC-003"

#Codigo para buscar cuando se cumplen dos condiciones (and)
SELECT *
FROM equipo
WHERE marca = "LENOVO" AND estado = "Disponible";

#Codigo para buscar cuando una de las dos condiciones se cumple
(OR)
SELECT *
FROM equipos
WHERE marca = "LENOVO" OR marca = "HP";

#Codigo para buscar entre dos datos
SELECT *
FROM equipo
WHERE Marca IN("LENOVO", "HP"); 

#Codigo para organizar de forma ascendente o descendente
SELECT Apellido, Nombre
FROM estudiante
ORDER BY Apellidos DESC;

#Mostrar Nombre, Apellido, programa de los estudiantes y ordemar de forma ascendente el nombre
SELECT Apellido, Nombre, Programa
FROM estudiante
ORDER BY Nombre ASC;

#Ordene de forma descendente por Identificador los estudiantes y muestre todos sus datos
SELECT *
FROM Estudiante
ORDER BY ID_Estudiante DESC;

#Codigo para buscar un dato si no se sabe como esta escrito o que tengan alguna cosa que este escrita en el parentesis

#Que tenga "LENOVO" ya sea en Mayusculas o Minusculas
SELECT *
FROM equipo
WHERE Marca LIKE "LENOVO"

#Que tenga L en algun lado
SELECT *
FROM equipo
WHERE Marca LIKE "%L%"

#Que tenga L al final
SELECT *
FROM equipo
WHERE Marca LIKE "%L"

#Que tenga L al inicio
SELECT *
FROM equipo
WHERE Marca LIKE "L%"

#Que L este en la 4 posicion
SELECT *
FROM equipo
WHERE Marca LIKE "___L"

#Consulte los nombres de estudiantes que inicien por la A
SELECT Nombre
FROM estudiante
WHERE Nombre LIKE "A%"

#Funciones de agregado
#COUNT() contar
#Determine cuantos computadores se encuentran disponibles
SELECT COUNT(*)
FROM equipo
WHERE estado = "Disponible";
#MAX, MIN, AVG

#Cuente los estudiantes del programa ingenieria de software
SELECT COUNT(*)
FROM estudiante
WHERE Programa = "Ingenieria de software"
