-- EJERCICIO 6 RODOLFO FLORES ROJAS
CREATE TABLE Producto (
    codigo INT PRIMARY KEY,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2),
    numero_existencias INT
);


CREATE TABLE Cliente (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);


CREATE TABLE Compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_codigo INT,
    producto_codigo INT,
    fecha DATE,
    FOREIGN KEY (cliente_codigo) REFERENCES Cliente(codigo),
    FOREIGN KEY (producto_codigo) REFERENCES Producto(codigo)
);


CREATE TABLE Proveedor (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    direccion VARCHAR(255),
    provincia VARCHAR(50),
    telefono VARCHAR(20)
);


CREATE TABLE Producto_Proveedor (
    producto_codigo INT,
    proveedor_codigo INT,
    PRIMARY KEY (producto_codigo, proveedor_codigo),
    FOREIGN KEY (producto_codigo) REFERENCES Producto(codigo),
    FOREIGN KEY (proveedor_codigo) REFERENCES Proveedor(codigo)
);


INSERT INTO Producto (codigo, descripcion, precio, numero_existencias) VALUES
(1, 'Laptop Dell XPS 13', 1200.00, 10),
(2, 'Monitor Samsung 27"', 300.00, 15),
(3, 'Teclado Mecánico Logitech', 100.00, 50),
(4, 'Ratón Inalámbrico HP', 25.00, 80),
(5, 'Disco Duro Externo 1TB', 60.00, 40);


INSERT INTO Cliente (codigo, nombre, apellidos, direccion, telefono) VALUES
(1, 'Juan', 'Pérez', 'Calle Cerro alto 123', '555-1234'),
(2, 'María', 'Gómez', 'Avenida Lazaro Cardenas 742', '555-5678'),
(3, 'Luis', 'Martínez', 'Boulevard 95 456', '555-8765'),
(4, 'Ana', 'López', 'Camino Real 789', '555-4321'),
(5, 'Carlos', 'Fernández', 'Paseo de la Reforma 101', '555-9876');


INSERT INTO Proveedor (codigo, nombre, apellidos, direccion, provincia, telefono) VALUES
(1, 'Pedro', 'Sánchez', 'Calle El rey', 'Madrid', '555-1111'),
(2, 'Lucía', 'Hernández', 'Calle Gran Vía 2', 'Barcelona', '555-2222'),
(3, 'Javier', 'García', 'Avenida del Libertador 3', 'Valencia', '555-3333'),
(4, 'Sofía', 'Martín', 'Plaza Mayor 4', 'Sevilla', '555-4444'),
(5, 'Miguel', 'Ramírez', 'Calle Alcalá 5', 'Bilbao', '555-5555');


INSERT INTO Producto_Proveedor (producto_codigo, proveedor_codigo) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);


INSERT INTO Compra (cliente_codigo, producto_codigo, fecha) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-01-16'),
(3, 3, '2024-01-17'),
(4, 4, '2024-01-18'),
(5, 5, '2024-01-19'),
(1, 2, '2024-01-20'),
(2, 3, '2024-01-21'),
(3, 4, '2024-01-22'),
(4, 5, '2024-01-23'),
(5, 1, '2024-01-24');
