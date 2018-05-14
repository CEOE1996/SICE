/*
*	Created by: Carlos Orozco
*	Creation Date: 06/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Obtener Calendario Actual
*	Example: EXEC SPQ_CalendarioActual
*/

CREATE PROCEDURE SPQ_CalendarioActual
	
AS
BEGIN
	SELECT
		ID,
		Calendario
	FROM Calendario
	WHERE GETDATE() BETWEEN Inicio AND Fin
END