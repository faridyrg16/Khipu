CREATE DATABASE TiendaDB;
USE TiendaDB;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,--Correcion: Se añade PRIMARY KEY.
    nombre VARCHAR(50) NOT NULL,-- Correcion: Se añade NOT NULL siempre debe terner nombre
    apellido VARCHAR(50),
    fecha_nacimiento DATE,-- Correcion: Se cambia VARCHAR(20) a DATE, cambio de dato para fechas
    email VARCHAR(100) UNIQUE,-- Correcion: se agrega varchar por tet y se agrega unique para evitar correos repetidos
    telefono VARCHAR(15)-- Correcion: se cambia por varchar
); -- Correcion: Las columnas se definen DENTRO de los paréntesis.

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,-- Correcion: Se añade PRIMARY KEY.
    nombre_producto VARCHAR(100) NOT NULL, 
    precio DECIMAL(10, 2) NOT NULL, -- Correcion: Se especifica la precisión para DECIMAL
    categoria VARCHAR(50),  -- Correcion (Mejora): Se añade un CHECK para asegurar que el stock no sea negativo.
    stock INT CHECK (stock >= 0)
);

CREATE TABLE Pedidos (
    numero_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total DECIMAL(10, 2),
    estado VARCHAR(20),  
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)    -- Correcion: Se añade la FOREIGN KEY para relacionar Pedidos con Clientes.
                                                                -- Esto asegura que 'id_cliente' DEBE existir en la tabla 'Clientes'
); -- Correcion: Las columnas van DENTRO de los paréntesis.

CREATE TABLE Detalles_Pedido (
    id_detalle INT PRIMARY KEY,-- Correcion: Se añade PRIMARY KEY.
    numero_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (numero_pedido) REFERENCES Pedidos(numero_pedido),    -- Correcion: Se añaden FOREIGN KEYs para la integridad referencial.
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)       
);-- Correcion: Las columnas van DENTRO de los paréntesis.

-- 2. INSERCIÓN CORREGIDA

-- Inserciones en Clientes
INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento, email, telefono)
VALUES (1, 'María', 'González', '15/05/1990', 'maria@email.com', '1234567890');

INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento, email)
-- Correcion: Se cambia al formato 'DD/MM/YYYY'.
VALUES (2, 'Carlos', 'López', '15/05/1990', 'carlos@email.com');

INSERT INTO Clientes (id_cliente, nombre, fecha_nacimiento, telefono)
VALUES (3, 'Ana', '25/12/1985', '9876543210');

INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento, email, telefono)
-- Correcion: Se cambia 'A4' por un número (4), 'id_cliente' es tipo INT, no texto.
VALUES (4, 'Pedro', 'Martínez', '30/08/1992', 'pedro@email.com', '5551234');

-- Inserciones en Productos
INSERT INTO Productos (id_producto, nombre_producto, precio, categoria, stock)
VALUES (1, 'Laptop Gamer', 1200.99, 'Tecnología', 15);

INSERT INTO Productos (id_producto, nombre_producto, precio, categoria, stock)
-- Correcion: Se cambia 'veinticinco dólares' por numeros (25.00) precio es DECIMAL.
VALUES (2, 'Mouse Inalámbrico', 25.00, 'Tecnología', 30);

INSERT INTO Productos (id_producto, nombre_producto, precio, categoria, stock)
VALUES (3, 'Teclado Mecánico', 15.00 ,'Tecnología', 25);

INSERT INTO Productos (id_producto, nombre_producto, precio, categoria, stock)
-- Correcion: Se cambia el 'id_producto' de 1 a 4. El ID 1 ya existe (Laptop) y las PRIMARY KEY no se pueden duplicar.
VALUES (4, 'Tablet Android', 299.99, 'Tecnología', 10);

-- Inserciones en Detalles Pedido
INSERT INTO Detalles_Pedido (id_detalle, numero_pedido, id_producto, cantidad, precio_unitario)
VALUES (1, 1001, 1, 1, 1200.99);

INSERT INTO Detalles_Pedido (id_detalle, numero_pedido, id_producto, cantidad, precio_unitario)
-- Correcion: Falta el 'precio_unitario'. Asumimos que queremos tomar el precio del producto (25.00).
-- Lo correcto sería añadirlo explícitamente.
VALUES (2, 1001, 2, 2,25.00);

INSERT INTO Detalles_Pedido (id_detalle, numero_pedido, id_producto, cantidad, precio_unitario)
-- Correcion: Se usan 'numero_pedido' (1005) y 'id_producto' (5) que no existen.
-- Se cambian por valores que sí existen (ej. Pedido 1002, Producto 4).
VALUES (3, 1002, 4, 1, 299.99);

-- Inserciones en Detalles Pedido
INSERT INTO Detalles_Pedido (id_detalle, numero_pedido, id_producto, cantidad, precio_unitario)
VALUES (1, 1001, 1, 1, 1200.99);

INSERT INTO Detalles_Pedido (id_detalle, numero_pedido, id_producto, cantidad, precio_unitario)
-- Correcion: Falta el 'precio_unitario'. Asumimos que queremos tomar el precio del producto (25.00).
-- Lo correcto sería añadirlo explícitamente.
VALUES (2, 1001, 2, 2,25.00); -- Nota: precio_unitario será NULL

INSERT INTO Detalles_Pedido (id_detalle, numero_pedido, id_producto, cantidad, precio_unitario)
-- Correcion: Se usan 'numero_pedido' (1005) y 'id_producto' (5) que no existen.
-- Se cambian por valores que sí existen (ej. Pedido 1002, Producto 4).
VALUES (3, 1002, 4, 1, 299.99);

-- Consulta 1:
-- Correcion: Se quita AVG(id_cliente)
SELECT nombre, id_cliente
FROM Clientes
WHERE nombre = 'María';

-- Consulta 2:
-- Correcion: Se quita UPPER(precio). UPPER() es para texto, 'precio' es DECIMAL.
SELECT nombre_producto, precio as precio_mayusculas
FROM Productos;

-- Consulta 3:
-- Correcion: Se quita 'nombre_producto' del SELECT.
-- Si usas GROUP BY 'categoria', solo puedes seleccionar 'categoria'
SELECT categoria, MAX(precio) as precio_maximo
FROM Productos
GROUP BY categoria;

-- Consulta 4:
-- Correcion: Esta consulta AHORA FUNCIONA.
-- El Problema encontrado era que 'fecha_nacimiento' por que estaba como varchar ahora esa en date
SELECT nombre, YEAR(fecha_nacimiento) as año_nacimiento
FROM Clientes;

-- Consulta 5:
-- Correcion: Se cambia 'MIL-UNO' (texto) por 1001 (número).
SELECT * FROM Pedidos
WHERE numero_pedido = 1001;

-- Consulta 6:
-- Correcion: La unión original (Clientes.id = Productos.id) no tiene sentido lógico.
-- "Mostrar el nombre del cliente y el nombre del producto que compró"
SELECT c.nombre, pr.nombre_producto
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
JOIN Detalles_Pedido dp ON p.numero_pedido = dp.numero_pedido
JOIN Productos pr ON dp.id_producto = pr.id_producto;