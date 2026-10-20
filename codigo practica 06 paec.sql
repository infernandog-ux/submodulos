create database paec_cultura_vial;

use paec_cultura_vial;

CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY IDENTITY(1,1),
    edad VARCHAR(20),
    sexo VARCHAR(20),
    semestre VARCHAR(30),
    comunidad VARCHAR(60),
    transporte VARCHAR(40)
);

select * from Estudiantes;

CREATE TABLE Encuestas (
    id_encuesta INT PRIMARY KEY IDENTITY(1,1),
    id_estudiante INT,
    frecuencia_moto VARCHAR(30),
    uso_casco VARCHAR(30),
    uso_celular VARCHAR(30),
    respeta_velocidad VARCHAR(30),
    usa_cinturon VARCHAR(30),
    respeta_senales VARCHAR(30),
    conoce_normas VARCHAR(30),
    capacitacion VARCHAR(30),
    riesgo_sin_casco VARCHAR(30),
    mayor_riesgo VARCHAR(100),
    tuvo_accidente VARCHAR(5),
    FOREIGN KEY (id_estudiante)
        REFERENCES Estudiantes(id_estudiante)
);

select * from Encuestas;

CREATE TABLE Accidentes (
    id_accidente INT PRIMARY KEY IDENTITY(1,1),
    id_estudiante INT,
    medio_accidente VARCHAR(40),
    anio varchar(50),
    tipo_accidente VARCHAR(60),
    tuvo_lesiones VARCHAR(5),
    gravedad VARCHAR(30),
    equipo_seguridad VARCHAR(20),
    FOREIGN KEY (id_estudiante)
        REFERENCES Estudiantes(id_estudiante)
);

select * from Accidentes;

SELECT *
FROM Estudiantes
INNER JOIN Encuestas
    ON Estudiantes.id_estudiante = Encuestas.id_estudiante
INNER JOIN Accidentes
    ON Estudiantes.id_estudiante = Accidentes.id_estudiante;

	-- CONSULTA 1
SELECT *
FROM Estudiantes
WHERE edad = '16 años';

-- CONSULTA 2
SELECT *
FROM Estudiantes
WHERE edad = '18 años o más';

-- CONSULTA 3
SELECT *
FROM Estudiantes
WHERE edad = '16 años'
OR edad = '15 años';

-- CONSULTA 4
SELECT *
FROM Estudiantes
WHERE semestre <> 'Primer semestre';

-- CONSULTA 5
SELECT *
FROM Estudiantes
WHERE edad = '16 años'
OR edad = '17 años'
OR edad = '18 años';

-- CONSULTA 6
SELECT *
FROM Encuestas
WHERE uso_casco = 'Nunca';

-- CONSULTA 7
SELECT *
FROM Encuestas
WHERE frecuencia_moto = 'Todos los días'
AND uso_casco = 'Nunca';

-- CONSULTA 8
SELECT *
FROM Encuestas
WHERE riesgo_sin_casco = 'Muy peligroso'
OR uso_casco = 'Nunca';

-- CONSULTA 9
SELECT *
FROM Encuestas
WHERE NOT uso_casco = 'Siempre';

-- CONSULTA 10
SELECT *
FROM Accidentes
WHERE anio >= '2024'
AND tuvo_lesiones = 'Sí';