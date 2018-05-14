INSERT INTO Centro
VALUES
	('Centro Universitario de Ciencias Exactas e Ingenierias', 'CUCEI', 1),
	('Centro Universitario de Ciencias Economico Administrativas', 'CUCEA', 1),
	('Centro Universitario de Arte, Arquitectura y Diseño', 'CUAAD', 1)

INSERT INTO Edificio
VALUES
	('X', 1, 1),
	('T', 1, 1),
	('U', 1, 1)

INSERT INTO Aula
VALUES
	('001', 1, 1),
	('002', 1, 1),
	('003', 1, 1),
	('004', 1, 1),
	('005', 1, 1),
	('006', 1, 1),
	('007', 1, 1),
	('008', 1, 1),
	('009', 1, 1),
	('010', 1, 1),
	('011', 1, 1),
	('012', 1, 1),
	('013', 1, 1),
	('014', 1, 1),
	('015', 1, 1),
	('016', 1, 1)

INSERT INTO Materia
VALUES
	('I7038', 'Inteligencia Artificial I', 1),
	('I7039', 'Seminario de Inteligencia Artificial I', 1),
	('I7040', 'Inteligencia Artificial II', 1),
	('I7041', 'Seminario de Inteligencia Artificial II', 1),
	('I7035', 'Sistemas Concurrentes y Distribuidos', 1),
	('I7033', 'Sistemas Operativos de Red', 1),
	('I7034', 'Seminario de Sistemas Operativos de Red', 1)

INSERT INTO Calendario
VALUES
	('2018-A', '20180116', '20180525'),
	('2017-A', '20170116', '20170525')

INSERT INTO Seccion
SELECT
	NRC = ROW_NUMBER() OVER(PARTITION BY(M.Materia) ORDER BY M.Materia),
	P.Codigo,
	M.ID,
	Seccion = 'D0' + CAST(ROW_NUMBER() OVER(PARTITION BY(M.Materia) ORDER BY M.Materia) AS VARCHAR),
	A.ID,
	Calendario = 3,
	Activo = 1

FROM Profesor P
JOIN Materia M ON M.ID = M.ID
JOIN Aula A ON A.ID < 3

