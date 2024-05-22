CREATE TABLE Clientes (
    codigo_cliente INT AUTO_INCREMENT PRIMARY KEY,
    telefono VARCHAR(15),
    domicilio VARCHAR(255),
    razon_social VARCHAR(255)
);

CREATE TABLE Proyectos (
    codigo_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    cuantia DECIMAL(15, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    codigo_cliente INT,
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
);

CREATE TABLE Colaboradores (
    nif VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100),
    domicilio VARCHAR(255),
    telefono VARCHAR(15),
    banco VARCHAR(100),
    numero_cuenta VARCHAR(20)
);

CREATE TABLE Tipos_Pago (
    codigo_tipo_pago INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255)
);

CREATE TABLE Pagos (
    numero_pago INT AUTO_INCREMENT PRIMARY KEY,
    concepto VARCHAR(255),
    cantidad DECIMAL(10, 2),
    fecha_pago DATE,
    nif_colaborador VARCHAR(15),
    codigo_proyecto INT,
    codigo_tipo_pago INT,
    FOREIGN KEY (nif_colaborador) REFERENCES Colaboradores(nif),
    FOREIGN KEY (codigo_proyecto) REFERENCES Proyectos(codigo_proyecto),
    FOREIGN KEY (codigo_tipo_pago) REFERENCES Tipos_Pago(codigo_tipo_pago)
);

CREATE TABLE Participacion (
    nif_colaborador VARCHAR(15),
    codigo_proyecto INT,
    PRIMARY KEY (nif_colaborador, codigo_proyecto),
    FOREIGN KEY (nif_colaborador) REFERENCES Colaboradores(nif),
    FOREIGN KEY (codigo_proyecto) REFERENCES Proyectos(codigo_proyecto)
);
INSERT INTO Clientes (telefono, domicilio, razon_social) VALUES
('123456789', 'Calle Falsa 123', 'Empresa A'),
('987654321', 'Avenida Siempre Viva 742', 'Empresa B'),
('555555555', 'Calle Luna 45', 'Empresa C'),
('444444444', 'Boulevard Sol 678', 'Empresa D'),
('333333333', 'Plaza Estrella 101', 'Empresa E');
INSERT INTO Proyectos (descripcion, cuantia, fecha_inicio, fecha_fin, codigo_cliente) VALUES
('Proyecto 1', 10000.00, '2023-01-01', '2023-06-01', 1),
('Proyecto 2', 20000.00, '2023-02-01', '2023-07-01', 2),
('Proyecto 3', 15000.00, '2023-03-01', '2023-08-01', 3),
('Proyecto 4', 25000.00, '2023-04-01', '2023-09-01', 4),
('Proyecto 5', 30000.00, '2023-05-01', '2023-10-01', 5);
INSERT INTO Colaboradores (nif, nombre, domicilio, telefono, banco, numero_cuenta) VALUES
('NIF001', 'Colaborador A', 'Domicilio A', '111111111', 'Banco A', 'Cuenta001'),
('NIF002', 'Colaborador B', 'Domicilio B', '222222222', 'Banco B', 'Cuenta002'),
('NIF003', 'Colaborador C', 'Domicilio C', '333333333', 'Banco C', 'Cuenta003'),
('NIF004', 'Colaborador D', 'Domicilio D', '444444444', 'Banco D', 'Cuenta004'),
('NIF005', 'Colaborador E', 'Domicilio E', '555555555', 'Banco E', 'Cuenta005');
INSERT INTO Tipos_Pago (descripcion) VALUES
('Tipo de Pago 1'),
('Tipo de Pago 2'),
('Tipo de Pago 3'),
('Tipo de Pago 4'),
('Tipo de Pago 5');
INSERT INTO Pagos (concepto, cantidad, fecha_pago, nif_colaborador, codigo_proyecto, codigo_tipo_pago) VALUES
('Pago 1', 1000.00, '2023-01-15', 'NIF001', 1, 1),
('Pago 2', 2000.00, '2023-02-15', 'NIF002', 2, 2),
('Pago 3', 1500.00, '2023-03-15', 'NIF003', 3, 3),
('Pago 4', 2500.00, '2023-04-15', 'NIF004', 4, 4),
('Pago 5', 3000.00, '2023-05-15', 'NIF005', 5, 5);
INSERT INTO Participacion (nif_colaborador, codigo_proyecto) VALUES
('NIF001', 1),
('NIF002', 2),
('NIF003', 3),
('NIF004', 4),
('NIF005', 5);
