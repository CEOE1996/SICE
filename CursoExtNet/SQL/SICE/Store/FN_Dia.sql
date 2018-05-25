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
			 WHEN 1 THEN 'Domingo'
			 WHEN 2 THEN 'Lunes'
			 WHEN 3 THEN 'Martes'
			 WHEN 4 THEN 'Miercoles'
			 WHEN 5 THEN 'Jueves'
			 WHEN 6 THEN 'Viernes'
			 WHEN 7 THEN 'Sabado'
			 ELSE ''
		   END
END