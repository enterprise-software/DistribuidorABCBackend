USE [master]
GO
/****** Object:  Database [DbDistributorABC]    Script Date: 04/09/2023 07:38:17 a. m. ******/
CREATE DATABASE [DbDistributorABC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbDistributorABC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbDistributorABC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbDistributorABC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbDistributorABC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbDistributorABC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbDistributorABC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbDistributorABC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbDistributorABC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbDistributorABC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbDistributorABC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbDistributorABC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbDistributorABC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbDistributorABC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbDistributorABC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbDistributorABC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbDistributorABC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbDistributorABC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbDistributorABC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbDistributorABC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbDistributorABC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbDistributorABC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbDistributorABC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbDistributorABC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbDistributorABC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbDistributorABC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbDistributorABC] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DbDistributorABC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbDistributorABC] SET RECOVERY FULL 
GO
ALTER DATABASE [DbDistributorABC] SET  MULTI_USER 
GO
ALTER DATABASE [DbDistributorABC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbDistributorABC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbDistributorABC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbDistributorABC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbDistributorABC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbDistributorABC', N'ON'
GO
ALTER DATABASE [DbDistributorABC] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbDistributorABC] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbDistributorABC]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04/09/2023 07:38:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/09/2023 07:38:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[RetailPrice] [decimal](18, 2) NOT NULL,
	[WholeSalePrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StowageNumbers]    Script Date: 04/09/2023 07:38:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StowageNumbers](
	[StowageNumberId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StowageId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_StowageNumbers] PRIMARY KEY CLUSTERED 
(
	[StowageNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stowages]    Script Date: 04/09/2023 07:38:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stowages](
	[StowageId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Stowages] PRIMARY KEY CLUSTERED 
(
	[StowageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230903224959_initialDb', N'7.0.10')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [RetailPrice], [WholeSalePrice]) VALUES (1, N'Producto 1', N'Descripción producto 1', CAST(42.50 AS Decimal(18, 2)), CAST(45.20 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[StowageNumbers] ON 

INSERT [dbo].[StowageNumbers] ([StowageNumberId], [Name], [StowageId], [ProductId]) VALUES (1, N'2', 2, 1)
SET IDENTITY_INSERT [dbo].[StowageNumbers] OFF
GO
SET IDENTITY_INSERT [dbo].[Stowages] ON 

INSERT [dbo].[Stowages] ([StowageId], [Description], [Capacity]) VALUES (1, N'Estiba 1', 5)
INSERT [dbo].[Stowages] ([StowageId], [Description], [Capacity]) VALUES (2, N'Estiba 2', 10)
INSERT [dbo].[Stowages] ([StowageId], [Description], [Capacity]) VALUES (3, N'Estiba 3', 2)
INSERT [dbo].[Stowages] ([StowageId], [Description], [Capacity]) VALUES (4, N'Estiba 4', 15)
SET IDENTITY_INSERT [dbo].[Stowages] OFF
GO
/****** Object:  Index [IX_StowageNumbers_ProductId]    Script Date: 04/09/2023 07:38:17 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_StowageNumbers_ProductId] ON [dbo].[StowageNumbers]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StowageNumbers_StowageId]    Script Date: 04/09/2023 07:38:17 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_StowageNumbers_StowageId] ON [dbo].[StowageNumbers]
(
	[StowageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StowageNumbers]  WITH CHECK ADD  CONSTRAINT [FK_StowageNumbers_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StowageNumbers] CHECK CONSTRAINT [FK_StowageNumbers_Products_ProductId]
GO
ALTER TABLE [dbo].[StowageNumbers]  WITH CHECK ADD  CONSTRAINT [FK_StowageNumbers_Stowages_StowageId] FOREIGN KEY([StowageId])
REFERENCES [dbo].[Stowages] ([StowageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StowageNumbers] CHECK CONSTRAINT [FK_StowageNumbers_Stowages_StowageId]
GO
USE [master]
GO
ALTER DATABASE [DbDistributorABC] SET  READ_WRITE 
GO
