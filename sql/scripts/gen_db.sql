USE [master]
GO
/****** Object:  Database [municipalidad]    Script Date: 6/26/2020 12:59:17 AM ******/
CREATE DATABASE [municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'municipalidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\municipalidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'municipalidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\municipalidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [municipalidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [municipalidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [municipalidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [municipalidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [municipalidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [municipalidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [municipalidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [municipalidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [municipalidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [municipalidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [municipalidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [municipalidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [municipalidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [municipalidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [municipalidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [municipalidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [municipalidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [municipalidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [municipalidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [municipalidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [municipalidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [municipalidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [municipalidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [municipalidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [municipalidad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [municipalidad] SET  MULTI_USER 
GO
ALTER DATABASE [municipalidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [municipalidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [municipalidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [municipalidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [municipalidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [municipalidad] SET QUERY_STORE = OFF
GO
USE [municipalidad]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoEntidad] [int] NOT NULL,
	[jsonAntes] [varchar](500) NOT NULL,
	[jsonDespues] [varchar](500) NOT NULL,
	[insertedAt] [datetime] NOT NULL,
	[insertedBy] [nvarchar](100) NOT NULL,
	[insertedIn] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_ConsumoAgua]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_ConsumoAgua](
	[id] [int] NOT NULL,
	[ConsumoM3] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CC_ConsumoAgua] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_Fijo]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_Fijo](
	[id] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CC_Fijo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_InteresesMoratorios]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_InteresesMoratorios](
	[id] [int] NOT NULL,
	[monto] [money] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CC_InteresesMoratorios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_Porcentaje]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_Porcentaje](
	[id] [int] NOT NULL,
	[ValorPorcentaje] [float] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CC_Porcentaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCenPropiedad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCenPropiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idConceptoCobro] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CCenPropiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprobanteDePago]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobanteDePago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[MontoTotal] [money] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_ComprobanteDePago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[TasaInteresesMoratorios] [real] NOT NULL,
	[DiaEmisionRecibo] [int] NOT NULL,
	[QDiasVencimiento] [int] NOT NULL,
	[EsRecurrente] [bit] NOT NULL,
	[EsImpuesto] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cortes]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cortes](
	[id] [int] NOT NULL,
	[idReconexion] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Cortes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NOT NULL,
	[Valor] [money] NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[activo] [bit] NOT NULL,
	[ConsumoAguaM3] [int] NOT NULL,
	[UltimoConsumoM3] [int] NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadDelPropietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadDelPropietario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idPropietario] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_PropiedadDelPropietario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocID] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[valorDocID] [nvarchar](100) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietarioJuridico](
	[id] [int] NOT NULL,
	[idTipoDocID] [int] NOT NULL,
	[representante] [nvarchar](50) NOT NULL,
	[RepDocID] [nvarchar](100) NOT NULL,
	[TipoDocIdRepresentante] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_PropietarioJuridico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComprobantePago] [int] NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idConceptoCobro] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[fechaVencimiento] [date] NOT NULL,
	[monto] [money] NOT NULL,
	[esPendiente] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconexion]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reconexion](
	[id] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Reconexion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconteca]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reconteca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[idReconexion] [int] NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Reconteca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocID]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoDocID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEntidad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEntidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoEntidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTransaccionConsumo]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTransaccionConsumo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoTransaccionConsumo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransaccionConsumo]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransaccionConsumo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[montoM3] [money] NOT NULL,
	[LecturaConsumoM3] [int] NOT NULL,
	[NuevoAcumuladoM3] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[idTipoTransacCons] [int] NOT NULL,
 CONSTRAINT [PK_TransaccionConsumo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[passwd] [nvarchar](max) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioVsPropiedad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioVsPropiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioVsPropiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_TipoEntidad] FOREIGN KEY([idTipoEntidad])
REFERENCES [dbo].[TipoEntidad] ([id])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_TipoEntidad]
GO
ALTER TABLE [dbo].[CC_ConsumoAgua]  WITH CHECK ADD  CONSTRAINT [FK_CC_ConsumoAgua_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_ConsumoAgua] CHECK CONSTRAINT [FK_CC_ConsumoAgua_ConceptoCobro]
GO
ALTER TABLE [dbo].[CC_Fijo]  WITH CHECK ADD  CONSTRAINT [FK_CC_Fijo_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_Fijo] CHECK CONSTRAINT [FK_CC_Fijo_ConceptoCobro]
GO
ALTER TABLE [dbo].[CC_InteresesMoratorios]  WITH CHECK ADD  CONSTRAINT [FK_CC_InteresesMoratorios_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_InteresesMoratorios] CHECK CONSTRAINT [FK_CC_InteresesMoratorios_ConceptoCobro]
GO
ALTER TABLE [dbo].[CC_Porcentaje]  WITH CHECK ADD  CONSTRAINT [FK_CC_Porcentaje_ConceptoCobro] FOREIGN KEY([id])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CC_Porcentaje] CHECK CONSTRAINT [FK_CC_Porcentaje_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCenPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_CCenPropiedad_ConceptoCobro] FOREIGN KEY([idConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[CCenPropiedad] CHECK CONSTRAINT [FK_CCenPropiedad_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCenPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_CCenPropiedad_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[CCenPropiedad] CHECK CONSTRAINT [FK_CCenPropiedad_Propiedad]
GO
ALTER TABLE [dbo].[Cortes]  WITH CHECK ADD  CONSTRAINT [FK_Cortes_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[Cortes] CHECK CONSTRAINT [FK_Cortes_Propiedad]
GO
ALTER TABLE [dbo].[Cortes]  WITH CHECK ADD  CONSTRAINT [FK_Cortes_Reconexion] FOREIGN KEY([idReconexion])
REFERENCES [dbo].[Reconexion] ([id])
GO
ALTER TABLE [dbo].[Cortes] CHECK CONSTRAINT [FK_Cortes_Reconexion]
GO
ALTER TABLE [dbo].[PropiedadDelPropietario]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadDelPropietario_Propiedad1] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[PropiedadDelPropietario] CHECK CONSTRAINT [FK_PropiedadDelPropietario_Propiedad1]
GO
ALTER TABLE [dbo].[PropiedadDelPropietario]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadDelPropietario_Propietario1] FOREIGN KEY([idPropietario])
REFERENCES [dbo].[Propietario] ([id])
GO
ALTER TABLE [dbo].[PropiedadDelPropietario] CHECK CONSTRAINT [FK_PropiedadDelPropietario_Propietario1]
GO
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_Propietario_TipoDocID] FOREIGN KEY([idTipoDocID])
REFERENCES [dbo].[TipoDocID] ([id])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_Propietario_TipoDocID]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioJuridico_Propietario] FOREIGN KEY([id])
REFERENCES [dbo].[Propietario] ([id])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropietarioJuridico_Propietario]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioJuridico_TipoDocID] FOREIGN KEY([idTipoDocID])
REFERENCES [dbo].[TipoDocID] ([id])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropietarioJuridico_TipoDocID]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_ComprobanteDePago] FOREIGN KEY([idComprobantePago])
REFERENCES [dbo].[ComprobanteDePago] ([id])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_ComprobanteDePago]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_ConceptoCobro] FOREIGN KEY([idConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([id])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_ConceptoCobro]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_Propiedad]
GO
ALTER TABLE [dbo].[Reconexion]  WITH CHECK ADD  CONSTRAINT [FK_Reconexion_Recibo] FOREIGN KEY([id])
REFERENCES [dbo].[Recibo] ([id])
GO
ALTER TABLE [dbo].[Reconexion] CHECK CONSTRAINT [FK_Reconexion_Recibo]
GO
ALTER TABLE [dbo].[Reconteca]  WITH CHECK ADD  CONSTRAINT [FK_Reconteca_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[Reconteca] CHECK CONSTRAINT [FK_Reconteca_Propiedad]
GO
ALTER TABLE [dbo].[Reconteca]  WITH CHECK ADD  CONSTRAINT [FK_Reconteca_Reconexion] FOREIGN KEY([idReconexion])
REFERENCES [dbo].[Reconexion] ([id])
GO
ALTER TABLE [dbo].[Reconteca] CHECK CONSTRAINT [FK_Reconteca_Reconexion]
GO
ALTER TABLE [dbo].[TransaccionConsumo]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionConsumo_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[TransaccionConsumo] CHECK CONSTRAINT [FK_TransaccionConsumo_Propiedad]
GO
ALTER TABLE [dbo].[TransaccionConsumo]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionConsumo_TipoTransaccionConsumo] FOREIGN KEY([idTipoTransacCons])
REFERENCES [dbo].[TipoTransaccionConsumo] ([id])
GO
ALTER TABLE [dbo].[TransaccionConsumo] CHECK CONSTRAINT [FK_TransaccionConsumo_TipoTransaccionConsumo]
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioVsPropiedad_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad] CHECK CONSTRAINT [FK_UsuarioVsPropiedad_Propiedad]
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioVsPropiedad_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[UsuarioVsPropiedad] CHECK CONSTRAINT [FK_UsuarioVsPropiedad_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[csp_adminAddPropiedades]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminAddPropiedades] @inputNumFinca INT,
	@inputValorFinca MONEY,
	@inputDir NVARCHAR(max)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Propiedad (
			NumFinca,
			Valor,
			Direccion
			)
		SELECT @inputNumFinca,
			@inputValorFinca,
			@inputDir

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_adminAddPropietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminAddPropietario] @inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		DECLARE @DocidID INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		--PRINT (@DocidID)
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Propietario (
			nombre,
			valorDocID,
			idTipoDocID
			)
		SELECT @inputName,
			@inputDocIDVal,
			@DocidID

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_adminAddUser]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminAddUser] @inputUsername NVARCHAR(50),
	@inputPasswd NVARCHAR(100),
	@inputBit BIT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Usuario (
			username,
			passwd,
			isAdmin
			)
		SELECT @inputUsername,
			@inputPasswd,
			@inputBit

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_adminDeletePropietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminDeletePropietario] @InputDocID NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @InputDocID

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		DELETE
		FROM PropietarioJuridico
		WHERE id = @idPropietario

		DELETE
		FROM PropiedadDelPropietario
		WHERE idPropietario = @idPropietario

		DELETE
		FROM Propietario
		WHERE id = @idPropietario

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_adminDeleteUsuario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminDeleteUsuario] @usuarioIDInput NVARCHAR(50)
AS
BEGIN
	DECLARE @idUsuario INT = (
			SELECT id
			FROM Usuario
			WHERE username = @usuarioIDInput
			)

	BEGIN TRY
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		DELETE
		FROM UsuarioVsPropiedad
		WHERE idUsuario = @idUsuario

		DELETE
		FROM Usuario
		WHERE id = @idUsuario

		COMMIT

		RETURN 0
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		RETURN - 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_adminUpdatePropiedad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[csp_adminUpdatePropiedad] @numFinca int as
begin
	begin try
		set nocount on
	--sp code here

	end try
	begin catch
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	end catch
end

GO
/****** Object:  StoredProcedure [dbo].[csp_adminUpdatePropietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminUpdatePropietario] @inputOLDDocID NVARCHAR(50),
	@inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @inputOLDDocID

		DECLARE @DocidID INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Propietario
		SET nombre = @inputName,
			valorDocID = @inputDocIDVal,
			idTipoDocID = @DocidID
		WHERE valorDocID = @inputOLDDocID

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_adminUpdateUsuario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminUpdateUsuario] @inputOLDUsername NVARCHAR(50),
	@inputNewUsername NVARCHAR(50),
	@inputNewPassword NVARCHAR(100),
	@inputAdminStatus BIT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idUser INT

		EXEC @idUser = csp_getUserIDFromUsername @inputOLDUsername

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Usuario
		SET username = @inputNewUsername,
			passwd = @inputNewPassword,
			isAdmin = @inputAdminStatus
		WHERE id = @idUser

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarPersonaJuridica]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPersonaJuridica] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpPersonaJuridica TABLE (
			docidPersonaJuridica NVARCHAR(100),
			TipDocIdPJ INT,
			DocidRepresentante NVARCHAR(100),
			Nombre NVARCHAR(50),
			TipDocIdRepresentante INT,
			fechaxml DATE
			)

		INSERT @tmpPersonaJuridica (
			docidPersonaJuridica,
			TipDocIdPJ,
			DocidRepresentante,
			Nombre,
			TipDocIdRepresentante,
			fechaxml
			)
		SELECT docidPersonaJuridica,
			TipDocIdPJ,
			DocidRepresentante,
			Nombre,
			TipDocIdRepresentante,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/PersonaJuridica', 1) WITH (
				docidPersonaJuridica NVARCHAR(100),
				TipDocIdPJ INT,
				DocidRepresentante NVARCHAR(100),
				Nombre NVARCHAR(50),
				TipDocIdRepresentante INT,
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;

		--select * from @tmpPersonaJuridica
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT INTO dbo.PropietarioJuridico (
			id,
			idTipoDocID,
			representante,
			RepDocID,
			TipoDocIdRepresentante
			)
		SELECT P.id,
			tpj.TipDocIdPJ,
			tpj.Nombre,
			tpj.DocidRepresentante,
			tpj.TipDocIdRepresentante
		FROM @tmpPersonaJuridica AS tpj
		JOIN Propietario P ON P.valorDocID = tpj.docidPersonaJuridica

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarPropiedades]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPropiedades] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpProp TABLE (
			NumFinca INT,
			Valor MONEY,
			Direccion NVARCHAR(max),
			fechaxml DATE
			)

		INSERT @tmpProp (
			NumFinca,
			Valor,
			Direccion,
			fechaxml
			)
		SELECT NumFinca,
			Valor,
			Direccion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Propiedad', 1) WITH (
				NumFinca INT,
				Valor MONEY,
				Direccion NVARCHAR(MAX),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;
		--select * from @tmpProp

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.Propiedad (
			NumFinca,
			Valor,
			Direccion
			)
		SELECT tp.NumFinca,
			tp.Valor,
			tp.Direccion
		FROM @tmpProp tp

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarPropietarios]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPropietarios] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpPropiet TABLE (
			idTipoDocID INT,
			nombre NVARCHAR(50),
			valorDocID NVARCHAR(100),
			fechaxml DATE
			)

		INSERT @tmpPropiet (
			nombre,
			idTipoDocID,
			valorDocID,
			fechaxml
			)
		SELECT Nombre,
			TipoDocIdentidad,
			identificacion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Propietario', 1) WITH (
				Nombre NVARCHAR(50),
				TipoDocIdentidad INT,
				identificacion NVARCHAR(100),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;

		-- SELECT * FROM @tmpPropiet

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.Propietario (
			nombre,
			idTipoDocID,
			valorDocID
			)
		SELECT tp.nombre,
			tp.idTipoDocID,
			tp.valorDocID
		FROM @tmpPropiet tp

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_agregarUsuarios]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_agregarUsuarios] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpUsuario TABLE (
			nombre NVARCHAR(50),
			passwd NVARCHAR(max),
			fechaxml DATE
			)

		INSERT @tmpUsuario (
			nombre,
			passwd,
			fechaxml
			)
		SELECT Nombre,
			passwd,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Usuario', 1) WITH (
				Nombre NVARCHAR(50),
				passwd NVARCHAR(max),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		-- SELECT * FROM @tmpUsuario

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Usuario (
			username,
			passwd,
			isAdmin
			)
		SELECT t.nombre,
			t.passwd,
			0
		FROM @tmpUsuario t

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getDocidIDFromName]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getDocidIDFromName] @inputName NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @outputID INT = (
				SELECT TOP 1 d.id
				FROM TipoDocID d
				WHERE d.nombre = @inputName
				)

		RETURN @outputID
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedades]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropiedades]
AS
BEGIN
	SELECT P.numFinca AS [Identificacion],
		P.valor AS [Valor],
		P.Direccion AS [Direccion]
	FROM Propiedad P
END
	--EXEC csp_getPropiedades
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadesDePropietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropiedadesDePropietario] @idInput NVARCHAR(100)
AS
BEGIN
	DECLARE @idPropietario INT = (
			SELECT P.id
			FROM Propietario P
			WHERE @idInput = P.valorDocId
			);

	SELECT P.NumFinca AS [# Propiedad],
		P.Valor AS [Valor],
		P.Direccion AS [Direccion]
	FROM Propiedad P
	JOIN PropiedadDelPropietario PP ON P.id = PP.idPropietario
	WHERE @idPropietario = PP.idPropietario
END
	--EXEC csp_getPropiedadesDePropietario 301410305
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadesDeUsuario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[csp_getPropiedadesDeUsuario] @usernameInput NVARCHAR(100)
AS
BEGIN

    DECLARE @idUser INT = (SELECT U.id FROM Usuario U WHERE @usernameInput = U.username);

    SELECT P.NumFinca AS [# Propiedad],P.Valor AS [Valor], P.Direccion AS [Direccion]
    FROM Propiedad P JOIN UsuarioVsPropiedad UVP ON P.id = UVP.idPropiedad
    WHERE @idUser = UVP.idUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadesFromPropietarioDocID]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropiedadesFromPropietarioDocID] @inputDocID NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @inputDocID

		PRINT (@idPropietario)

		SELECT p.NumFinca AS 'NÃºmero de propiedad',
			p.Valor AS 'Valor monetario',
			p.Direccion AS 'DirecciÃ³n'
		FROM Propiedad p
		JOIN PropiedadDelPropietario pdp ON pdp.idPropiedad = p.id
		WHERE @idPropietario = pdp.idPropietario
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadIDFromNumFinca]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropiedadIDFromNumFinca] @inputNumFinca INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @outputID INT

		SET @outputID = (
				SELECT TOP 1 p.id
				FROM Propiedad P
				WHERE p.NumFinca = @inputNumFinca
				)

		RETURN @outputID
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropietarioIDFromDocID]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropietarioIDFromDocID] @inputDocID NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @outputID INT

		SET @outputID = (
				SELECT TOP 1 p.id
				FROM Propietario p
				WHERE p.valorDocID = @inputDocID
				)

		RETURN @outputID
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropietarios]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[csp_getPropietarios] AS
BEGIN

    SELECT P.valorDocID AS Identificacion,P.nombre AS Nombre, TD.nombre AS [Tipo de documento]
    FROM Propietario P JOIN TipoDocID TD ON P.idTipoDocID = TD.id
    order by p.nombre

END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropietariosFromNumFinca]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropietariosFromNumFinca] @inputNumFinca INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropiedad INT

		EXEC @idPropiedad = csp_getPropiedadIDFromNumFinca @inputNumFinca

		PRINT (@idPropiedad)

		SELECT p.nombre AS 'Nombre',
			p.valorDocID AS 'Documento Legal'
		FROM Propietario p
		JOIN PropiedadDelPropietario pdp ON pdp.idPropietario = p.id
		WHERE @idPropiedad = pdp.idPropiedad
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getUserIDFromUsername]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getUserIDFromUsername] @inputUsername NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @outputID INT

		SET @outputID = (
				SELECT TOP 1 u.id
				FROM Usuario u
				WHERE u.username = @inputUsername
				)

		--PRINT (@outputID)

		RETURN @outputID
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getUsernames]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getUsernames]
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		SELECT u.username AS 'Nombre de usuario'
		FROM Usuario u
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getUsuarioFromNumFinca]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[csp_getUsuarioFromNumFinca] @inputNumFinca int as
begin
	begin try
		set nocount on
	DECLARE @idPropiedad INT

		EXEC @idPropiedad = csp_getPropiedadIDFromNumFinca @inputNumFinca

		PRINT (@idPropiedad)

		SELECT u.username as 'Nombre de usuario', u.isAdmin 'Estado Administrador'
		FROM Usuario u
		JOIN UsuarioVsPropiedad uvp ON uvp.idUsuario = u.id
		WHERE @idPropiedad = uvp.idPropiedad

	end try
	begin catch
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	end catch
end

GO
/****** Object:  StoredProcedure [dbo].[csp_getUsuarios]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[csp_getUsuarios] AS
BEGIN

    SELECT u.username AS 'Nombre de usuario',u.passwd AS 'ContraseÃ±a', u.isAdmin as 'Administrador'
    FROM Usuario u
    order by u.username

END
GO
/****** Object:  StoredProcedure [dbo].[csp_linkCCenPropiedad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkCCenPropiedad] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpCCenProp TABLE (
			idcobro INT,
			NumFinca INT,
			fechaxml DATE
			)

		INSERT @tmpCCenProp (
			idcobro,
			NumFinca,
			fechaxml
			)
		SELECT idcobro,
			NumFinca,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad', 1) WITH (
				idcobro INT,
				NumFinca INT,
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		--select * from @tmpCCenProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.CCenPropiedad (
			idConceptoCobro,
			idPropiedad,
			fechaInicio
			)
		SELECT cp.idcobro,
			P.id,
			@fechaInput
		FROM @tmpCCenProp AS cp
		JOIN Propiedad P ON P.NumFinca = cp.NumFinca

		--select * from CCenPropiedad
		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_linkPropiedadDelPropietario]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkPropiedadDelPropietario] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpProtxProp TABLE (
			NumFinca INT,
			identificacion NVARCHAR(100),
			fechaxml DATE
			)

		INSERT @tmpProtxProp (
			NumFinca,
			identificacion,
			fechaxml
			)
		SELECT NumFinca,
			identificacion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario', 1) WITH (
				NumFinca INT,
				identificacion NVARCHAR(100),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		--select * from @tmpProtxProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.PropiedadDelPropietario (
			idPropiedad,
			idPropietario
			)
		SELECT PO.id,
			P.id
		FROM @tmpProtxProp AS pp
		JOIN Propietario P ON P.valorDocID = pp.identificacion
		JOIN Propiedad PO ON PO.NumFinca = pp.NumFinca

		--select * from PropiedadDelPropietario
		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[csp_linkUsuarioVsPropiedad]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkUsuarioVsPropiedad] @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpUSvsProp TABLE (
			NumFinca INT,
			nombreUsuario NVARCHAR(50),
			fechaxml DATE
			)

		INSERT @tmpUSvsProp (
			NumFinca,
			nombreUsuario,
			fechaxml
			)
		SELECT NumFinca,
			nombreUsuario,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad', 1) WITH (
				NumFinca INT,
				nombreUsuario NVARCHAR(50),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		--select * from @tmpUSvsProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT UsuarioVsPropiedad (
			idUsuario,
			idPropiedad
			)
		SELECT U.id,
			P.id
		FROM @tmpUSvsProp tmp
		JOIN Usuario U ON U.username = tmp.nombreUsuario
		JOIN Propiedad P ON P.NumFinca = tmp.NumFinca

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 6/26/2020 12:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROCEDURE [dbo].[spLogin] @usernameInput NVARCHAR(100),
	@passwordInput NVARCHAR(100)
AS
BEGIN
	DECLARE @isAdmin INT = (
			SELECT U.isAdmin
			FROM Usuario U
			WHERE @usernameInput = U.username
				AND @passwordInput = U.passwd
			);

	IF @isAdmin = 1
		RETURN @isAdmin
	ELSE IF @isAdmin = 0
		RETURN 0;
	ELSE
		RETURN - 1
END
GO
USE [master]
GO
ALTER DATABASE [municipalidad] SET  READ_WRITE 
GO
