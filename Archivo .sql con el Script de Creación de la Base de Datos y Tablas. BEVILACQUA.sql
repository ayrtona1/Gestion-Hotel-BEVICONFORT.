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

