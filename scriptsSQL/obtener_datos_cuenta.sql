USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[obtener_datos_cuenta]    Script Date: 21/01/2021 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[obtener_datos_cuenta]
	
	@idCuenta int
	
AS
BEGIN
	
	SELECT cta.* from cuentas cta 

WHERE cta.idCuenta=@idCuenta
END