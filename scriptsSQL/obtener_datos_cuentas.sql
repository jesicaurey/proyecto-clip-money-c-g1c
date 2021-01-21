USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[obtener_datos_cuentas]    Script Date: 21/01/2021 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[obtener_datos_cuentas]
	
	@Usuario char(10) 
	
AS
BEGIN
	
	SELECT cta.* from cuentas cta inner join clientes cli on cta.idCliente=cli.idCliente

WHERE cli.usuario=@Usuario
END
