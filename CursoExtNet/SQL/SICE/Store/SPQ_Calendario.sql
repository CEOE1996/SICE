/*
*	Created by: Carlos Orozco
*	Creation Date: 06/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Consulta Calendarios
*	Example: EXEC SPQ_Calendario
*/

CREATE PROCEDURE SPQ_Calendario
	
AS
BEGIN
	SELECT
		ID,
		Calendario,
		Inicio,
		Fin
	FROM Calendario
	ORDER BY Inicio
END