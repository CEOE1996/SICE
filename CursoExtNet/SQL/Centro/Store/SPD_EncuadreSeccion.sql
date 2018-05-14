/*
*	Created by: Carlos Orozco
*	Creation Date: 08/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Eliminar Encuadre Sección
*	Example: EXEC SPD_EncuadreSeccion
*/

CREATE PROCEDURE SPD_EncuadreSeccion
	@ID INT
AS
BEGIN TRY
	BEGIN TRAN

	DELETE Encuadre
	WHERE ID = @ID

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK

	SELECT ERROR_MESSAGE()
END CATCH