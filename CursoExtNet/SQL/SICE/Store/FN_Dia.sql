/*
*	Created by: Carlos Orozco
*	Creation Date: 06/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Obten Día
*	Example: 
		SELECT dbo.FN_Dia()
*/

CREATE FUNCTION FN_Dia (
	@Dia INT	
)
RETURNS VARCHAR(50)
AS BEGIN
	RETURN CASE @Dia
			 WHEN 1 THEN 'Lunes'
			 WHEN 2 THEN 'Martes'
			 WHEN 3 THEN 'Miercoles'
			 WHEN 4 THEN 'Jueves'
			 WHEN 5 THEN 'Viernes'
			 WHEN 6 THEN 'Sabado'
			 WHEN 7 THEN 'Domingo'
			 ELSE ''
		   END
END