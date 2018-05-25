/*
*	Created by: Carlos Orozco
*	Creation Date: 13/05/2013
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Agregar Actividades de Sección
*	Example: EXEC SPI_ActividadesSeccion
*/

CREATE PROCEDURE SPI_ActividadesSeccion
	@Seccion		INT,
	@Tipo			INT,
	@Descripcion	VARCHAR(255)
AS
BEGIN TRY
	BEGIN TRAN
	
	IF EXISTS(
				SELECT *
				FROM Calificacion
				WHERE
					Seccion = @Seccion
					AND Tipo = @Tipo
					AND Descripcion = @Descripcion
			 )
	BEGIN
		COMMIT
		SELECT 'Actividad Duplicada'
		RETURN
	END

	INSERT INTO Calificacion(
		Seccion,
		Tipo,
		Descripcion,
		FechaAlta
	)
	SELECT
		Seccion = @Seccion,
		Tipo = @Tipo,
		Descripcion = @Descripcion,
		FechaAlta = GETDATE()

	COMMIT

	SELECT ''
END TRY
BEGIN CATCH

	ROLLBACK

	SELECT ERROR_MESSAGE()

END CATCH

