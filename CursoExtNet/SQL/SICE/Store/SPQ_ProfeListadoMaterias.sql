/*
*	Created by: Carlos Orozco
*	Creation Date: 05/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Consultar Listado de Materias Profesor
*	Example: EXEC SPQ_ProfeListadoMaterias 1
*/

CREATE PROCEDURE SPQ_ProfeListadoMaterias
	@Codigo		VARCHAR(50),
	@Calendario	INT = NULL
AS
BEGIN
	
	IF @Calendario IS NULL
		SELECT @Calendario = ID 
		FROM Calendario
		WHERE GETDATE() BETWEEN Inicio AND Fin

	SELECT 
		S.ID,
		NRC,
		Seccion,
		ClaveMateria = M.Clave,
		M.Materia,
		Aula = C.Acronimo + ' ' + E.Nombre + A.Nombre
	FROM Seccion S
	JOIN Materia M ON M.ID = S.Materia
	JOIN Aula A ON A.ID = S.Aula
	JOIN Edificio E ON E.ID = A.Edificio
	JOIN Centro C ON C.ID = E.Centro
	WHERE
		S.Profesor = @Codigo
		AND S.Activo = 1
		AND S.Calendario = @Calendario
END