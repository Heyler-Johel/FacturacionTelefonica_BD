USE [master]
GO
/****** Object:  Database [FacturacionTelefonica]    Script Date: 14/8/2020 13:16:52 ******/
CREATE DATABASE [FacturacionTelefonica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacturacionTelefonica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FacturacionTelefonica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FacturacionTelefonica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FacturacionTelefonica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FacturacionTelefonica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FacturacionTelefonica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FacturacionTelefonica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET ARITHABORT OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FacturacionTelefonica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FacturacionTelefonica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FacturacionTelefonica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FacturacionTelefonica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET RECOVERY FULL 
GO
ALTER DATABASE [FacturacionTelefonica] SET  MULTI_USER 
GO
ALTER DATABASE [FacturacionTelefonica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FacturacionTelefonica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FacturacionTelefonica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FacturacionTelefonica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FacturacionTelefonica] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FacturacionTelefonica', N'ON'
GO
ALTER DATABASE [FacturacionTelefonica] SET QUERY_STORE = OFF
GO
USE [FacturacionTelefonica]
GO
/****** Object:  UserDefinedTableType [dbo].[LlamadasTelefonicasType]    Script Date: 14/8/2020 13:16:52 ******/
CREATE TYPE [dbo].[LlamadasTelefonicasType] AS TABLE(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroDe] [varchar](100) NULL,
	[NumeroA] [varchar](100) NULL,
	[HoraInicio] [time](0) NULL,
	[HoraFin] [time](0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UsoDatosType]    Script Date: 14/8/2020 13:16:52 ******/
CREATE TYPE [dbo].[UsoDatosType] AS TABLE(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](100) NULL,
	[CantMegas] [float] NULL
)
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Identificacion] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdTipoTarifa] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[NumTelefono] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContratoExterno]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContratoExterno](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpresaExterna] [int] NOT NULL,
	[FechaContrato] [date] NOT NULL,
 CONSTRAINT [PK_ContratoExterno] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[ID] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdElementoTarifa] [int] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DineroFijo]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DineroFijo](
	[ID] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_DineroFijo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElementoDeTipoTarifa]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElementoDeTipoTarifa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTarifa] [int] NOT NULL,
	[IdTipoElemento] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_ElementoDeTipoTarifa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpresaExterna]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpresaExterna](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EmpresaExterna] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdContrato] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[SaldoUsoMega] [money] NOT NULL,
	[SaldoMinutos110] [money] NOT NULL,
	[SaldoMinutos800] [money] NOT NULL,
	[SaldoMinutos900] [money] NOT NULL,
	[MontoTotalAPagar] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaPago] [date] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaExterna]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaExterna](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdContratoExterno] [int] NOT NULL,
	[SaldoMinutos800] [money] NOT NULL,
	[SaldoMinutos900] [money] NOT NULL,
	[SaldoMinutos110] [money] NOT NULL,
 CONSTRAINT [PK_FacturaExterna] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MegasFijo]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasFijo](
	[ID] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_MegasFijo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MinutosFijo]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinutosFijo](
	[ID] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_MinutosFijo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mov800Externo]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mov800Externo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFacturaExterna] [int] NOT NULL,
 CONSTRAINT [PK_Mov800Externo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mov900Externo]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mov900Externo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFacturaExterna] [int] NOT NULL,
 CONSTRAINT [PK_Mov900Externo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovMinutos]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovMinutos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdTipoMov] [int] NOT NULL,
	[TelefonoLlamado] [int] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Qminutos] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovMinutos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovMinutos110]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovMinutos110](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdTipoMov] [int] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Qminutos] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovMinutos110] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovMinutos800]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovMinutos800](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdTipoMov] [int] NOT NULL,
	[TelefonoLlamado] [int] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Qminutos] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovMinutos800] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovMinutos900]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovMinutos900](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdTipoMov] [int] NOT NULL,
	[TelefonoLlamado] [int] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Qminutos] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovMinutos900] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovPersonalExterno]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovPersonalExterno](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFacturaExterna] [int] NOT NULL,
 CONSTRAINT [PK_MovPersonalExterno] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovUsoMega]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovUsoMega](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdTipoMov] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovUsoMega] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PorcentajeDinero]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PorcentajeDinero](
	[ID] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_PorcentajeDinero] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelacionFamiliar]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelacionFamiliar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdFamiliar] [int] NOT NULL,
	[idTipoRelacion] [int] NOT NULL,
 CONSTRAINT [PK_RelacionFamiliar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoElemento]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoElemento](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[TipoValor] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ElementoTipoTarifa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIpoMovimiento]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIpoMovimiento](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TIpoMovimiento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoRelacion]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoRelacion](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoRelacion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTarifa]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTarifa](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoTarifa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Cliente]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_TipoTarifa] FOREIGN KEY([IdTipoTarifa])
REFERENCES [dbo].[TipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_TipoTarifa]
GO
ALTER TABLE [dbo].[ContratoExterno]  WITH CHECK ADD  CONSTRAINT [FK_ContratoExterno_EmpresaExterna] FOREIGN KEY([IdEmpresaExterna])
REFERENCES [dbo].[EmpresaExterna] ([ID])
GO
ALTER TABLE [dbo].[ContratoExterno] CHECK CONSTRAINT [FK_ContratoExterno_EmpresaExterna]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_ElementoDeTipoTarifa] FOREIGN KEY([IdElementoTarifa])
REFERENCES [dbo].[ElementoDeTipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_ElementoDeTipoTarifa]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Factura]
GO
ALTER TABLE [dbo].[DineroFijo]  WITH CHECK ADD  CONSTRAINT [FK_DineroFijo_ElementoDeTipoTarifa] FOREIGN KEY([ID])
REFERENCES [dbo].[ElementoDeTipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[DineroFijo] CHECK CONSTRAINT [FK_DineroFijo_ElementoDeTipoTarifa]
GO
ALTER TABLE [dbo].[ElementoDeTipoTarifa]  WITH CHECK ADD  CONSTRAINT [FK_ElementoDeTipoTarifa_TipoElemento] FOREIGN KEY([IdTipoElemento])
REFERENCES [dbo].[TipoElemento] ([ID])
GO
ALTER TABLE [dbo].[ElementoDeTipoTarifa] CHECK CONSTRAINT [FK_ElementoDeTipoTarifa_TipoElemento]
GO
ALTER TABLE [dbo].[ElementoDeTipoTarifa]  WITH CHECK ADD  CONSTRAINT [FK_ElementoDeTipoTarifa_TipoTarifa] FOREIGN KEY([IdTipoTarifa])
REFERENCES [dbo].[TipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[ElementoDeTipoTarifa] CHECK CONSTRAINT [FK_ElementoDeTipoTarifa_TipoTarifa]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Contrato] FOREIGN KEY([IdContrato])
REFERENCES [dbo].[Contrato] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Contrato]
GO
ALTER TABLE [dbo].[FacturaExterna]  WITH CHECK ADD  CONSTRAINT [FK_FacturaExterna_ContratoExterno] FOREIGN KEY([IdContratoExterno])
REFERENCES [dbo].[ContratoExterno] ([ID])
GO
ALTER TABLE [dbo].[FacturaExterna] CHECK CONSTRAINT [FK_FacturaExterna_ContratoExterno]
GO
ALTER TABLE [dbo].[MegasFijo]  WITH CHECK ADD  CONSTRAINT [FK_MegasFijo_ElementoDeTipoTarifa] FOREIGN KEY([ID])
REFERENCES [dbo].[ElementoDeTipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[MegasFijo] CHECK CONSTRAINT [FK_MegasFijo_ElementoDeTipoTarifa]
GO
ALTER TABLE [dbo].[MinutosFijo]  WITH CHECK ADD  CONSTRAINT [FK_MinutosFijo_ElementoDeTipoTarifa] FOREIGN KEY([ID])
REFERENCES [dbo].[ElementoDeTipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[MinutosFijo] CHECK CONSTRAINT [FK_MinutosFijo_ElementoDeTipoTarifa]
GO
ALTER TABLE [dbo].[Mov800Externo]  WITH CHECK ADD  CONSTRAINT [FK_Mov800Externo_FacturaExterna] FOREIGN KEY([IdFacturaExterna])
REFERENCES [dbo].[FacturaExterna] ([ID])
GO
ALTER TABLE [dbo].[Mov800Externo] CHECK CONSTRAINT [FK_Mov800Externo_FacturaExterna]
GO
ALTER TABLE [dbo].[Mov900Externo]  WITH CHECK ADD  CONSTRAINT [FK_Mov900Externo_FacturaExterna] FOREIGN KEY([IdFacturaExterna])
REFERENCES [dbo].[FacturaExterna] ([ID])
GO
ALTER TABLE [dbo].[Mov900Externo] CHECK CONSTRAINT [FK_Mov900Externo_FacturaExterna]
GO
ALTER TABLE [dbo].[MovMinutos]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos] CHECK CONSTRAINT [FK_MovMinutos_Factura]
GO
ALTER TABLE [dbo].[MovMinutos]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos_TIpoMovimiento] FOREIGN KEY([IdTipoMov])
REFERENCES [dbo].[TIpoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos] CHECK CONSTRAINT [FK_MovMinutos_TIpoMovimiento]
GO
ALTER TABLE [dbo].[MovMinutos110]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos110_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos110] CHECK CONSTRAINT [FK_MovMinutos110_Factura]
GO
ALTER TABLE [dbo].[MovMinutos110]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos110_TIpoMovimiento] FOREIGN KEY([IdTipoMov])
REFERENCES [dbo].[TIpoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos110] CHECK CONSTRAINT [FK_MovMinutos110_TIpoMovimiento]
GO
ALTER TABLE [dbo].[MovMinutos800]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos800_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos800] CHECK CONSTRAINT [FK_MovMinutos800_Factura]
GO
ALTER TABLE [dbo].[MovMinutos800]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos800_TIpoMovimiento] FOREIGN KEY([IdTipoMov])
REFERENCES [dbo].[TIpoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos800] CHECK CONSTRAINT [FK_MovMinutos800_TIpoMovimiento]
GO
ALTER TABLE [dbo].[MovMinutos900]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos900_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos900] CHECK CONSTRAINT [FK_MovMinutos900_Factura]
GO
ALTER TABLE [dbo].[MovMinutos900]  WITH CHECK ADD  CONSTRAINT [FK_MovMinutos900_TIpoMovimiento] FOREIGN KEY([IdTipoMov])
REFERENCES [dbo].[TIpoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovMinutos900] CHECK CONSTRAINT [FK_MovMinutos900_TIpoMovimiento]
GO
ALTER TABLE [dbo].[MovPersonalExterno]  WITH CHECK ADD  CONSTRAINT [FK_MovPersonalExterno_FacturaExterna] FOREIGN KEY([IdFacturaExterna])
REFERENCES [dbo].[FacturaExterna] ([ID])
GO
ALTER TABLE [dbo].[MovPersonalExterno] CHECK CONSTRAINT [FK_MovPersonalExterno_FacturaExterna]
GO
ALTER TABLE [dbo].[MovUsoMega]  WITH CHECK ADD  CONSTRAINT [FK_MovUsoMega_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[MovUsoMega] CHECK CONSTRAINT [FK_MovUsoMega_Factura]
GO
ALTER TABLE [dbo].[MovUsoMega]  WITH CHECK ADD  CONSTRAINT [FK_MovUsoMega_TIpoMovimiento] FOREIGN KEY([IdTipoMov])
REFERENCES [dbo].[TIpoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovUsoMega] CHECK CONSTRAINT [FK_MovUsoMega_TIpoMovimiento]
GO
ALTER TABLE [dbo].[PorcentajeDinero]  WITH CHECK ADD  CONSTRAINT [FK_PorcentajeDinero_ElementoDeTipoTarifa] FOREIGN KEY([ID])
REFERENCES [dbo].[ElementoDeTipoTarifa] ([ID])
GO
ALTER TABLE [dbo].[PorcentajeDinero] CHECK CONSTRAINT [FK_PorcentajeDinero_ElementoDeTipoTarifa]
GO
ALTER TABLE [dbo].[RelacionFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_RelacionFamiliar_Cliente1] FOREIGN KEY([IdFamiliar])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[RelacionFamiliar] CHECK CONSTRAINT [FK_RelacionFamiliar_Cliente1]
GO
ALTER TABLE [dbo].[RelacionFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_RelacionFamiliar_TipoRelacion] FOREIGN KEY([idTipoRelacion])
REFERENCES [dbo].[TipoRelacion] ([ID])
GO
ALTER TABLE [dbo].[RelacionFamiliar] CHECK CONSTRAINT [FK_RelacionFamiliar_TipoRelacion]
GO
/****** Object:  StoredProcedure [dbo].[IniciarSimulacion]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[IniciarSimulacion]
AS
BEGIN
	EXEC ReiniciarTablas
	EXEC spCargarConfiguracionTarifas
	EXEC SimulacionOperacionesDiarias
END
GO
/****** Object:  StoredProcedure [dbo].[ReiniciarTablas]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kevin Fallas, Johel Mora>
-- Create date: <13/8/2020>
-- Description:	<Reinicio de las tablas>
-- =============================================
CREATE   PROCEDURE [dbo].[ReiniciarTablas]
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [FacturacionTelefonica].[dbo].[ElementoDeTipoTarifa]

	DELETE FROM [FacturacionTelefonica].[dbo].[TipoRelacion]

	DELETE FROM [FacturacionTelefonica].[dbo].[TipoElemento]
	
	DELETE FROM [FacturacionTelefonica].[dbo].[Contrato]
		DBCC CHECKIDENT ('[Contrato]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionTelefonica].[dbo].[Cliente]
		DBCC CHECKIDENT ('[Cliente]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionTelefonica].[dbo].[TipoTarifa]
END
GO
/****** Object:  StoredProcedure [dbo].[SimulacionOperacionesDiarias]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SimulacionOperacionesDiarias]
AS

BEGIN
	SET NOCOUNT ON 

	/*
	
	DECLARE @Table TABLE
	(
		
	)
	
	*/
	--Tablas definidas
	DECLARE @LlamadasTelefonicas LlamadasTelefonicasType
	DECLARE @UsoDatos UsoDatosType

	-- se extraen fechas operación
	DECLARE @FechaOperacion DATE

	DECLARE @FechasAProcesar TABLE 
	(
	   sec INT IDENTITY(1,1) PRIMARY KEY, 
	   fecha DATE
	);

	-- Variables para leer xml
	DECLARE @DocumentoXML xml

	--Obtenemos informacion del XML
	SELECT @DocumentoXML = DXML
	--FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionTelefonica_BD\Base de Datos\XML\Operaciones.xml', Single_BLOB) AS DocumentoXML(DXML)
	FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionTelefonica_BD\Base de Datos\XML\Operaciones.xml', Single_BLOB) AS DocumentoXML(DXML)

	BEGIN TRY
		INSERT @FechasAProcesar (fecha)
		SELECT f.value('@fecha', 'DATE')
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia') AS t(f);
	END TRY
	BEGIN CATCH
		PRINT 'Hubo un error de cargar fechas'
		RETURN @@ERROR * -1;
	END CATCH;

	-- Variables para controlar la iteración
	DECLARE @Lo1 INT, 
			@Hi1 INT, 
			@Lo2 INT, 
			@Hi2 INT;

	DECLARE @minfecha DATE, 
			@maxfecha DATE;

	-- iterando de la fecha más antigua a la menos antigua
	SELECT @minfecha = MIN(F.fecha), @maxfecha = MAX(F.fecha)  
	FROM @FechasAProcesar F;

	SELECT @Lo1 = F.sec
	FROM @FechasAProcesar F
	WHERE F.Fecha = @minfecha;

	SELECT @Hi1 = F.sec
	FROM @FechasAProcesar F
	WHERE F.Fecha=@maxfecha;
	
	--iteramos por fecha para simular operaciones diarias
	WHILE @Lo1<=@Hi1
	BEGIN
		
		--Para poder filtrar los clientes de un solo día
		SELECT @FechaOperacion = F.Fecha 
		FROM @FechasAProcesar F 
		WHERE sec = @Lo1;
		
		--Insertamos los clientes del dia en que se esta iterando
		INSERT INTO [dbo].[Cliente](Nombre, Identificacion)
		SELECT  c.value('@Nombre', 'VARCHAR(100)')
			  , c.value('@Identificacion', 'INT')
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/ClienteNuevo') AS t(c);
		
		--Insertamos los contratos hechos en un día
		INSERT INTO [dbo].[Contrato](IdCliente, IdTipoTarifa, Fecha, NumTelefono)
		SELECT  C.ID
			  , ct.value('@TipoTarifa', 'INT')
			  , @FechaOperacion AS Fecha
			  , ct.value('@Numero', 'VARCHAR(100)')
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/NuevoContrato') AS t(ct)
		INNER JOIN Cliente C ON C.Identificacion = t.ct.value('@Identificacion','INT')

		--Insertamos relaciones familiares
		INSERT INTO [dbo].[RelacionFamiliar](IdCliente, IdFamiliar, idTipoRelacion)
		SELECT	CD.ID
			  , CA.ID
			  , r.value('@TipoRelacion', 'INT')
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/RelacionFamiliar') AS t(r)
		INNER JOIN Cliente CD ON CD.Identificacion = t.r.value('@IdentificacionDe','INT')
		INNER JOIN Cliente CA ON CA.Identificacion = t.r.value('@IdentificacionA', 'INT');

		--Guardamos todas las llamadas en una tabla definida, para luego ser procesadas
		DELETE @LlamadasTelefonicas
		INSERT INTO @LlamadasTelefonicas(NumeroDe, NumeroA, HoraInicio, HoraFin)
		SELECT lt.value('@NumeroDe','VARCHAR(100)')
			 , lt.value('@NumeroA', 'VARCHAR(100)')
			 , lt.value('@Inicio', 'TIME')
			 , lt.value('@Fin', 'TIME')
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/LlamadaTelefonica') AS t(lt);
		--TODO: hacer sp para procesar llamadas

		--Guardamos los consumos de megas
		DELETE @UsoDatos
		INSERT INTO @UsoDatos(Numero, CantMegas)
		SELECT	ud.value('@Numero','VARCHAR(100)')
		      , ud.value('@CantMegas', 'FLOAT') 
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/UsoDatos') AS t(ud);
		--sp para procesar el consumo de megas

		SET @Lo1 = @Lo1 + 1;
		
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[spCargarConfiguracionTarifas]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spCargarConfiguracionTarifas]
AS
BEGIN
	SET NOCOUNT ON;                                                                                                                                                                                                                                                                                             

	-- VARIABLES --
	DECLARE @Configuracion XML

	BEGIN TRY
		

		--Insercion de los tipos de CCobro
		SELECT @Configuracion = Cf
		--FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionTelefonica_BD\Base de Datos\XML\configuracionTarifas.xml', Single_BLOB) 
		FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionTelefonica_BD\Base de Datos\XML\configuracionTarifas.xml', Single_BLOB) 

		AS Configuracion(Cf);

		--Insertamos el tipo de relacion familiar
		INSERT INTO [dbo].[TipoRelacion](ID, Nombre)
		SELECT	cf.value('@ID', 'INT')
				,	cf.value('@Nombre', 'VARCHAR(100)')
		FROM @Configuracion.nodes('/configTarifas/TipoRelacionFamiliar') AS t(cf);
		

		INSERT INTO [dbo].[TipoTarifa](ID, Nombre)
		SELECT	tt.value('@ID','INT')
				,	tt.value('@Nombre', 'VARCHAR(100)')

		FROM @Configuracion.nodes('/configTarifas/TipoTarifa') AS t(tt);

		INSERT INTO [dbo].[TipoElemento](ID, Nombre, TipoValor)
		SELECT	te.value('@ID', 'INT')
				,	te.value('@Nombre', 'VARCHAR(100)')
				, te.value('@TipoValor', 'VARCHAR(100)')
		FROM @Configuracion.nodes('/configTarifas/TipoElemento') AS t(te);

		INSERT INTO [dbo].[ElementoDeTipoTarifa](IdTipoTarifa, IdTipoElemento, Valor)
		SELECT et.value('@IDTipoTarifa', 'INT')
				, et.value('@IDTipoElemento', 'INT')
				, et.value('@Valor', 'MONEY')
		FROM @Configuracion.nodes('/configTarifas/ElementoDeTipoTarifa') AS t(et);

		RETURN 1
		
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerFacturas]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kevin Fallas y Johel Mora
-- Create date: 13/08/2020
-- Description:	SP para obtener facturas de un número teléfonico
-- =============================================
CREATE   PROCEDURE [dbo].[spObtenerFacturas]
@Tel int, @Estado bit
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT F.ID, F.Fecha FROM Factura AS F
		INNER JOIN Contrato AS C ON C.ID = F.IdContrato
		WHERE @Tel = C.NumTelefono AND @Estado = F.Estado
	END TRY
	BEGIN CATCH
		THROW 60000,'Error: No se ha podido buscar Facturas',1;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[spVerFactura]    Script Date: 14/8/2020 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spVerFactura]
@ID int
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT ID, Fecha, FechaPago, SaldoUsoMega, SaldoMinutos110, SaldoMinutos800, SaldoMinutos900, MontoTotalAPagar FROM Factura AS F
		WHERE @ID = F.ID
	END TRY
	BEGIN CATCH
		THROW 60000,'Error: No se ha podido buscar Factura',1;
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [FacturacionTelefonica] SET  READ_WRITE 
GO
