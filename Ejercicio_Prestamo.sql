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


