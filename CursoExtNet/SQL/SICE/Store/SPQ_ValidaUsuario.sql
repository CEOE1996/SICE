/*
*	Created by: Carlos Orozco
*	Creation Date: 05/05/2018
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Validar Usuario
*	Example: EXEC SPQ_ValidaUsuario '123', '1234'
*/

ALTER PROCEDURE SPQ_ValidaUsuario
	@Codigo		VARCHAR(50),
	@Contraseña	VARCHAR(100)
AS
BEGIN
	IF EXISTS(
				SELECT *
				FROM Alumno
				WHERE Codigo = @Codigo
			 )
	BEGIN
		SELECT 
			A.Codigo,
			Nombre = A.Nombre + ' ' + A.ApellidoPaterno + ' ' + A.ApellidoMaterno
		FROM Alumno A
		WHERE
			A.Codigo = @Codigo
			AND A.NIP = @Contraseña
	END
	ELSE
	BEGIN
		SELECT 
			P.Codigo,
			Nombre = P.ApellidoPaterno + ' ' + P.ApellidoMaterno +' ' + P.Nombre 
		FROM Profesor P
		WHERE
			P.Codigo = @Codigo
			AND P.NIP = @Contraseña
	END
END