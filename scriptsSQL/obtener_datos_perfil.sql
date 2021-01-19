
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure  [dbo].[obtener_datos_perfil] 

@id int

AS
BEGIN
SELECT [direccion]
      ,[telefono]
      ,[email]
      ,[ciudad]
      ,[provincia]
  FROM [dbo].[clientes]
  where idCliente=@id
 END
