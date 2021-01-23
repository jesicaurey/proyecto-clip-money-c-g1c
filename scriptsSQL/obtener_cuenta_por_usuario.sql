
/****** Object:  StoredProcedure [dbo].[obtener_cuenta_por_usuario]    Script Date: 22-Jan-21 11:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_cuenta_por_usuario]
	
	@usuario char (10)
	
AS
BEGIN
	
	SELECT TOP 1 cta.* from cuentas cta inner join clientes cli on cta.idCliente=cli.idCliente
	WHERE cli.usuario=@usuario

END