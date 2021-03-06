USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[top10operaciones]    Script Date: 22/01/2021 12:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure  [dbo].[top10operaciones]
	@Usuario char(10)
AS
BEGIN
SELECT TOP (10) [idOperacion]
      ,[fechaHora]
      ,[tipoOperacion]
	  ,[monto]
  FROM [dbo].[operaciones] op
  inner join cuentas cta on op.idCuenta=cta.idCuenta
  inner join clientes cli on cta.idCliente=cli.idCliente
  WHERE cli.usuario = @Usuario
  order by fechaHora desc

 END