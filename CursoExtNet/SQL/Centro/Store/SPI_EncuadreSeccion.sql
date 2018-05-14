/*
*	Created by: Carlos Orozco
*	Creation Date: 08/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Agregar Encuadre de Seccióm
*	Example: EXEC SPI_EncuadreSeccion
*/

CREATE PROCEDURE SPI_EncuadreSeccion
	@Seccion	INT,
	@Tipo		INT,
	@Porcentaje	INT
AS
BEGIN TRY
	BEGIN TRAN

	DECLARE @Total INT

	--Valida Criterio Repetido
	IF EXISTS(
				SELECT *
				FROM Encuadre
				WHERE
					Seccion = @Seccion 
					AND Tipo = @Tipo
			 )
	BEGIN
		COMMIT
		SELECT 'Este Criterio ya se Asigno a la Sección'
		RETURN
	END
	
	SELECT @Total = SUM(Porcentaje)
	FROM Encuadre
	WHERE Seccion = @Seccion

	--Valida Suma Mayor a 100
	IF ISNULL(@Total, 0) + @Porcentaje > 100
	BEGIN
		COMMIT
		SELECT 'La Suma de Criterios es Mayor a 100'
		RETURN
	END

	INSERT INTO Encuadre
	SELECT
		Seccion = @Seccion,
		Tipo = @Tipo,
		Porcentaje = @Porcentaje

	COMMIT

	SELECT ''
END TRY
BEGIN CATCH
	ROLLBACK

	SELECT ERROR_MESSAGE()
END CATCH