USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[agregar_operacion]    Script Date: 21/01/2021 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[agregar_operacion]
@TipoOperacion char(25),
@IdCuenta int,
@Monto numeric (18,0)
AS
BEGIN
DECLARE @FechaHoraActual as datetime
SET @FechaHoraActual = SYSDATETIME()  
INSERT INTO operaciones
	(
	   fechaHora,
	   tipoOperacion,
	   idCuenta,
	   monto
    )
values
	(
		@FechaHoraActual,
		@TipoOperacion,
		@IdCuenta,
		@Monto
	)

END