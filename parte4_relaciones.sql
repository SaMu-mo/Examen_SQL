CREATE TABLE proyectos (
    id              SERIAL PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    dias_estimados  INTEGER NOT NULL CHECK (dias_estimados > 0)
);

CREATE TABLE tecnologias (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);


--Tabla Intermedia

CREATE TABLE proyectos_tecnologias (
    id_proyecto   INTEGER NOT NULL,
    id_tecnologia INTEGER NOT NULL,
    PRIMARY KEY (id_proyecto, id_tecnologia),
    FOREIGN KEY (id_proyecto)   REFERENCES proyectos(id),
    FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id)
);

INSERT INTO proyectos (nombre, dias_estimados) VALUES ('Sistema de Ventas', 90);
INSERT INTO proyectos (nombre, dias_estimados) VALUES ('App Movil', 60);
INSERT INTO proyectos (nombre, dias_estimados) VALUES ('Portal Web', 45);

INSERT INTO tecnologias (nombre, categoria) VALUES ('Java', 'Backend');
INSERT INTO tecnologias (nombre, categoria) VALUES ('React', 'Frontend');
INSERT INTO tecnologias (nombre, categoria) VALUES ('PostgreSQL', 'Base de Datos');
INSERT INTO tecnologias (nombre, categoria) VALUES ('Spring Boot', 'Backend');

INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (1, 1);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (1, 3);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (1, 4);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (2, 2);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (2, 3);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 1);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 2);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 4);

-- 1. Tecnologías usadas en un proyecto específico (filtrando por nombre del proyecto)
SELECT t.nombre, t.categoria
FROM tecnologias t
JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
JOIN proyectos p ON p.id = pt.id_proyecto
WHERE p.nombre = 'Sistema de Ventas';

-- 2. Proyectos que usan una tecnología específica (filtrando por id de tecnología)
SELECT p.nombre, p.dias_estimados
FROM proyectos p
JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
WHERE pt.id_tecnologia = 1;

-- 3. Reporte de uso tecnológico ordenado de mayor a menor
SELECT t.nombre, COUNT(pt.id_proyecto) AS total_proyectos
FROM tecnologias t
JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
GROUP BY t.nombre
ORDER BY total_proyectos DESC;