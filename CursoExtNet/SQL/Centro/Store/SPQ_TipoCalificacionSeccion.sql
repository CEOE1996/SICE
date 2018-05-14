/*
*	Created by: Carlos Orozco
*	Creation Date: 08/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Mostrar Listado de TipoCalificación de Acuerdo a la Sección
*	Example: EXEC SPQ_TipoCalificacionSeccion 10
*/

ALTER PROCEDURE SPQ_TipoCalificacionSeccion
	@Seccion INT
AS
BEGIN
	SELECT
		T.ID,
		Tipo = T.Descripcion
	FROM TipoCalificacion T
	JOIN Encuadre E ON E.Tipo = T.ID
	WHERE E.Seccion = @Seccion
END