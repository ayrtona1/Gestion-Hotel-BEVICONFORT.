-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS hotel_bevi_confort;
USE hotel_bevi_confort;

-- Crear tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    Direccion VARCHAR(100)
);

-- Crear tabla Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    ID_Reserva INT PRIMARY KEY,
    ID_Cliente INT,
    ID_Habitacion INT,
    FechaEntrada DATE,
    FechaSalida DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),  -- Clave foránea a la tabla Clientes
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitaciones(ID_Habitacion) -- Clave foránea a la tabla Habitaciones
);

-- Crear tabla Habitaciones
CREATE TABLE IF NOT EXISTS Habitaciones (
    ID_Habitacion INT PRIMARY KEY,
    Numero INT,
    Tipo VARCHAR(50),
    Piso INT,
    PrecioPorNoche DECIMAL(10, 2),
    Disponible BOOLEAN
);

-- Crear tabla Servicios
CREATE TABLE IF NOT EXISTS Servicios (
    ID_Servicio INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    Precio DECIMAL(10, 2)
);

-- Crear tabla Reservas_Servicios
CREATE TABLE IF NOT EXISTS Reservas_Servicios (
    ID_Reserva_Servicio INT PRIMARY KEY,
    ID_Reserva INT,
    ID_Servicio INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva),  -- Clave foránea a la tabla Reservas
    FOREIGN KEY (ID_Servicio) REFERENCES Servicios(ID_Servicio) -- Clave foránea a la tabla Servicios
);

-- Crear tabla Facturas
CREATE TABLE IF NOT EXISTS Facturas (
    ID_Factura INT PRIMARY KEY,
    ID_Reserva INT,
    FechaEmision DATE,
    MontoTotal DECIMAL(10, 2),
    MetodoPago VARCHAR(50),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva) -- Clave foránea a la tabla Reservas
);


-- Inserción de Datos en la tabla Clientes
INSERT INTO Clientes (ID_Cliente, Nombre, Apellido, Telefono, CorreoElectronico, Direccion)
VALUES (6, 'Pedro', 'Gómez', '123456789', 'pedro@example.com', 'Avenida Principal');

INSERT INTO Clientes (ID_Cliente, Nombre, Apellido, Telefono, CorreoElectronico, Direccion)
VALUES (7, 'Laura', 'Fernández', '987654321', 'laura@example.com', 'Calle Secundaria');

-- Inserción de Datos en la tabla Reservas
INSERT INTO Reservas (ID_Reserva, ID_Cliente, ID_Habitacion, FechaEntrada, FechaSalida)
VALUES (6, 6, 106, '2024-07-01', '2024-07-05');

INSERT INTO Reservas (ID_Reserva, ID_Cliente, ID_Habitacion, FechaEntrada, FechaSalida)
VALUES (7, 7, 107, '2024-07-10', '2024-07-15');

-- Inserción de Datos en la tabla Habitaciones
INSERT INTO Habitaciones (ID_Habitacion, Numero, Tipo, Piso, PrecioPorNoche, Disponible)
VALUES (106, 106, 'Doble', 12, 110.00, TRUE);

INSERT INTO Habitaciones (ID_Habitacion, Numero, Tipo, Piso, PrecioPorNoche, Disponible)
VALUES (107, 107, 'Individual', 13, 75.00, TRUE);

-- Inserción de Datos en la tabla Servicios
INSERT INTO Servicios (ID_Servicio, Nombre, Descripcion, Precio)
VALUES (6, 'Gimnasio', 'Acceso al gimnasio', 25.00);

INSERT INTO Servicios (ID_Servicio, Nombre, Descripcion, Precio)
VALUES (7, 'Piscina', 'Acceso a la piscina', 20.00);

-- Inserción de Datos en la tabla Reservas_Servicios
INSERT INTO Reservas_Servicios (ID_Reserva_Servicio, ID_Reserva, ID_Servicio, Cantidad, PrecioUnitario)
VALUES (6, 6, 6, 1, 25.00);

INSERT INTO Reservas_Servicios (ID_Reserva_Servicio, ID_Reserva, ID_Servicio, Cantidad, PrecioUnitario)
VALUES (7, 7, 7, 1, 20.00);

-- Inserción de Datos en la tabla Facturas
INSERT INTO Facturas (ID_Factura, ID_Reserva, FechaEmision, MontoTotal, MetodoPago)
VALUES (6, 6, '2024-07-05', 135.00, 'Efectivo');

INSERT INTO Facturas (ID_Factura, ID_Reserva, FechaEmision, MontoTotal, MetodoPago)
VALUES (7, 7, '2024-07-15', 95.00, 'Tarjeta de débito');

-- Inserción de Datos en la tabla Clientes
INSERT INTO Clientes (ID_Cliente, Nombre, Apellido, Telefono, CorreoElectronico, Direccion)
VALUES (8, 'Roberto', 'Rodríguez', '654321987', 'roberto@example.com', 'Calle Principal');

INSERT INTO Clientes (ID_Cliente, Nombre, Apellido, Telefono, CorreoElectronico, Direccion)
VALUES (9, 'Elena', 'Díaz', '321654987', 'elena@example.com', 'Avenida Secundaria');

-- Inserción de Datos en la tabla Reservas
INSERT INTO Reservas (ID_Reserva, ID_Cliente, ID_Habitacion, FechaEntrada, FechaSalida)
VALUES (8, 8, 108, '2024-08-01', '2024-08-05');

INSERT INTO Reservas (ID_Reserva, ID_Cliente, ID_Habitacion, FechaEntrada, FechaSalida)
VALUES (9, 9, 109, '2024-08-10', '2024-08-15');

-- Inserción de Datos en la tabla Habitaciones
INSERT INTO Habitaciones (ID_Habitacion, Numero, Tipo, Piso, PrecioPorNoche, Disponible)
VALUES (108, 108, 'Doble', 14, 120.00, TRUE);

INSERT INTO Habitaciones (ID_Habitacion, Numero, Tipo, Piso, PrecioPorNoche, Disponible)
VALUES (109, 109, 'Individual', 15, 80.00, TRUE);

-- Inserción de Datos en la tabla Servicios
INSERT INTO Servicios (ID_Servicio, Nombre, Descripcion, Precio)
VALUES (8, 'Desayuno Buffet', 'Desayuno completo', 15.00);

INSERT INTO Servicios (ID_Servicio, Nombre, Descripcion, Precio)
VALUES (9, 'Estacionamiento', 'Estacionamiento privado', 10.00);

-- Inserción de Datos en la tabla Reservas_Servicios
INSERT INTO Reservas_Servicios (ID_Reserva_Servicio, ID_Reserva, ID_Servicio, Cantidad, PrecioUnitario)
VALUES (8, 8, 8, 2, 15.00);

INSERT INTO Reservas_Servicios (ID_Reserva_Servicio, ID_Reserva, ID_Servicio, Cantidad, PrecioUnitario)
VALUES (9, 9, 9, 1, 10.00);

-- Inserción de Datos en la tabla Facturas
INSERT INTO Facturas (ID_Factura, ID_Reserva, FechaEmision, MontoTotal, MetodoPago)
VALUES (8, 8, '2024-08-05', 30.00, 'Efectivo');

INSERT INTO Facturas (ID_Factura, ID_Reserva, FechaEmision, MontoTotal, MetodoPago)
VALUES (9, 9, '2024-08-15', 90.00, 'Tarjeta de crédito');

-- Creación de Vistas
CREATE VIEW HabitacionesDisponibles AS
SELECT *
FROM Habitaciones
WHERE Disponible = TRUE;

CREATE VIEW FacturasDetalladas AS
SELECT f.ID_Factura, r.ID_Reserva, r.ID_Cliente, r.FechaEntrada, f.MontoTotal, f.MetodoPago
FROM Facturas f
JOIN Reservas r ON f.ID_Reserva = r.ID_Reserva;

-- Creación de Funciones
DELIMITER $$
CREATE FUNCTION CalcularDescuentoCliente(ID_Cliente INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE Descuento DECIMAL(10, 2);
    -- Lógica para calcular el descuento
    RETURN Descuento;
END$$

CREATE FUNCTION ObtenerPrecioServicio(ID_Servicio INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE Precio DECIMAL(10, 2);
    -- Lógica para obtener el precio del servicio
    RETURN Precio;
END$$
DELIMITER ;

-- Creación de Procedimientos Almacenados
DELIMITER $$
CREATE PROCEDURE ActualizarEstadoReserva(IN ID_Reserva INT)
BEGIN
    UPDATE Reservas
    SET Estado = 'Finalizada'
    WHERE ID_Reserva = ID_Reserva;
END$$

CREATE PROCEDURE GenerarReporteMensual(IN Mes INT, IN Anio INT)
BEGIN
    -- Lógica para generar el reporte mensual
END$$
DELIMITER ;

-- Creación de Triggers
DELIMITER $$
CREATE TRIGGER ActualizarFechaSalidaReserva
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Reservas
    SET FechaSalida = DATE_ADD(NEW.FechaEntrada, INTERVAL 5 DAY)  -- Ejemplo de actualización de fecha
    WHERE ID_Reserva = NEW.ID_Reserva;
END$$

CREATE TRIGGER EnviarCorreoConfirmacion
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
    -- Lógica para enviar correo de confirmación al cliente
END$$
DELIMITER ;
