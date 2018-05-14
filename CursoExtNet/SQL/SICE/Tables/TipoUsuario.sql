USE SICE
GO

CREATE TABLE TipoUsuario(
	ID				INT PRIMARY KEY IDENTITY,
	Tipo			VARCHAR(255) UNIQUE,
	Usuario			CHAR(20),
	FechaAlta		DATETIME NOT NULL DEFAULT(GETDATE()),
	FechaModifica	DATETIME NOT NULL DEFAULT(GETDATE()),
	Activo			INT NOT NULL DEFAULT(1)
)

INSERT INTO TipoUsuario(
	Tipo,
	Usuario
)
VALUES
	('Administrador', 211413021),
	('Alumno', 211413021),
	('Profesor', 211413021),
	('Coordinador de Carrera', 211413021),
	('Jefe de Departamento', 211413021)
