/*
*	Created by: Carlos Orozco
*	Creation Date: 07/05/2017
*	Last Modified: 
*	Modified Date: 
*	
*	Description: Listar Usuarios
*	Example: EXEC SPQ_Usuarios
*/

CREATE PROCEDURE SPQ_Usuarios
	@ID INT = NULL
AS
BEGIN
	SELECT 
		U.ID,
		U.Codigo,
		U.Nombre,
		U.Telefono,
		U.Correo,
		IDTipoUsuario = T.ID,
		TipoUsuario = T.Tipo,
		IDEstatus = E.ID,
		E.Estatus
	FROM Usuario U
	JOIN TipoUsuario T ON T.ID = U.TipoUsuario
	LEFT JOIN UsuarioEstatus E ON E.ID = U.Estatus
	WHERE U.ID = ISNULL(@ID, U.ID)

END