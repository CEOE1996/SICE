/*
*	Created by: Carlos Orozco
*	Creation Date: 06/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Consultar Encuadre
*	Example: EXEC SPQ_EncuadreSeccion
*/

CREATE PROCEDURE SPQ_EncuadreSeccion
	@Seccion INT
AS
BEGIN
	SELECT 
		E.ID,
		IDTipo = E.Tipo,
		TipoCalificacion = TC.Descripcion,
		E.Porcentaje
	FROM Encuadre E
	JOIN TipoCalificacion TC ON TC.ID = E.Tipo
	WHERE E.Seccion = @Seccion
END

