/*
*	Created by: Carlos Orozco
*	Creation Date: 07/05/2017
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Cargar Menus
*	Example: EXEC SPQ_CargaMenu 211413021
*/

ALTER PROCEDURE SPQ_CargaMenu
	@Codigo INT  
AS  BEGIN
	IF EXISTS(
				SELECT *
				FROM Alumno
				WHERE Codigo = @Codigo
			 )
	BEGIN
		SELECT 
			m.menu, 
			desc_menu = m.descripcion, 
			m.direccion, 
			m.padre  
		FROM permisos p 
		JOIN menus m ON p.menu = m.menu 
					and m.inactivo = 0  
		WHERE p.Tipo = 2 --Alumno
	END
	ELSE
	BEGIN
		SELECT DISTINCT
			m.menu, 
			desc_menu = m.descripcion, 
			m.direccion, 
			m.padre  
		FROM permisos p 
		JOIN menus m ON p.menu = m.menu 
					and m.inactivo = 0  
		JOIN ProfesorTipo PT ON PT.Tipo = p.Tipo
		WHERE PT.Profesor = @Codigo
	END
END