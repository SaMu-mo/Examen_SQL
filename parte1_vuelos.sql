CREATE TABLE vuelos (
    id                  SERIAL PRIMARY KEY,
    codigo              VARCHAR(10) NOT NULL UNIQUE,
    precio_boleto       NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0),
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0)
);


INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-101', 250.00, 45);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-202', 180.50, 3);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-305', 320.75, 12);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-410', 99.99, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-512', 415.00, 28);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-618', 530.00, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AV-720', 145.00, 7);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AV-815', 210.00, 2);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('CM-923', 375.50, 19);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('CM-104', 290.00, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-211', 480.00, 33);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-316', 155.75, 4);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-428', 620.00, 8);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-533', 189.00, 1);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-641', 710.50, 22);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-745', 340.00, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-852', 275.00, 15);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-957', 195.50, 6);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('BA-063', 890.00, 41);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('BA-168', 450.00, 0);


-- 1. Vuelos con menos de 5 
SELECT * FROM vuelos
WHERE asientos_disponibles < 5;

-- 2. Incremento del 15% 
UPDATE vuelos
SET precio_boleto = precio_boleto * 1.15
WHERE id = 1;

-- 3. Eliminar vuelos con 0
DELETE FROM vuelos
WHERE asientos_disponibles = 0;

