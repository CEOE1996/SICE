/*
*	Created by: Carlos Orozco
*	Creation Date: 06/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Listado de Alumnos por Sección
*	Example: EXEC SPQ_AlumnoSeccion 10
*/

CREATE PROCEDURE SPQ_AlumnoSeccion
	@Seccion INT	
AS
BEGIN
	SELECT 
		ASe.ID,
		A.Codigo,
		Nombre = A.Nombre + ' ' + A.ApellidoPaterno + ' ' + A.ApellidoMaterno,
		Carrera = C.Carrera + ' - ' + C.Nombre
	FROM AlumnoSeccion ASe
 	JOIN AlumnoCarrera AC ON AC.ID = ASe.AlumnoCarrera
	JOIN Alumno A ON A.Codigo = AC.Alumno
	JOIN Carrera C ON C.ID = AC.Carrera
	WHERE Seccion = @Seccion
END