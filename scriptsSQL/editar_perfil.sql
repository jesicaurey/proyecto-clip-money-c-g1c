
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[editar_perfil]
@IdCliente int,
@Direccion char(15),
@Telefono int,
@Email char(50),
@Ciudad char(15),
@Provincia char(15)
AS
BEGIN
UPDATE clientes	
   SET 
	direccion= @Direccion,
	telefono= @Telefono,
	email= @Email,
	ciudad= @Ciudad,
	provincia= @Provincia
   
WHERE  IdCliente=@idCliente
END
