/*
*	Created by: Carlos Orozco
*	Creation Date: 13/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Eliminar Actividad
*	Example: EXEC SPD_ActividadSeccion
*/

CREATE PROCEDURE SPD_ActividadSeccion
	@ID	INT
AS
BEGIN TRY
	BEGIN TRAN
	
	IF EXISTS(
				SELECT *
				FROM AlumnoCalificacion
				WHERE CalificacionID = @ID
			 )
	BEGIN
		COMMIT
		SELECT 'No es Posible Eliminar esta Actividad Puesto que ya se realizaron entregas'
		RETURN
	END

	DELETE Calificacion
	WHERE ID = @ID

	COMMIT

	SELECT ''
END TRY
BEGIN CATCH
	ROLLBACK

	SELECT ERROR_MESSAGE()

END CATCH