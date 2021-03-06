USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[insertar_persona]    Script Date: 22/01/2021 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[insertar_persona]
@Usuario char(10),
@Password char(150),
@Email char(50)
AS
BEGIN
  
INSERT INTO clientes
	(
	   usuario,
	   contraseña,
	   email
    )
values
	(
		@Usuario,
		@Password,
		@Email
	)
	SELECT SCOPE_IDENTITY()
END