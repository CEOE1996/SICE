/*
*	Created by: Carlos Orozco
*	Creation Date: 06/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Listado de Actividades por Sección
*	Example: EXEC SPQ_ActividadSeccion 10
*/

CREATE PROCEDURE SPQ_ActividadSeccion
	@Seccion INT
AS
BEGIN
	SELECT 
		C.ID,
		Tipo = T.Descripcion,
		C.Descripcion,
		C.FechaAlta
	FROM Calificacion C
	JOIN TipoCalificacion T ON T.ID = C.Tipo
	WHERE Seccion = @Seccion
END