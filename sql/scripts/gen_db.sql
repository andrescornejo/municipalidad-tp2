USE [master]
GO
/****** Object:  Database [municipalidad]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoEntidad] [int] NOT NULL,
	[idEntidad] [int] NOT NULL,
	[jsonAntes] [varchar](500) NULL,
	[jsonDespues] [varchar](500) NULL,
	[insertedAt] [datetime] NOT NULL,
	[insertedBy] [nvarchar](100) NOT NULL,
	[insertedIn] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_ConsumoAgua]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CC_ConsumoAgua](
	[id] [int] NOT NULL,
	[ValorM3] [money] NOT NULL,
	[MontoMinimo] [money] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CC_ConsumoAgua] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CC_Fijo]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[CC_InteresesMoratorios]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[CC_Porcentaje]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[CCenPropiedad]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[ComprobanteDePago]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 7/16/2020 19:37:41 ******/
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
	[EsFijo] [bit] NOT NULL,
	[EsImpuesto] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corte]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corte](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Propiedad]    Script Date: 7/16/2020 19:37:41 ******/
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
	[ConsumoAcumuladoM3] [int] NOT NULL,
	[UltimoConsumoM3] [int] NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadDelPropietario]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[Propietario]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[Recibo]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComprobantePago] [int] NULL,
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
/****** Object:  Table [dbo].[Reconexion]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[Reconteca]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[TipoDocID]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[TipoEntidad]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[TipoTransaccionConsumo]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[TransaccionConsumo]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransaccionConsumo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPropiedad] [int] NOT NULL,
	[fecha] [date] NULL,
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/16/2020 19:37:41 ******/
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
/****** Object:  Table [dbo].[UsuarioVsPropiedad]    Script Date: 7/16/2020 19:37:41 ******/
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
ALTER TABLE [dbo].[Corte]  WITH CHECK ADD  CONSTRAINT [FK_Cortes_Propiedad] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedad] ([id])
GO
ALTER TABLE [dbo].[Corte] CHECK CONSTRAINT [FK_Cortes_Propiedad]
GO
ALTER TABLE [dbo].[Corte]  WITH CHECK ADD  CONSTRAINT [FK_Cortes_Reconexion] FOREIGN KEY([idReconexion])
REFERENCES [dbo].[Reconexion] ([id])
GO
ALTER TABLE [dbo].[Corte] CHECK CONSTRAINT [FK_Cortes_Reconexion]
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
/****** Object:  StoredProcedure [dbo].[csp_adminAddPropiedades]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminAddPropiedades] @inputNumFinca INT,
	@inputValorFinca MONEY,
	@inputDir NVARCHAR(max),
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		DECLARE @jsonDespues NVARCHAR(500)

		SET @jsonDespues = (
				SELECT @inputNumFinca AS 'Número de propiedad',
					@inputValorFinca AS 'Valor monetario',
					@inputDir AS 'Dirección',
					0 AS 'Consumo acumulado m3',
					0 AS 'Ultimo consumo m3',
					'Activo' AS 'Estado'
				FOR JSON PATH,
					ROOT('Propiedad')
				)

		BEGIN TRANSACTION

		INSERT Propiedad (
			NumFinca,
			Valor,
			Direccion,
			activo,
			ConsumoAcumuladoM3,
			UltimoConsumoM3
			)
		SELECT @inputNumFinca,
			@inputValorFinca,
			@inputDir,
			1,
			0,
			0

		INSERT Bitacora (
			idTipoEntidad,
			idEntidad,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
		SELECT t.id,
			(
				SELECT SCOPE_IDENTITY()
				),
			NULL,
			@jsonDespues,
			GETDATE(),
			@inputInsertedBy,
			@inputInsertedIn
		FROM dbo.TipoEntidad T
		WHERE T.Nombre = 'Propiedad'

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
/****** Object:  StoredProcedure [dbo].[csp_adminAddPropietario]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminAddPropietario] @inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50),
	@inputInsertBy NVARCHAR(100),
	@inputInsertIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		DECLARE @DocidID INT
		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @idEntidad INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		--PRINT (@DocidID)
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		-- insert new owner
		
		INSERT Propietario (
			nombre,
			valorDocID,
			idTipoDocID,
			activo
			)
		SELECT @inputName,
			@inputDocIDVal,
			@DocidID,
			1

		--insert into bitacora
		SET @jsonDespues = (SELECT
								@inputName AS 'Nombre', 
								T.nombre AS 'Tipo DocID', 
								@inputDocIDVal AS 'Valor ID', 
								'Activo' AS 'Estado'
							FROM [dbo].[Propietario] P
							JOIN [dbo].[TipoDocID] T ON T.id = @DocidID
							WHERE P.valorDocID = @inputDocIDVal
							FOR JSON PATH,ROOT('Propietario'))

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad, 
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		) SELECT
		T.id,
		SCOPE_IDENTITY(),
		@jsonDespues,
		GETDATE(),
		@inputInsertBy,
		@inputInsertIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'Propietario'
		
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
/****** Object:  StoredProcedure [dbo].[csp_adminAddUser]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminAddUser] @inputUsername NVARCHAR(50),
	@inputPasswd NVARCHAR(100),
	@inputBit BIT,
	@inputInsertBy NVARCHAR(100),
	@inputInsertIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @idEntidad INT
		DECLARE @Admin NVARCHAR(20)

		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		-- insert user
		INSERT Usuario (
			username,
			passwd,
			isAdmin,
			activo
			)
		SELECT @inputUsername,
			@inputPasswd,
			@inputBit,
			1

		-- save change of the table into bitácora
		SET @idEntidad = (SELECT U.id FROM [dbo].[Usuario] U WHERE U.username = @inputUsername)
		SET @Admin = (CASE WHEN @inputBit = 1
						THEN 'Administrador'
						ELSE 'Cliente'
					END)
		SET @jsonDespues = (SELECT
							@idEntidad AS 'ID',
							@inputUsername AS 'Nombre Usuario', 
							'*****' AS 'Contraseña', 
							@Admin AS 'Tipo Usuario', 
							'Activo' AS 'Estado'
							FOR JSON PATH, ROOT('Usuario'))
		
		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad, 
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		) SELECT
		T.id,
		@idEntidad,
		@jsonDespues,
		GETDATE(),
		@inputInsertBy,
		@inputInsertIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'Usuario'
		
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
/****** Object:  StoredProcedure [dbo].[csp_adminDeletePropiedad]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminDeletePropiedad] @inputNumFinca INT,
	@inInsertedBy NVARCHAR(100),
	@inInsertedIn NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @idEntidad INT
		DECLARE @idPropiedad INT = (
				SELECT P.id
				FROM Propiedad P
				WHERE P.NumFinca = @inputNumFinca
				);
		DECLARE @tmpPropiedadDelPropietario TABLE (id INT)
		DECLARE @tmpUsuarioVsPropiedad TABLE (id INT)

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Propiedad
		SET activo = 0
		WHERE id = @idPropiedad

		UPDATE Reconteca
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		UPDATE Recibo
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		UPDATE PropiedadDelPropietario
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		INSERT INTO @tmpPropiedadDelPropietario (id)
		SELECT PP.id
		FROM [dbo].[PropiedadDelPropietario] PP
		WHERE PP.idPropiedad = @idPropiedad

		UPDATE UsuarioVsPropiedad
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		INSERT INTO @tmpUsuarioVsPropiedad (id)
		SELECT UP.id
		FROM [dbo].[UsuarioVsPropiedad] UP
		WHERE Up.idPropiedad = @idPropiedad

		UPDATE CCenPropiedad
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		UPDATE TransaccionConsumo
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		-- insert changes of PropiedadDelPropietario table into bitacora
		WHILE (
				SELECT COUNT(*)
				FROM @tmpPropiedadDelPropietario
				) > 0
		BEGIN
			SET @idEntidad = (
					SELECT TOP 1 tmpP.id
					FROM @tmpPropiedadDelPropietario tmpP
					)

			DELETE @tmpPropiedadDelPropietario
			WHERE id = @idEntidad

			SET @jsonAntes = (
					SELECT F.NumFinca AS 'Numero Finca',
						P.nombre AS 'Propietario',
						P.valorDocid AS 'Identificacion',
						'Activo' AS 'Estado'
					FROM [dbo].[PropiedadDelPropietario] PP
					INNER JOIN [dbo].[Propietario] P ON P.id = PP.idPropietario
					INNER JOIN [dbo].[Propiedad] F ON F.id = PP.idPropiedad
					WHERE PP.id = @idEntidad
					FOR JSON PATH,
						ROOT('Propiedad-Propietario')
					)

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad,
				jsonAntes,
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
				)
			SELECT T.id,
				@idEntidad,
				@jsonAntes,
				NULL,
				GETDATE(),
				@inInsertedBy,
				@inInsertedIn
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsPropietario'
		END

		-- insert changes of UsuarioVsPropiedad table into bitacora
		WHILE (
				SELECT COUNT(*)
				FROM @tmpUsuarioVsPropiedad
				) > 0
		BEGIN
			SET @idEntidad = (
					SELECT TOP 1 tmpU.id
					FROM @tmpUsuarioVsPropiedad tmpU
					)

			DELETE @tmpUsuarioVsPropiedad
			WHERE id = @idEntidad

			SET @jsonAntes = (
					SELECT U.username AS 'Nombre de Usuario',
						F.NumFinca AS 'Numero de Finca',
						'Activo' AS 'Estado'
					FROM [dbo].[UsuarioVsPropiedad] UP
					INNER JOIN [dbo].[Usuario] U ON U.id = UP.idUsuario
					INNER JOIN [dbo].[Propiedad] F ON F.id = UP.idPropiedad
					WHERE Up.id = @idEntidad
					FOR JSON PATH,
						ROOT('Propiedad-Usuario')
					)

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad,
				jsonAntes,
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
				)
			SELECT T.id,
				@idEntidad,
				@jsonAntes,
				NULL,
				GETDATE(),
				@inInsertedBy,
				@inInsertedIn
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsUsuario'
		END

		
		SET @jsonAntes = (
		SELECT @inputNumFinca AS 'Número de propiedad',
			p.Valor AS 'Valor monetario',
			p.Direccion AS 'Dirección',
			p.ConsumoAcumuladoM3 as 'Consumo acumulado m3',
			p.UltimoConsumoM3 as 'Ultimo consumo m3',
			'Activo' AS 'Estado'
		from Propiedad p where p.id = @idPropiedad
		FOR JSON PATH,
			ROOT('Propiedad')
		)
--Logging is disabled since the trigger takes care of this.
		-- INSERT Bitacora (
		-- 	idTipoEntidad,
		-- 	idEntidad,
		-- 	jsonAntes,
		-- 	jsonDespues,
		-- 	insertedAt,
		-- 	insertedBy,
		-- 	insertedIn
		-- 	)
		-- SELECT t.id,
		-- 	@idPropiedad,
		-- 	@jsonAntes,
		-- 	NULL,
		-- 	GETDATE(),
		-- 	@inInsertedBy,
		-- 	@inInsertedIn
		-- FROM dbo.TipoEntidad T
		-- WHERE T.Nombre = 'Propiedad'

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
/****** Object:  StoredProcedure [dbo].[csp_adminDeletePropietario]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminDeletePropietario] @InputDocID NVARCHAR(20),
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT
		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @idEntidad INT
		DECLARE @tmpPropiedadDelPropietario TABLE (id INT)

		SET @idEntidad = (
				SELECT p.id
				FROM Propietario p
				WHERE p.valorDocID = @InputDocID
				)

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @InputDocID

		SET @jsonAntes = (
				SELECT P.nombre AS 'Nombre',
					P.valorDocID AS 'Valor del documento legal',
					T.nombre AS 'Tipo de documento legal',
					'Activo' AS 'Estado'
				FROM [dbo].[Propietario] P
				JOIN [dbo].[TipoDocID] T ON T.id = P.idTipoDocID
				WHERE P.valorDocID = @InputDocID
				FOR JSON PATH,
					ROOT('Propietario')
				)
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE PropietarioJuridico
		SET activo = 0
		WHERE id = @idPropietario

		UPDATE PropiedadDelPropietario
		SET activo = 0
		WHERE idPropietario = @idPropietario

		INSERT INTO @tmpPropiedadDelPropietario (id)
		SELECT PP.id
		FROM [dbo].[PropiedadDelPropietario] PP
		WHERE PP.idPropietario = @idPropietario

		UPDATE Propietario
		SET activo = 0
		WHERE id = @idPropietario

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
		SELECT T.id,
			@idPropietario,
			@jsonAntes,
			NULL,
			GETDATE(),
			@inputInsertedBy,
			@inputInsertedIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'Propietario'

		-- insert changes of PropiedadDelPropietario table into bitacora
		WHILE (
				SELECT COUNT(*)
				FROM @tmpPropiedadDelPropietario
				) > 0
		BEGIN
			SET @idEntidad = (
					SELECT TOP 1 tmpP.id
					FROM @tmpPropiedadDelPropietario tmpP
					)

			DELETE @tmpPropiedadDelPropietario
			WHERE id = @idEntidad

			SET @jsonAntes = (
					SELECT F.NumFinca AS 'Numero Finca',
						P.nombre AS 'Propietario',
						P.valorDocid AS 'Identificacion',
						'Activo' AS 'Estado'
					FROM [dbo].[PropiedadDelPropietario] PP
					INNER JOIN [dbo].[Propietario] P ON P.id = PP.idPropietario
					INNER JOIN [dbo].[Propiedad] F ON F.id = PP.idPropiedad
					WHERE PP.id = @idEntidad
					FOR JSON PATH,
						ROOT('Propiedad-Propietario')
					)

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad,
				jsonAntes,
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
				)
			SELECT T.id,
				@idEntidad,
				@jsonAntes,
				NULL,
				GETDATE(),
				@inputInsertedBy,
				@inputInsertedIn
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsPropietario'
		END

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
/****** Object:  StoredProcedure [dbo].[csp_adminDeleteUsuario]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminDeleteUsuario] @inUsr NVARCHAR(100),
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	DECLARE @jsonAntesUsuario NVARCHAR(500)
	DECLARE @jsonDespuesUsuario NVARCHAR(500)
	DECLARE @Admin NVARCHAR(20)
	DECLARE @isAdmin BIT
	declare @usrID int

	set @usrID = (select u.id from Usuario u where u.username = @inUsr)
	print(@usrID)

	BEGIN TRY
		SET @isAdmin = (
				SELECT U.isAdmin
				FROM [dbo].[Usuario] U
				WHERE U.id = @usrID
				)
		SET @Admin = (
				CASE 
					WHEN @isAdmin = 1
						THEN 'Administrador'
					ELSE 'Cliente'
					END
				)
		SET @jsonAntesUsuario = (
				SELECT U.id AS 'ID',
					U.username AS 'Nombre Usuario',
					'*****' AS 'Contraseña',
					@Admin AS 'Tipo Usuario',
					'Activo' AS 'Estado'
				FROM [dbo].[Usuario] U
				WHERE U.id = @usrID
				FOR JSON PATH,
					ROOT('Usuario')
				)
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE UsuarioVsPropiedad
		SET activo = 0
		WHERE idUsuario = @usrID

		-- Necesito iterar por cada relacion entre propiedad y usuario
		-- Falta agregar los cambios de las relaaciones Usuario Vs Propiedad
		UPDATE Usuario
		SET activo = 0
		WHERE id = @usrID

		-- insert into bitacora

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
		SELECT T.id,
			@usrID,
			@jsonAntesUsuario,
			null,
			GETDATE(),
			@inputInsertedBy,
			@inputInsertedIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'Usuario'

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
/****** Object:  StoredProcedure [dbo].[csp_adminUpdatePropiedad]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminUpdatePropiedad] @inID INT,
	@inNumProp INT,
	@inValor MONEY,
	@inDir NVARCHAR(max),
	@inAcumM3 INT,
	@inUltM3 INT,
	@inUsername NVARCHAR(500),
	@inIP NVARCHAR(500)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

--Logging to table Bitacora is disabled because a trigger does it 
		-- DECLARE @jsonAntes NVARCHAR(500),
		-- 	@jsonDespues NVARCHAR(500)

		-- SET @jsonAntes = (
		-- 		SELECT p.NumFinca AS 'Número de propiedad',
		-- 			p.Valor AS 'Valor monetario',
		-- 			p.Direccion AS 'Dirección',
		-- 			p.ConsumoAcumuladoM3 AS 'Consumo acumulado m3',
		-- 			p.UltimoConsumoM3 AS 'Ultimo consumo m3',
		-- 			'Activo' AS 'Estado'
		-- 		FROM Propiedad p
		-- 		WHERE p.id = @inID
		-- 		FOR JSON PATH,
		-- 			ROOT('Propiedad')
		-- 		)
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRAN

		UPDATE Propiedad
		SET NumFinca = @inNumProp,
			Valor = @inValor,
			Direccion = @inDir,
			ConsumoAcumuladoM3 = @inAcumM3,
			UltimoConsumoM3 = @inUltM3
		WHERE id = @inID
			AND activo = 1

		-- SET @jsonDespues = (
		-- 		SELECT p.NumFinca AS 'Número de propiedad',
		-- 			p.Valor AS 'Valor monetario',
		-- 			p.Direccion AS 'Dirección',
		-- 			p.ConsumoAcumuladoM3 AS 'Consumo acumulado m3',
		-- 			p.UltimoConsumoM3 AS 'Ultimo consumo m3',
		-- 			'Activo' AS 'Estado'
		-- 		FROM Propiedad p
		-- 		WHERE p.id = @inID
		-- 		FOR JSON PATH,
		-- 			ROOT('Propiedad')
		-- 		)

		-- INSERT Bitacora (
		-- 	idTipoEntidad,
		-- 	idEntidad,
		-- 	jsonAntes,
		-- 	jsonDespues,
		-- 	insertedAt,
		-- 	insertedBy,
		-- 	insertedIn
		-- 	)
		-- SELECT te.id,
		-- 	@inID,
		-- 	@jsonAntes,
		-- 	@jsonDespues,
		-- 	GETDATE(),
		-- 	@inUsername,
		-- 	@inIP
		-- FROM TipoEntidad te
		-- WHERE te.Nombre = 'Propiedad'

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
/****** Object:  StoredProcedure [dbo].[csp_adminUpdatePropietario]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminUpdatePropietario] @inID int,
	@inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50),
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT
		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @jsonDespues NVARCHAR(500)

		DECLARE @DocidID INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		SET @jsonAntes = (
				SELECT P.nombre AS 'Nombre',
					P.valorDocID AS 'Valor del documento legal',
					T.nombre AS 'Tipo de documento legal',
					'Activo' AS 'Estado'
				FROM [dbo].[Propietario] P
				JOIN [dbo].[TipoDocID] T ON T.id = P.idTipoDocID
				WHERE P.id = @inID
				FOR JSON PATH,
					ROOT('Propietario')
				)
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Propietario
		SET nombre = @inputName,
			valorDocID = @inputDocIDVal,
			idTipoDocID = @DocidID
		WHERE id = @inID
			AND activo = 1

		-- insert change into bitacora
		SET @jsonDespues = (
				SELECT P.nombre AS 'Nombre',
					P.valorDocID AS 'Valor del documento legal',
					T.nombre AS 'Tipo de documento legal',
					'Activo' AS 'Estado'
				FROM [dbo].[Propietario] P
				JOIN [dbo].[TipoDocID] T ON T.id = P.idTipoDocID
				WHERE P.id = @inID
				FOR JSON PATH,
					ROOT('Propietario')
				)

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
		SELECT T.id,
			@inID,
			@jsonAntes,
			@jsonDespues,
			GETDATE(),
			@inputInsertedBy,
			@inputInsertedIn
		FROM [dbo].[TipoEntidad] T
		JOIN [dbo].[Propietario] P ON P.valorDocID = @inputDocIDVal
			AND P.activo = 1
		WHERE T.Nombre = 'Propietario'

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
/****** Object:  StoredProcedure [dbo].[csp_adminUpdateUsuario]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_adminUpdateUsuario] @inID int,
	@inputNewUsername NVARCHAR(50),
	@inputNewPassword NVARCHAR(100),
	@inputAdminStatus BIT,
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @adminBefore NVARCHAR(500)
		DECLARE @adminAfter NVARCHAR(500)
		DECLARE @oldAdminStatus BIT
		DECLARE @newPasswd NVARCHAR(500)

		IF @inputNewPassword = '*****'
			set @newPasswd = (select u.passwd from Usuario u where u.id = @inID)
		ELSE
			set @newPasswd = @inputNewPassword

		SET @oldAdminStatus = (
				SELECT u.isAdmin
				FROM Usuario u
				WHERE u.id = @inID
				)
		SET @adminBefore = (
				CASE 
					WHEN @oldAdminStatus = 1
						THEN 'Administrador'
					ELSE 'Cliente'
					END
				)
		SET @adminAfter = (
				CASE 
					WHEN @inputAdminStatus = 1
						THEN 'Administrador'
					ELSE 'Cliente'
					END
				)
		SET @jsonAntes = (
				SELECT u.username AS 'Nombre Usuario',
					'*****' AS 'Contraseña',
					u.isAdmin AS 'Tipo Usuario',
					'Activo' AS 'Estado'
					from Usuario u where u.id = @inID
				FOR JSON PATH,
					ROOT('Usuario')
				)
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Usuario
		SET username = @inputNewUsername,
			passwd = @newPasswd,
			isAdmin = @inputAdminStatus
		WHERE id = @inID
			AND activo = 1

		-- inset into bitacora
		SET @jsonDespues = (
				SELECT u.username AS 'Nombre Usuario',
					'*****' AS 'Contraseña',
					u.isAdmin AS 'Tipo Usuario',
					'Activo' AS 'Estado'
					from Usuario u where u.id = @inID
				FOR JSON PATH,
					ROOT('Usuario')
				)

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
		SELECT T.id,
			@inID,
			@jsonAntes,
			@jsonDespues,
			GETDATE(),
			@inputInsertedBy,
			@inputInsertedIn
		FROM [dbo].[TipoEntidad] T
		JOIN [dbo].[Usuario] U ON @inputNewUsername = U.username
			AND U.activo = 1
		WHERE T.Nombre = 'Usuario'

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
/****** Object:  StoredProcedure [dbo].[csp_agregarCambioValorPropiedad]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_agregarCambioValorPropiedad] (@inFecha DATE, @OperacionXML XML)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @hdoc INT
		DECLARE @numFinca INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpValorProp TABLE (
			NumFinca INT,
			Valor MONEY
			)

		INSERT INTO @tmpValorProp (
			NumFinca,
			Valor
			)
		SELECT NumFinca,
			NuevoValor
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/CambioPropiedad ', 1) WITH (
				NumFinca INT,
				NuevoValor MONEY,
				fecha DATE '../@fecha'
				)
		WHERE @inFecha = fecha

		EXEC sp_xml_removedocument @hdoc;

		BEGIN TRANSACTION

		WHILE ( SELECT COUNT(*) FROM @tmpValorProp) > 0
		BEGIN
			--Seleccionamos la primera tabla
			SET  @numFinca = (SELECT TOP 1 tmp.NumFinca
			FROM @tmpValorProp tmp ORDER BY tmp.NumFinca DESC)

			UPDATE dbo.Propiedad
			SET Valor = (
					SELECT tmp.Valor
					FROM @tmpValorProp tmp
					WHERE @numFinca = tmp.NumFinca
					)
			WHERE NumFinca = @numFinca
				-- add change to bitacora table triggers

			-- Borramos el registro
			DELETE @tmpValorProp
			WHERE NumFinca = @numFinca
		END

		COMMIT
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
/****** Object:  StoredProcedure [dbo].[csp_agregarPagos]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPagos] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
        DECLARE @idCC INT
        DECLARE @NumFinca INT
        DECLARE @idComprobante INT

		DECLARE @hdoc INT
        
        DECLARE @tmpPago TABLE (
            idTipoRecibo INT,
            NumFinca INT
        )

        DECLARE @tmpPagoProp TABLE(
            idTipoRecibo INT
        )

		EXEC sp_xml_preparedocument @hdoc OUT,
		@OperacionXML
        
        INSERT INTO @tmpPago (
            idTipoRecibo,
            NumFinca
        ) SELECT 
            X.TipoRecibo,
            X.NumFinca
        FROM openXml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Pago', 1) WITH(
            TipoRecibo INT,
            NumFinca INT,
            fecha DATE '../@fecha'
        ) AS X
        WHERE @fechaInput = fecha
        ORDER BY NumFinca 
        
        EXEC sp_xml_removedocument @hdoc;
        
        BEGIN TRANSACTION
            WHILE (SELECT COUNT(*) FROM @tmpPago) > 0
            BEGIN
                -- Tomo la primero Finca
                SET @NumFinca = (SELECT TOP 1 tmp.NumFinca FROM @tmpPago tmp)
                -- Inserto los pagos de una propiedad
                INSERT INTO @tmpPagoProp (idTipoRecibo)
                SELECT tmp.idTipoRecibo FROM @tmpPago tmp
                WHERE tmp.NumFinca = @NumFinca
                -- eliminio los Pagos de esa Finca tabla general
                DELETE FROM @tmpPago
                WHERE NumFinca = @NumFinca
                
                -- IF @idComprobante = NULL OR (SELECT CP.MontoTotal FROM [dbo].[ComprobanteDePago] CP WHERE CP.id = @idComprobante) != 0
                -- BEGIN
                    -- Creo un comprobante por los recibos ha pagar de esa propiedad
                    INSERT INTO [dbo].[ComprobanteDePago] (fecha,MontoTotal,activo)
                    SELECT @fechaInput, 0, 1

                    SET @idComprobante = (SELECT TOP 1 CP.id FROM [dbo].[ComprobanteDePago] CP ORDER BY CP.id DESC)
                -- END
                
                WHILE (SELECT COUNT(*) FROM @tmpPagoProp) > 0
                BEGIN
                    SET @idCC = (SELECT TOP 1 tmpP.idTipoRecibo FROM @tmpPagoProp tmpP)
                    -- Elimino los Pago de se CC de la tabla PagosProp
                    DELETE @tmpPagoProp 
                    WHERE idTipoRecibo = @idCC

                    EXEC csp_RealizarPago @NumFinca, @idComprobante, @fechaInput, @idCC
                END
            END
            exec csp_cleanComprobantes
        COMMIT
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
/****** Object:  StoredProcedure [dbo].[csp_agregarPersonaJuridica]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPersonaJuridica] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
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
			4,
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
			TipoDocIdRepresentante,
			activo
			)
		SELECT P.id,
			tpj.TipDocIdPJ,
			tpj.Nombre,
			tpj.DocidRepresentante,
			tpj.TipDocIdRepresentante,
			1
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
/****** Object:  StoredProcedure [dbo].[csp_agregarPropiedades]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[csp_agregarPropiedades] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @hdoc INT
		DECLARE @PropiedadRef INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpProp TABLE (
			NumFinca INT,
			Valor MONEY,
			Direccion NVARCHAR(max),
			fechaxml DATE
			)

		INSERT INTO @tmpProp (
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

		WHILE (SELECT COUNT(*) FROM @tmpProp) > 0
		BEGIN
			SET @PropiedadRef = (SELECT TOP 1 tmp.NumFinca FROM @tmpProp tmp)

			INSERT dbo.Propiedad (
				NumFinca,
				Valor,
				Direccion,
				activo,
				ConsumoAcumuladoM3,
				UltimoConsumoM3
				)
			SELECT tp.NumFinca,
				tp.Valor,
				tp.Direccion,
				1,
				0,
				0
			FROM @tmpProp tp
			WHERE tp.NumFinca = @PropiedadRef

			DELETE @tmpProp WHERE NumFinca = @PropiedadRef
		END
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
/****** Object:  StoredProcedure [dbo].[csp_agregarPropietarios]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[csp_agregarPropietarios] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @valorDocID NVARCHAR(100)
		DECLARE @idEntidad INT

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

		--SELECT COUNT(*) FROM @tmpPropiet
		-- Proceso masivo
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
		BEGIN TRANSACTION

		INSERT dbo.Propietario (
			nombre,
			idTipoDocID,
			valorDocID,
			activo
			)
		SELECT tp.nombre,
			tp.idTipoDocID,
			tp.valorDocID,
			1
		FROM @tmpPropiet tp
		
		-- insert into bitacora

		WHILE (SELECT COUNT(*) FROM @tmpPropiet) > 0
		BEGIN
			SET @valorDocID = (SELECT TOP 1 tmp.valorDocID FROM @tmpPropiet tmp)
			SET @idEntidad = (SELECT P.id FROM [dbo].[Propietario] P WHERE P.valorDocID = @valorDocID)
			DELETE @tmpPropiet WHERE valorDocID = @valorDocID

			SET @jsonDespues = (SELECT 
								P.id AS 'ID', 
								P.nombre AS 'Nombre', 
								T.nombre AS 'Tipo DocID' , 
								@valorDocID AS 'Valor ID', 
								'Activo' AS 'Estado'
							FROM [dbo].[Propietario] P
							JOIN [dbo].[TipoDocID] T ON T.id = P.idTipoDocID
							WHERE P.valorDocID = @valorDocID
							FOR JSON PATH,ROOT('Propietario'))

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad, 
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
			) SELECT
				T.id,
				@idEntidad,
				@jsonDespues,
				GETDATE(),
				CONVERT(NVARCHAR(100), (SELECT @@SERVERNAME)),
				'192.168.1.7'
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'Propietario'

		END
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
/****** Object:  StoredProcedure [dbo].[csp_agregarTransConsumo]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_agregarTransConsumo] @inFecha DATE,  @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @MontoM3 MONEY
		DECLARE @NumFincaRef INT
		DECLARE @hdoc INT
		DECLARE @idTipoTrans INT
		DECLARE @tmpConsumo TABLE (
			idTipoTransConsumo INT,
			FechaXml DATE,
			LecturaM3 INT,
			Descripcion NVARCHAR(100),
			NumFinca INT
			)

		SET @MontoM3 = (
				SELECT CC.ValorM3
				FROM dbo.CC_ConsumoAgua CC
				INNER JOIN dbo.ConceptoCobro C ON C.nombre = 'Agua'
				WHERE C.id = CC.id
				)

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		INSERT INTO @tmpConsumo (
			idTipoTransConsumo,
			FechaXml,
			Descripcion,
			NumFinca,
			LecturaM3
			)
		SELECT X.id,
			X.fecha,
			X.descripcion,
			X.NumFinca,
			X.LecturaM3
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/TransConsumo', 1) WITH (
				id INT,
				fecha DATE '../@fecha',
				descripcion NVARCHAR(100),
				NumFinca INT,
				LecturaM3 INT
				) AS X
		WHERE @inFecha = fecha

		EXEC sp_xml_removedocument @hdoc;

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
		BEGIN TRANSACTION

		WHILE (SELECT COUNT(*) FROM @tmpConsumo) > 0
		BEGIN
			-- Seleccionamos la primera propiedad
			SET @NumFincaRef = (SELECT TOP 1 tmp.NumFinca FROM @tmpConsumo tmp ORDER BY tmp.NumFinca DESC)
			SET @idTipoTrans = (SELECT TOP 1 tmp.idTipoTransConsumo FROM @tmpConsumo tmp ORDER BY tmp.NumFinca DESC)

			INSERT dbo.TransaccionConsumo (
				idPropiedad,
				fecha,
				montoM3,
				LecturaConsumoM3,
				NuevoAcumuladoM3,
				activo,
				idTipoTransacCons
				)
			SELECT P.id,
				tmp.FechaXml,
				@MontoM3,
				tmp.LecturaM3,
				(CASE WHEN @idTipoTrans = 1 THEN tmp.LecturaM3
					WHEN @idTipoTrans = 2 then P.ConsumoAcumuladoM3 - tmp.LecturaM3
					ELSE P.ConsumoAcumuladoM3 + tmp.LecturaM3
				END),
				1,
				@idTipoTrans
			FROM @tmpConsumo tmp
			INNER JOIN dbo.Propiedad P ON @NumFincaRef = P.NumFinca
			WHERE tmp.NumFinca = @NumFincaRef AND tmp.idTipoTransConsumo = @idTipoTrans
	
	
			UPDATE [dbo].[Propiedad]
			SET ConsumoAcumuladoM3 = (SELECT TC.NuevoAcumuladoM3 
										FROM [dbo].[TransaccionConsumo] TC
										INNER JOIN [dbo].[Propiedad] P ON P.NumFinca = @NumFincaRef 
										WHERE TC.idPropiedad = P.id AND TC.fecha = @inFecha
												AND TC.idTipoTransacCons = @idTipoTrans)
			WHERE NumFinca = @NumFincaRef

			DELETE @tmpConsumo WHERE NumFinca = @NumFincaRef AND idTipoTransConsumo = @idTipoTrans
		END
		COMMIT 
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
/****** Object:  StoredProcedure [dbo].[csp_agregarUsuarios]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_agregarUsuarios] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @idEntidad INT
		DECLARE @Admin NVARCHAR(20)
		DECLARE @username NVARCHAR(100)

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
			password,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Usuario', 1) WITH (
				Nombre NVARCHAR(50),
				password NVARCHAR(max),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha


		EXEC sp_xml_removedocument @hdoc;
		--SELECT * FROM @tmpUsuario

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Usuario (
			username,
			passwd,
			isAdmin,
			activo
			)
		SELECT t.nombre,
			t.passwd,
			0,
			1
		FROM @tmpUsuario t


		WHILE (SELECT COUNT(*) FROM @tmpUsuario) > 0
		BEGIN
			SET @username = (SELECT TOP 1 tmp.nombre FROM @tmpUsuario tmp)
			DELETE @tmpUsuario WHERE nombre = @username

			SET @idEntidad = (SELECT U.id FROM [dbo].[Usuario] U WHERE U.username = @username)

			SET @Admin = (CASE WHEN (SELECT U.isAdmin FROM [dbo].[Usuario] U WHERE U.id = @idEntidad) = 1
							THEN 'Administrador'
							ELSE 'Cliente'
						END)
			SET @jsonDespues = (SELECT
								@idEntidad AS 'ID',
								@username AS 'Nombre Usuario', 
								'*******' AS 'Contrasenna', 
								@Admin AS 'Tipo Usuario', 
								'Activo' AS 'Estado'
								FOR JSON PATH, ROOT('Usuario'))

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad, 
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
			) SELECT
				T.id,
				@idEntidad,
				@jsonDespues,
				GETDATE(),
				CONVERT(NVARCHAR(100), (SELECT @@SERVERNAME)),
				'192.168.1.7'
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'Usuario'
		END
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
/****** Object:  StoredProcedure [dbo].[csp_cleanComprobantes]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_cleanComprobantes]
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DELETE
		FROM ComprobanteDePago
		WHERE MontoTotal = 0.00
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
/****** Object:  StoredProcedure [dbo].[csp_generarOrdCorta]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_generarOrdCorta] @inFecha DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @tmpRecibosPedientes TABLE (idPropiedad INT)
		DECLARE @idPropiedad INT

		INSERT INTO @tmpRecibosPedientes (idPropiedad)
		SELECT R.idPropiedad
		FROM [dbo].[Recibo] R
		WHERE R.idConceptoCobro = 1 AND R.esPendiente = 1

		WHILE (
				SELECT COUNT(*)
				FROM @tmpRecibosPedientes
				) > 0
		BEGIN
			-- tomar la primera propiedad
			SET @idPropiedad = (
					SELECT TOP 1 tmp.idPropiedad
					FROM @tmpRecibosPedientes tmp
			)
			IF ((SELECT COUNT(tmp.idPropiedad) FROM @tmpRecibosPedientes tmp WHERE tmp.idPropiedad = @idPropiedad) > 1
				AND (SELECT COUNT(R.id) FROM [dbo].[Recibo] R WHERE R.idConceptoCobro = 10 AND R.idPropiedad = @idPropiedad AND R.esPendiente = 1) = 0)
			BEGIN
				-- Recibo de reconexion
				INSERT INTO [dbo].[Recibo] (
					idPropiedad, 
					idConceptoCobro, 
					fecha,
					fechaVencimiento,
					monto,
					esPendiente,
					activo)
				SELECT 
					@idPropiedad,
					C.id,
					@inFecha,
					DATEADD(DAY,C.QDiasVencimiento,@inFecha),
					CF.monto,
					1,
					1
				FROM [dbo].[ConceptoCobro] C 
				INNER JOIN [dbo].[CC_Fijo] CF ON C.id = CF.id
				WHERE C.nombre = 'Reconexion de agua'

				INSERT INTO [dbo].[Reconexion] (id,activo)
				SELECT R.id,1
				FROM [dbo].[Recibo] R 
				WHERE R.idPropiedad = @idPropiedad AND idConceptoCobro = 10 AND fecha = @inFecha

				-- Generar la orden de corta
				INSERT INTO [dbo].[Corte] (idReconexion, fecha, idPropiedad, activo)
				SELECT R.id, @inFecha, @idPropiedad, 1
				FROM [dbo].[Recibo] R 
				WHERE R.idPropiedad = @idPropiedad AND idConceptoCobro = 10 AND fecha = @inFecha

			END
			DELETE @tmpRecibosPedientes
			WHERE idPropiedad = @idPropiedad
		END
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
/****** Object:  StoredProcedure [dbo].[csp_generarOrdReconexion]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_generarOrdReconexion] @inFecha DATE, @idPropiedad INT, @idRecibo INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		INSERT INTO [dbo].[Reconteca] (fecha, idReconexion, idPropiedad, activo)
		SELECT @inFecha, @idRecibo, @idPropiedad, 1
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
/****** Object:  StoredProcedure [dbo].[csp_generarReciboCCFijo]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_generarReciboCCFijo] @inFecha DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @tmpCCFijo TABLE(id INT)
		DECLARE @idCC INT
		INSERT INTO @tmpCCFijo (id)
		SELECT C.id FROM [dbo].[CC_Fijo] C

		WHILE (SELECT COUNT(*) FROM @tmpCCFijo) > 0
		BEGIN
			-- iteramos por todos los conceptos de cobro fijos
			SET @idCC = (SELECT TOP 1 tmp.id FROM @tmpCCFijo tmp)
			DELETE @tmpCCFijo WHERE id = @idCC
			
			DECLARE @DiaCobro INT = (
					SELECT C.DiaEmisionRecibo
					FROM [dbo].[ConceptoCobro] C
					WHERE C.id = @idCC
			)
			IF @DiaCobro = (
					SELECT DAY(@inFecha)
					)
			BEGIN
				DECLARE @tmpPropiedadesTipoCC TABLE (idPropiedad INT)

				INSERT INTO @tmpPropiedadesTipoCC (idPropiedad)
				SELECT CP.idPropiedad
				FROM [dbo].[CCenPropiedad] CP
				WHERE CP.idConceptoCobro = @idCC

				INSERT INTO [dbo].[Recibo] (
					idPropiedad,
					idConceptoCobro,
					fecha,
					fechaVencimiento,
					monto,
					esPendiente,
					Activo
					)
				SELECT tmp.idPropiedad,
					@idCC,
					@inFecha,
					DATEADD(DAY, CC.QDiasVencimiento, @inFecha),
					CF.Monto,
					1,
					1
				FROM @tmpPropiedadesTipoCC tmp
				INNER JOIN [dbo].[ConceptoCobro] CC ON @idCC = CC.id
				INNER JOIN [dbo].[CC_Fijo] CF ON @idCC = CF.id
			END
		END
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
/****** Object:  StoredProcedure [dbo].[csp_generarReciboCCPorcentaje]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_generarReciboCCPorcentaje] @inFecha DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @tmpCCPorcentaje TABLE (id INT)
		DECLARE @idCC INT

		INSERT INTO @tmpCCPorcentaje(id)
		SELECT CP.id FROM [dbo].[CC_Porcentaje] CP

		WHILE (SELECT COUNT(*) FROM @tmpCCPorcentaje) > 0
		BEGIN
			-- iteramos por cada concepto cobro porcentual
			SET @idCC = (SELECT TOP 1 tmp.id FROM @tmpCCPorcentaje tmp ORDER BY tmp.id DESC)
			DELETE @tmpCCPorcentaje WHERE id = @idCC

			DECLARE @Monto MONEY
			DECLARE @Porcentaje FLOAT
			DECLARE @idPropiedad INT
			DECLARE @QDias INT
			DECLARE @DiaCobro INT = (
					SELECT C.DiaEmisionRecibo
					FROM [dbo].[ConceptoCobro] C
					WHERE C.id = @idCC
					)

			IF @DiaCobro = (
					SELECT DAY(@inFecha)
					)
			BEGIN

				DECLARE @tmpPropiedadesTipoCC TABLE (
					idPropiedad INT,
					valor MONEY
					)
				DECLARE @tmpRecibos TABLE (
					idPropiedad INT,
					idConceptoCobro INT,
					Monto MONEY
					)

				SET @Porcentaje = (
						SELECT CC.ValorPorcentaje
						FROM [dbo].[CC_Porcentaje] CC
						WHERE CC.id = @idCC
						)
				SET @QDias = (
						SELECT C.QDiasVencimiento
						FROM [dbo].[ConceptoCobro] C
						WHERE C.id = @idCC
						)

				INSERT INTO @tmpPropiedadesTipoCC (
					idPropiedad,
					valor
					)
				SELECT CP.idPropiedad,
					P.Valor
				FROM [dbo].[CCenPropiedad] CP
				INNER JOIN [dbo].[Propiedad] P ON CP.idPropiedad = P.id
				WHERE CP.idConceptoCobro = @idCC

				WHILE (
						SELECT COUNT(*)
						FROM @tmpPropiedadesTipoCC
						) > 0
				BEGIN
					-- seleccionamos la primera propiedad
					SET @idPropiedad = (SELECT TOP 1 tmp.idPropiedad
					FROM @tmpPropiedadesTipoCC tmp ORDER BY tmp.idPropiedad DESC)

					SET @Monto = (
							(SELECT tmp.valor
							FROM @tmpPropiedadesTipoCC tmp
							WHERE tmp.idPropiedad = @idPropiedad) 
							* (@Porcentaje / 100)
							)

					-- Quitamos esta propiedad de la tabla
					DELETE @tmpPropiedadesTipoCC
					WHERE @idPropiedad = idPropiedad

					INSERT INTO @tmpRecibos (
						idPropiedad,
						idConceptoCobro,
						Monto
						)
					SELECT @idPropiedad,
						@idCC,	
						@Monto
				END
			END
			SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
			BEGIN TRANSACTION

			INSERT INTO [dbo].[Recibo] (
				idPropiedad,
				idConceptoCobro,
				fecha,
				fechaVencimiento,
				monto,
				esPendiente,
				activo
				)
			SELECT tmpR.idPropiedad,
				tmpR.idConceptoCobro,
				@inFecha,
				DATEADD(DAY, @QDias, @inFecha),
				tmpR.Monto,
				1,
				1
			FROM @tmpRecibos tmpR

			COMMIT
			RETURN 1
		END
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
/****** Object:  StoredProcedure [dbo].[csp_generarReciboReconexiónAgua]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_generarReciboReconexiónAgua] @inFecha DATE,
@inIdPropiedad INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		INSERT INTO [dbo].[Recibo] (
			idPropiedad,
			idConceptoCobro,
			fecha,
			fechaVencimiento,
			monto,
			esPendiente,
			activo
			)
		SELECT 
			@inIdPropiedad,
			C.id,
			@inFecha,
			@inFecha,
			CF.Monto,
			0,
			1
		FROM [dbo].[ConceptoCobro] C
		INNER JOIN [dbo].[CC_Fijo] CF ON C.id = CF.id
		WHERE C.nombre = 'Reconexion de agua'
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
/****** Object:  StoredProcedure [dbo].[csp_generarRecibosAgua]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_generarRecibosAgua] @inFecha DATE
AS
BEGIN
	BEGIN TRY
		DECLARE @idCCAgua INT
		DECLARE @Monto MONEY
		DECLARE @ValorM3 MONEY
		DECLARE @MontoMinimo MONEY
		DECLARE @QDias INT
		DECLARE @ConsumoM3 INT
		DECLARE @UltimoConsumoM3 INT
		DECLARE @DiaCobro INT
		DECLARE @idPropiedad INT

		SET NOCOUNT ON

		SELECT @DiaCobro = (
				SELECT C.DiaEmisionRecibo
				FROM [dbo].[ConceptoCobro] C
				WHERE C.nombre = 'Agua'
				)

		IF @DiaCobro = (
				SELECT DAY(@inFecha)
				)
		BEGIN

			DECLARE @tmpPropiedadesCC_Agua TABLE (idPropiedad INT)
			DECLARE @tmpRecibos TABLE (
				idPropiedad INT,
				idConceptoCobro INT,
				Fecha DATE,
				FechaVencimiento DATE,
				Monto MONEY
				)

			SET @idCCAgua = (
					SELECT C.id
					FROM [dbo].[ConceptoCobro] C
					WHERE C.nombre = 'Agua'
					)
			SET @ValorM3 = (
					SELECT CA.ValorM3
					FROM [dbo].[CC_ConsumoAgua] CA
					WHERE CA.id = @idCCAgua
					)
			SET @MontoMinimo = (
					SELECT CA.MontoMinimo
					FROM [dbo].[CC_ConsumoAgua] CA
					WHERE CA.id = @idCCAgua
					)
			SET @QDias = (
					SELECT CC.QDiasVencimiento
					FROM [dbo].[ConceptoCobro] CC
					WHERE CC.id = @idCCAgua
					)

			INSERT INTO @tmpPropiedadesCC_Agua (idPropiedad)
			SELECT CP.idPropiedad
			FROM [dbo].[CCenPropiedad] CP
			WHERE CP.idConceptoCobro = @idCCAgua

			WHILE (
					SELECT COUNT(*)
					FROM @tmpPropiedadesCC_Agua
					) > 0
			BEGIN
				-- Tomamos la primera propiedad
				SELECT TOP 1 @idPropiedad = tmp.idPropiedad
				FROM @tmpPropiedadesCC_Agua tmp
				-- Luego la eliminamos de la tabla
				DELETE @tmpPropiedadesCC_Agua
				WHERE idPropiedad = @idPropiedad
				
				-- Verificar si existe una recibo de reconexion sin pagar 
				-- quiere decir que el agua esta cortada y no deberia realizar recibos de agua				
				IF (SELECT COUNT(R.id) FROM [dbo].[Recibo] R 
					WHERE R.idPropiedad = @idPropiedad AND
					R.esPendiente = 1 AND R.idConceptoCobro = 10) = 0 
				BEGIN
					-- obtenemos el consumo
					SET @ConsumoM3 = (
							SELECT P.ConsumoAcumuladoM3
							FROM [dbo].[Propiedad] P
							WHERE P.id = @idPropiedad
							)
					-- el consumo hasta el ultimo recibo generado
					SET @UltimoConsumoM3 = (
							SELECT P.UltimoConsumoM3
							FROM [dbo].[Propiedad] P
							WHERE P.id = @idPropiedad
							)
					-- calculamos el monto cosumido en el ultimo mes
					SET @Monto = CASE 
							WHEN (@ConsumoM3 - @UltimoConsumoM3) * @ValorM3 > @MontoMinimo
								THEN (@ConsumoM3 - @UltimoConsumoM3) * @ValorM3
							ELSE @MontoMinimo
							END

					-- Creamos el recibo temporal 
					INSERT INTO @tmpRecibos (
						idPropiedad,
						idConceptoCobro,
						Fecha,
						FechaVencimiento,
						Monto
						)
					SELECT @idPropiedad,
						@idCCAgua,
						@inFecha,
						DATEADD(DAY, @QDias, @inFecha),
						@Monto
				END
			END	
		END
		-- Agreamos otra vez las propiedades 
		INSERT INTO @tmpPropiedadesCC_Agua (idPropiedad)
		SELECT CP.idPropiedad
		FROM [dbo].[CCenPropiedad] CP
		WHERE CP.idConceptoCobro = @idCCAgua

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT INTO [dbo].[Recibo] (
			idPropiedad,
			idConceptoCobro,
			fecha,
			fechaVencimiento,
			monto,
			esPendiente,
			Activo
			)
		SELECT tmpR.idPropiedad,
			tmpR.idConceptoCobro,
			tmpR.Fecha,
			tmpR.FechaVencimiento,
			tmpR.Monto,
			1,
			1
		FROM @tmpRecibos tmpR

		WHILE (
				SELECT COUNT(*)
				FROM @tmpPropiedadesCC_Agua
				) > 0
		BEGIN
			SET @idPropiedad = (SELECT TOP 1 tmp.idPropiedad
			FROM @tmpPropiedadesCC_Agua tmp ORDER BY tmp.idPropiedad DESC)

			UPDATE [dbo].[Propiedad]
			SET UltimoConsumoM3 = ConsumoAcumuladoM3
			WHERE id = @idPropiedad

			-- insert change into bitacora
			DELETE @tmpPropiedadesCC_Agua
			WHERE idPropiedad = @idPropiedad
		END
		COMMIT
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
/****** Object:  StoredProcedure [dbo].[csp_getBitacoraFromTipoEntidad]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getBitacoraFromTipoEntidad] @inTipoEntidad NVARCHAR(50),
	@inFechaInicio DATE,
	@inFechaFin DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idTipoEnt INT

		SET @idTipoEnt = (
				SELECT T.id
				FROM dbo.TipoEntidad T
				WHERE t.Nombre = @inTipoEntidad
				)

		PRINT (@idTipoEnt)

		SELECT B.id AS [id],
			@inTipoEntidad AS [TE],
			B.insertedAt AS [inAt],
			B.insertedBy AS [inBy],
			B.insertedIn AS [inIN]
		FROM Bitacora B
		WHERE B.idTipoEntidad = @idTipoEnt
			AND B.insertedAt BETWEEN @inFechaInicio
				AND @inFechaFin
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
/****** Object:  StoredProcedure [dbo].[csp_getComprobantes]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getComprobantes] @inNumFinca INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idRef INT
		DECLARE @tmpIdComprob TABLE (idComprobante INT)
		DECLARE @tmpComprobantes TABLE (
			idComprobante INT,
			fecha DATE,
			Monto MONEY
			)

		INSERT INTO @tmpIdComprob (idComprobante)
		SELECT DISTINCT R.idComprobantePago
		FROM [dbo].[Recibo] R
		INNER JOIN [dbo].[Propiedad] P ON @inNumFinca = P.NumFinca
		WHERE R.idPropiedad = P.id
			AND R.activo = 1
			AND R.esPendiente = 0
		WHILE (
				SELECT COUNT(*)
				FROM @tmpIdComprob
				) > 0
		BEGIN
			SET @idRef = (
					SELECT TOP 1 tmp.idComprobante
					FROM @tmpIdComprob tmp
					)

			DELETE @tmpIdComprob
			WHERE idComprobante = @idRef

			INSERT @tmpComprobantes (
				idComprobante,
				fecha,
				Monto
				)
			SELECT @idRef,
				cmp.fecha,
				cmp.MontoTotal
			FROM [dbo].[ComprobanteDePago] cmp
			WHERE cmp.id = @idRef
		END

		SELECT cmp.idComprobante AS [Numero Comprobante],
			cmp.fecha AS [Fecha],
			cmp.Monto AS [Monto Total]
		FROM @tmpComprobantes cmp
		ORDER BY cmp.fecha ASC
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
/****** Object:  StoredProcedure [dbo].[csp_getDocidIDFromName]    Script Date: 7/16/2020 19:37:41 ******/
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
				AND d.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getJsonAntes]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getJsonAntes] @inBitacoraID INT,
	@outJson VARCHAR(max) OUTPUT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET @outJson = (
				SELECT b.jsonAntes
				FROM Bitacora b
				WHERE b.id = @inBitacoraID
				)

		RETURN 0
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
/****** Object:  StoredProcedure [dbo].[csp_getJsonDespues]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getJsonDespues] @inBitacoraID INT,
	@outJson VARCHAR(max) OUTPUT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET @outJson = (
				SELECT b.jsonDespues
				FROM Bitacora b
				WHERE b.id = @inBitacoraID
				)

		RETURN 0
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
/****** Object:  StoredProcedure [dbo].[csp_getPropiedades]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropiedades]
AS
BEGIN
	SELECT P.numFinca AS [numFin],
		CAST(P.valor  AS int) AS [val],
		P.Direccion AS [dir],
		P.ConsumoAcumuladoM3 as [cAm3],
		P.UltimoConsumoM3 as [uCm3],
		P.id as [id]
	FROM Propiedad P
	WHERE P.activo = 1
END
	--EXEC csp_getPropiedades
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadesDePropietario]    Script Date: 7/16/2020 19:37:41 ******/
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
		AND PP.activo = 1
	WHERE @idPropietario = PP.idPropietario
		AND P.activo = 1
END
	--EXEC csp_getPropiedadesDePropietario 301410305
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadesDeUsuario]    Script Date: 7/16/2020 19:37:41 ******/
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
    WHERE @idUser = UVP.idUsuario AND UVP.activo = 1

END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadesFromPropietarioDocID]    Script Date: 7/16/2020 19:37:41 ******/
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

		SELECT p.NumFinca AS 'Número de propiedad',
			p.Valor AS 'Valor monetario',
			p.Direccion AS 'Dirección'
		FROM Propiedad p
		JOIN PropiedadDelPropietario pdp ON pdp.idPropiedad = p.id
			AND pdp.activo = 1
		WHERE @idPropietario = pdp.idPropietario 
		AND p.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getPropiedadIDFromNumFinca]    Script Date: 7/16/2020 19:37:41 ******/
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
				AND p.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getPropietarioIDFromDocID]    Script Date: 7/16/2020 19:37:41 ******/
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
				AND p.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getPropietarios]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getPropietarios]
AS
BEGIN
	SELECT p.nombre AS [name],
		p.valorDocID AS [docid],
		t.nombre AS [tid],
		p.id AS [id]
	FROM Propietario p
	JOIN TipoDocID t ON t.id = p.idTipoDocID
	WHERE p.activo = 1
	ORDER BY p.nombre
END
GO
/****** Object:  StoredProcedure [dbo].[csp_getPropietariosFromNumFinca]    Script Date: 7/16/2020 19:37:41 ******/
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
			AND pdp.activo = 1
		WHERE @idPropiedad = pdp.idPropiedad
		AND p.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getRecibosPagados]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getRecibosPagados] @inNumFinca INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		SELECT @inNumFinca AS [Numero Finca],
			R.idComprobantePago AS [Comprobante de Pago],
			C.nombre AS [Concepto Cobro],
			R.fecha AS [Fecha de Emision],
			R.fechaVencimiento AS [Fecha Vencimiento],
			R.monto AS [Monto Total]
		FROM [dbo].[Recibo] R
		INNER JOIN [dbo].[ConceptoCobro] C ON R.idConceptoCobro = C.id
		INNER JOIN [dbo].[Propiedad] P ON P.NumFinca = @inNumFinca
		WHERE R.esPendiente = 0
			AND R.activo = 1
			AND R.idPropiedad = P.id
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
/****** Object:  StoredProcedure [dbo].[csp_getRecibosPendientes]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getRecibosPendientes] @inNumFinca INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		SELECT @inNumFinca AS [Numero Finca],
			C.nombre AS [Concepto Cobro],
			R.fecha AS [Fecha de Emision],
			R.fechaVencimiento AS [Fecha Vencimiento],
			R.monto AS [Monto Total]
		FROM [dbo].[Recibo] R
		INNER JOIN [dbo].[ConceptoCobro] C ON R.idConceptoCobro = C.id
		INNER JOIN [dbo].[Propiedad] P ON P.NumFinca = @inNumFinca
		WHERE R.esPendiente = 1
			AND R.activo = 1
			AND R.idPropiedad = P.id
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
/****** Object:  StoredProcedure [dbo].[csp_getUserIDFromUsername]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getUserIDFromUsername] @inputUsername NVARCHAR(50),
	@outputID INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET @outputID = (
				SELECT TOP 1 u.id
				FROM Usuario u
				WHERE u.username = @inputUsername
					AND u.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getUsernames]    Script Date: 7/16/2020 19:37:41 ******/
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
		WHERE u.activo = 1
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
/****** Object:  StoredProcedure [dbo].[csp_getUsuarioFromNumFinca]    Script Date: 7/16/2020 19:37:41 ******/
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
		AND uvp.activo = 1
		WHERE @idPropiedad = uvp.idPropiedad
		AND u.activo = 1

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
/****** Object:  StoredProcedure [dbo].[csp_getUsuarios]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_getUsuarios]
AS
BEGIN
	SELECT u.username AS [usr],
		'*****' AS [psswd],
		u.isAdmin AS [isAdmin],
		u.id AS [id]
	FROM Usuario u
	WHERE u.activo = 1
	ORDER BY u.username
END
GO
/****** Object:  StoredProcedure [dbo].[csp_linkCCenPropiedad]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkCCenPropiedad] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

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
		EXEC sp_xml_removedocument @hdoc;
		--select * from @tmpCCenProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.CCenPropiedad (
			idConceptoCobro,
			idPropiedad,
			fechaInicio,
			activo
			)
		SELECT cp.idcobro,
			P.id,
			@fechaInput,
			1
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
/****** Object:  StoredProcedure [dbo].[csp_linkPropiedadDelPropietario]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkPropiedadDelPropietario] @fechaInput DATE,
	@OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @FincaRef INT
		DECLARE @PropRef NVARCHAR(100)
		DECLARE @idEntidad INT
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

		EXEC sp_xml_removedocument @hdoc;

		--select * from @tmpProtxProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.PropiedadDelPropietario (
			idPropiedad,
			idPropietario,
			activo
			)
		SELECT PO.id,
			P.id,
			1
		FROM @tmpProtxProp AS tmp
		JOIN Propietario P ON P.valorDocID = tmp.identificacion
		JOIN Propiedad PO ON PO.NumFinca = tmp.NumFinca

		--select * from PropiedadDelPropietario
		WHILE (
				SELECT COUNT(*)
				FROM @tmpProtxProp
				) > 0
		BEGIN
			SET @FincaRef = (
					SELECT TOP 1 tmp.NumFinca
					FROM @tmpProtxProp tmp
					)
			SET @PropRef = (
					SELECT TOP 1 tmp.identificacion
					FROM @tmpProtxProp tmp
					)

			DELETE @tmpProtxProp
			WHERE NumFinca = @FincaRef
				AND identificacion = @PropRef

			SET @idEntidad = (
					SELECT pp.id
					FROM [dbo].[PropiedadDelPropietario] pp
					INNER JOIN Propietario P ON P.valorDocID = @PropRef
					INNER JOIN Propiedad PO ON PO.NumFinca = @FincaRef
					WHERE P.id = pp.idPropietario
						AND PO.id = pp.idPropiedad
					)
			SET @jsonDespues = (
					SELECT @FincaRef AS 'Numero Finca',
						P.nombre AS 'Propietario',
						@PropRef AS 'Identificacion',
						'activo' AS 'Estado'
					FROM [dbo].[Propietario] P
					WHERE P.valorDocID = @PropRef
					FOR JSON PATH,
						ROOT('Propiedad-Propietario')
					)

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad,
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
				)
			SELECT T.id,
				@idEntidad,
				@jsonDespues,
				@fechaInput,
				CONVERT(NVARCHAR(100), (
						SELECT @@SERVERNAME
						)),
				'SERVER IP'
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsPropietario'
				AND @idEntidad != NULL
		END

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
/****** Object:  StoredProcedure [dbo].[csp_linkUsuarioVsPropiedad]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_linkUsuarioVsPropiedad] @fechaInput DATE, @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @UserRef NVARCHAR(100)
		DECLARE @PropiedadRef INT 
		DECLARE @idEntidad INT
		DECLARE @jsonDespues NVARCHAR(500)
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


		EXEC sp_xml_removedocument @hdoc;
		--select * from @tmpUSvsProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT UsuarioVsPropiedad (
			idUsuario,
			idPropiedad,
			activo
			)
		SELECT U.id,
			P.id,
			1
		FROM @tmpUSvsProp tmp
		INNER JOIN Usuario U ON U.username = tmp.nombreUsuario
		INNER JOIN Propiedad P ON P.NumFinca = tmp.NumFinca

		--insert register into bitacora
		WHILE (SELECT COUNT(*) FROM @tmpUSvsProp) > 0
		BEGIN
			SET @UserRef = (SELECT TOP 1 tmp.nombreUsuario FROM @tmpUSvsProp tmp)
			SET @PropiedadRef = (SELECT TOP 1 tmp.NumFinca FROM @tmpUSvsProp tmp)
			DELETE @tmpUSvsProp WHERE nombreUsuario = @UserRef AND NumFinca = @PropiedadRef

			SET @idEntidad = (SELECT UP.id FROM [dbo].[UsuarioVsPropiedad] UP
								INNER JOIN [dbo].[Usuario] U ON U.username = @UserRef
								INNER JOIN [dbo].[Propiedad] P ON P.NumFinca = @PropiedadRef
								WHERE UP.idPropiedad = P.id AND UP.idUsuario = U.id)

			SET @jsonDespues = (SELECT 
								@UserRef AS 'Nombre Usuario',
								@PropiedadRef AS 'Numero Finca',
								'activo' AS 'Estado'
								FOR JSON PATH, ROOT('Propiedad-Usuario'))

			INSERT INTO [dbo].[Bitacora] (
				idTipoEntidad,
				idEntidad, 
				jsonDespues,
				insertedAt,
				insertedBy,
				insertedIn
			) SELECT
				T.id,
				@idEntidad,
				@jsonDespues,
				GETDATE(),
				CONVERT(NVARCHAR(100), (SELECT @@SERVERNAME)),
				'192.168.1.7'
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsUsuario'		
		END
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
/****** Object:  StoredProcedure [dbo].[csp_RealizarPago]    Script Date: 7/16/2020 19:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
	

 PROC [dbo].[csp_RealizarPago] @inNumFinca INT,
	@inIdComprobante INT,
	@inFecha DATE,
	@idTipoCC INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idRecibo INT
		DECLARE @FechaVenc DATE
		DECLARE @InterestMot MONEY
		DECLARE @MontoRecibo MONEY
		DECLARE @TasaInterest FLOAT
		DECLARE @tmpReciboPediente TABLE (id INT)

		-- tomo todos los recibos del Tipo CC pedientes
		INSERT INTO @tmpReciboPediente
		SELECT R.id
		FROM [dbo].[Recibo] R
		INNER JOIN [dbo].[Propiedad] P ON P.NumFinca = @inNumFinca
		WHERE R.esPendiente = 1
			AND R.idPropiedad = P.id
			AND R.activo = 1
			AND idConceptoCobro = @idTipoCC
		ORDER BY R.fecha ASC

		SET @TasaInterest = (
				SELECT CC.TasaInteresesMoratorios
				FROM [dbo].[ConceptoCobro] CC
				WHERE CC.id = @idTipoCC
				)

		BEGIN TRANSACTION

		WHILE (
				SELECT COUNT(*)
				FROM @tmpReciboPediente
				) > 0
		BEGIN
			SET @idRecibo = (
					SELECT TOP 1 tmp.id
					FROM @tmpReciboPediente tmp
					)

			DELETE @tmpReciboPediente
			WHERE id = @idRecibo

			SET @FechaVenc = (
					SELECT R.fechaVencimiento
					FROM [dbo].[Recibo] R
					WHERE R.id = @idRecibo
					)
			SET @MontoRecibo = (
					SELECT R.monto
					FROM [dbo].[Recibo] R
					WHERE R.id = @idRecibo
					)
			SET @InterestMot = CASE 
					WHEN @inFecha <= @FechaVenc
						THEN 0
					ELSE (@MontoRecibo * @TasaInterest / 365) * ABS(DATEDIFF(DAY, @FechaVenc, @inFecha))
					END

			-- Si existen intereses moratorios entonces generamos un recibo por el monto
			IF @InterestMot > 0
			BEGIN
				INSERT INTO [dbo].[Recibo] (
					idComprobantePago,
					idPropiedad,
					idConceptoCobro,
					fecha,
					fechaVencimiento,
					monto,
					esPendiente,
					Activo
					)
				SELECT @inIdComprobante,
					P.id,
					CC.id,
					@inFecha,
					@inFecha,
					@InterestMot,
					0,
					1
				FROM [dbo].[Propiedad] P
				JOIN [dbo].[ConceptoCobro] CC ON CC.nombre = 'Interes Moratorio'
				WHERE P.NumFinca = @inNumFinca

				-- incluimos en monto del recibo en el comprobante
				UPDATE [dbo].[ComprobanteDePago]
				SET MontoTotal = MontoTotal + @InterestMot
				WHERE id = @inIdComprobante
			END

			-- Actualizo los valores del recibo
			UPDATE [dbo].[Recibo]
			SET esPendiente = 0
			WHERE id = @idRecibo

			-- Actualizo el idComprobante
			UPDATE [dbo].[Recibo]
			SET idComprobantePago = @inIdComprobante
			WHERE id = @idRecibo

			-- Actualizo el monto total del comprobante
			UPDATE [dbo].[ComprobanteDePago]
			SET MontoTotal = MontoTotal + (
					SELECT R.monto
					FROM [dbo].[Recibo] R
					WHERE R.id = @idRecibo
					)
			WHERE id = @inIdComprobante

			IF EXISTS (SELECT RE.id FROM [dbo].[Reconexion] RE WHERE RE.id = @idRecibo)
			BEGIN
				EXEC csp_RealizarPago @inNumFinca, @inIdComprobante, @inFecha, 1
				DECLARE @idPropiedad INT = (SELECT P.id FROM [dbo].[Propiedad] P WHERE P.NumFinca = @inNumFinca)
				EXEC csp_generarOrdReconexion @inFecha, @idPropiedad, @idRecibo
			END
		END

		COMMIT
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
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 7/16/2020 19:37:41 ******/
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
				AND U.activo = 1
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
