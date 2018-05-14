/*
*	Created by: Carlos Orozco
*	Creation Date: 08/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Mostrar Listado de TipoCalificación
*	Example: EXEC SPQ_TipoCalificacion
*/

CREATE PROCEDURE SPQ_TipoCalificacion
	
AS
BEGIN
	SELECT 
		ID,
		Tipo = Descripcion
	FROM TipoCalificacion
END