USE [master]
GO
/****** Object:  Database [virtualWallet]    Script Date: 18-Nov-20 9:45:33 PM ******/
CREATE DATABASE [virtualWallet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'virtual_wallet', FILENAME = N'c:\dzsqls\virtualWallet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'virtual_wallet_log', FILENAME = N'c:\dzsqls\virtualWallet.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [virtualWallet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [virtualWallet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [virtualWallet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [virtualWallet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [virtualWallet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [virtualWallet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [virtualWallet] SET ARITHABORT OFF 
GO
ALTER DATABASE [virtualWallet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [virtualWallet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [virtualWallet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [virtualWallet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [virtualWallet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [virtualWallet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [virtualWallet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [virtualWallet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [virtualWallet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [virtualWallet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [virtualWallet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [virtualWallet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [virtualWallet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [virtualWallet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [virtualWallet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [virtualWallet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [virtualWallet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [virtualWallet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [virtualWallet] SET  MULTI_USER 
GO
ALTER DATABASE [virtualWallet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [virtualWallet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [virtualWallet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [virtualWallet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [virtualWallet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [virtualWallet] SET QUERY_STORE = OFF
GO
USE [virtualWallet]
GO
/****** Object:  User [virtualWallet]    Script Date: 18-Nov-20 9:45:37 PM ******/
CREATE USER [virtualWallet] FOR LOGIN [virtualWallet] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [virtualWallet]
GO
/****** Object:  Schema [virtualWallet]    Script Date: 18-Nov-20 9:45:37 PM ******/
CREATE SCHEMA [virtualWallet]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [char](10) NOT NULL,
	[apellido] [char](10) NOT NULL,
	[dni] [int] NOT NULL,
	[dniFotoFrente] [image] NULL,
	[dniFotoReverso] [image] NULL,
	[direccion] [char](15) NOT NULL,
	[nacionalidad] [char](15) NOT NULL,
	[provincia] [char](15) NOT NULL,
	[ciudad] [char](15) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[situacionCrediticia] [char](10) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra.venta.divisas]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra.venta.divisas](
	[idCompraVentaDivisas] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[importe] [numeric](28, 2) NOT NULL,
	[comision] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_compra.venta.divisas] PRIMARY KEY CLUSTERED 
(
	[idCompraVentaDivisas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[criptomonedas]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[criptomonedas](
	[idCriptomoneda] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[comision] [numeric](18, 2) NOT NULL,
	[importe] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_criptomonedas] PRIMARY KEY CLUSTERED 
(
	[idCriptomoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[idCuenta] [bigint] IDENTITY(1,1) NOT NULL,
	[moneda] [char](10) NOT NULL,
	[banco] [char](25) NOT NULL,
	[numeroCuenta] [bigint] NOT NULL,
	[saldo] [numeric](18, 0) NOT NULL,
	[tipoCuenta] [char](10) NOT NULL,
	[estado] [char](10) NOT NULL,
	[idCliente] [bigint] NOT NULL,
 CONSTRAINT [PK_cuentas] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_cuentas] UNIQUE NONCLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[extracciones]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[extracciones](
	[idExtraccionDeposito] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[importe] [numeric](18, 2) NOT NULL,
	[consulta] [char](25) NULL,
 CONSTRAINT [PK_extracciones.depositos] PRIMARY KEY CLUSTERED 
(
	[idExtraccionDeposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fci]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fci](
	[idFci] [bigint] IDENTITY(1,1) NOT NULL,
	[rescatar] [numeric](28, 0) NULL,
	[transferir] [numeric](28, 0) NULL,
	[suscribir] [char](25) NULL,
	[importe] [numeric](28, 0) NOT NULL,
	[idInversion] [bigint] NOT NULL,
	[comision] [numeric](28, 2) NOT NULL,
 CONSTRAINT [PK_fci] PRIMARY KEY CLUSTERED 
(
	[idFci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inversiones]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inversiones](
	[idInversion] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
 CONSTRAINT [PK_inversiones] PRIMARY KEY CLUSTERED 
(
	[idInversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[idOperacion] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[tipoOperacion] [char](25) NOT NULL,
	[idCuentaDestino] [bigint] NULL,
	[idCuenta] [bigint] NOT NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[idOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago.servicios]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago.servicios](
	[idPagoServicios] [bigint] IDENTITY(1,1) NOT NULL,
	[empresa] [char](25) NULL,
	[rubro] [char](10) NULL,
	[idOperacion] [bigint] NULL,
	[importe] [numeric](28, 0) NULL,
	[vencimiento] [datetime] NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[idPagoServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plazo.fijo]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plazo.fijo](
	[idPlazoFijo] [bigint] IDENTITY(1,1) NOT NULL,
	[idInversion] [bigint] NOT NULL,
	[tasa] [numeric](18, 2) NOT NULL,
	[montoMinimo] [numeric](28, 0) NOT NULL,
	[plazoMinimo] [char](25) NOT NULL,
 CONSTRAINT [PK_plazo.fijo] PRIMARY KEY CLUSTERED 
(
	[idPlazoFijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transferencias]    Script Date: 18-Nov-20 9:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transferencias](
	[idTransferencia] [bigint] IDENTITY(1,1) NOT NULL,
	[idOperacion] [bigint] NOT NULL,
	[tipo] [char](25) NOT NULL,
	[importe] [numeric](18, 2) NOT NULL,
	[plazoAcreditacion] [datetime] NOT NULL,
	[concepto] [char](25) NOT NULL,
 CONSTRAINT [PK_transferencias] PRIMARY KEY CLUSTERED 
(
	[idTransferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra.venta.divisas]  WITH CHECK ADD  CONSTRAINT [FK_compra.venta.divisas_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[compra.venta.divisas] CHECK CONSTRAINT [FK_compra.venta.divisas_operaciones]
GO
ALTER TABLE [dbo].[criptomonedas]  WITH CHECK ADD  CONSTRAINT [FK_criptomonedas_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[criptomonedas] CHECK CONSTRAINT [FK_criptomonedas_operaciones]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_clientes]
GO
ALTER TABLE [dbo].[extracciones]  WITH CHECK ADD  CONSTRAINT [FK_extracciones.depositos_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[extracciones] CHECK CONSTRAINT [FK_extracciones.depositos_operaciones]
GO
ALTER TABLE [dbo].[fci]  WITH CHECK ADD  CONSTRAINT [FK_fci_inversiones] FOREIGN KEY([idInversion])
REFERENCES [dbo].[inversiones] ([idInversion])
GO
ALTER TABLE [dbo].[fci] CHECK CONSTRAINT [FK_fci_inversiones]
GO
ALTER TABLE [dbo].[inversiones]  WITH CHECK ADD  CONSTRAINT [FK_inversiones_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[inversiones] CHECK CONSTRAINT [FK_inversiones_operaciones]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_cuentas] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[cuentas] ([idCuenta])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_cuentas]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_cuentas1] FOREIGN KEY([idCuentaDestino])
REFERENCES [dbo].[cuentas] ([idCuenta])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_cuentas1]
GO
ALTER TABLE [dbo].[pago.servicios]  WITH CHECK ADD  CONSTRAINT [FK_pago.servicios_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[pago.servicios] CHECK CONSTRAINT [FK_pago.servicios_operaciones]
GO
ALTER TABLE [dbo].[plazo.fijo]  WITH CHECK ADD  CONSTRAINT [FK_plazo.fijo_inversiones] FOREIGN KEY([idInversion])
REFERENCES [dbo].[inversiones] ([idInversion])
GO
ALTER TABLE [dbo].[plazo.fijo] CHECK CONSTRAINT [FK_plazo.fijo_inversiones]
GO
ALTER TABLE [dbo].[transferencias]  WITH CHECK ADD  CONSTRAINT [FK_transferencias_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([idOperacion])
GO
ALTER TABLE [dbo].[transferencias] CHECK CONSTRAINT [FK_transferencias_operaciones]
GO
USE [master]
GO
ALTER DATABASE [virtualWallet] SET  READ_WRITE 
GO
