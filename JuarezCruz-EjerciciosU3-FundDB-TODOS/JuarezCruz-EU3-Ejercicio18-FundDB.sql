CREATE TABLE Departamentos (
    codigo_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    presupuesto_anual DECIMAL(15, 2)
);

CREATE TABLE Centros_Trabajo (
    codigo_centro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    poblacion VARCHAR(100),
    direccion VARCHAR(255)
);

CREATE TABLE Empleados (
    NIF VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    fecha_alta DATE,
    numero_hijos INT,
    salario DECIMAL(10, 2),
    codigo_departamento INT,
    FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo_departamento)
);

CREATE TABLE Hijos (
    codigo_hijo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    NIF_empleado VARCHAR(15),
    FOREIGN KEY (NIF_empleado) REFERENCES Empleados(NIF)
);

CREATE TABLE Habilidades (
    codigo_habilidad INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255)
);

CREATE TABLE Empleados_Habilidades (
    NIF_empleado VARCHAR(15),
    codigo_habilidad INT,
    PRIMARY KEY (NIF_empleado, codigo_habilidad),
    FOREIGN KEY (NIF_empleado) REFERENCES Empleados(NIF),
    FOREIGN KEY (codigo_habilidad) REFERENCES Habilidades(codigo_habilidad)
);

CREATE TABLE Centros_Trabajo_Directores (
    codigo_centro INT,
    NIF_empleado VARCHAR(15),
    PRIMARY KEY (codigo_centro, NIF_empleado),
    FOREIGN KEY (codigo_centro) REFERENCES Centros_Trabajo(codigo_centro),
    FOREIGN KEY (NIF_empleado) REFERENCES Empleados(NIF)
);

INSERT INTO Departamentos (nombre, presupuesto_anual) VALUES 
('Recursos Humanos', 150000.00),
('Finanzas', 250000.00),
('Desarrollo', 300000.00),
('Marketing', 200000.00),
('Ventas', 180000.00);


INSERT INTO Centros_Trabajo (nombre, poblacion, direccion) VALUES 
('Centro Morelia', 'Morelia', 'Calle Mayor, 1'),
('Centro Barcelona', 'Barcelona', 'Avenida Diagonal, 123'),
('Centro Uruapan', 'Uruapan', 'Calle Colon, 45'),
('Centro Apatzingan', 'Apatzingan', 'Calle Sierpes, 32'),
('Centro Buenavista', 'Buenavista', 'Gran Vía, 45');


INSERT INTO Empleados (NIF, nombre, telefono, fecha_alta, numero_hijos, salario, codigo_departamento) VALUES 
('12345678A', 'Juan Pérez', '600123456', '2020-01-15', 2, 30000.00, 1),
('23456789B', 'Ana García', '600234567', '2019-03-10', 1, 35000.00, 2),
('34567890C', 'Luis Martínez', '600345678', '2021-06-20', 0, 32000.00, 3),
('45678901D', 'María Fernández', '600456789', '2018-09-25', 3, 40000.00, 4),
('56789012E', 'Carlos López', '600567890', '2022-02-15', 1, 28000.00, 5);


INSERT INTO Hijos (nombre, fecha_nacimiento, NIF_empleado) VALUES 
('Lucía Pérez', '2015-05-20', '12345678A'),
('Carlos Pérez', '2017-08-10', '12345678A'),
('Laura García', '2020-04-05', '23456789B'),
('Sofía Fernández', '2012-11-30', '45678901D'),
('Marta Fernández', '2015-01-14', '45678901D');


INSERT INTO Habilidades (descripcion) VALUES 
('Programación en Java'),
('Gestión de Proyectos'),
('Análisis de Datos'),
('Marketing Digital'),
('Ventas y Negociación');


INSERT INTO Empleados_Habilidades (NIF_empleado, codigo_habilidad) VALUES 
('12345678A', 1),
('23456789B', 2),
('34567890C', 3),
('45678901D', 4),
('56789012E', 5);


INSERT INTO Centros_Trabajo_Directores (codigo_centro, NIF_empleado) VALUES 
(1, '12345678A'),
(2, '23456789B'),
(3, '34567890C'),
(4, '45678901D'),
(5, '56789012E');
