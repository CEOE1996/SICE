INSERT INTO Permisos
SELECT
	Tipo = 1,
	Menu,
	Alta = GETDATE(),
	Modifica = GETDATE(),
	Usuario = 123
FROM Menus
SELECT
	Tipo = 2,
	Menu,
	Alta = GETDATE(),
	Modifica = GETDATE(),
	Usuario = 123
FROM Menus
WHERE
	Menu = 1
	OR Padre = 1

UNION

SELECT
	Tipo = 3,
	Menu,
	Alta = GETDATE(),
	Modifica = GETDATE(),
	Usuario = 123
FROM Menus
WHERE
	Menu = 2
	OR Padre = 2

UNION

SELECT
	Tipo = 4,
	Menu,
	Alta = GETDATE(),
	Modifica = GETDATE(),
	Usuario = 123
FROM Menus
WHERE
	Menu = 3
	OR Padre = 3

UNION

SELECT
	Tipo = 5,
	Menu,
	Alta = GETDATE(),
	Modifica = GETDATE(),
	Usuario = 123
FROM Menus
WHERE
	Menu = 4
	OR Padre = 4

UNION

SELECT
	Tipo = 1,
	Menu,
	Alta = GETDATE(),
	Modifica = GETDATE(),
	Usuario = 123
FROM Menus