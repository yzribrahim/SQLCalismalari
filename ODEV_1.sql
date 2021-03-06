USE [master]
GO
/****** Object:  Database [ODEV_1]    Script Date: 20.09.2021 14:43:06 ******/
CREATE DATABASE [ODEV_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ODEV_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ODEV_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ODEV_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ODEV_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ODEV_1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ODEV_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ODEV_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ODEV_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ODEV_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ODEV_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ODEV_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ODEV_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ODEV_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ODEV_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ODEV_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ODEV_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ODEV_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ODEV_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ODEV_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ODEV_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ODEV_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ODEV_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ODEV_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ODEV_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ODEV_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ODEV_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ODEV_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ODEV_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ODEV_1] SET RECOVERY FULL 
GO
ALTER DATABASE [ODEV_1] SET  MULTI_USER 
GO
ALTER DATABASE [ODEV_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ODEV_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ODEV_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ODEV_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ODEV_1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ODEV_1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ODEV_1', N'ON'
GO
ALTER DATABASE [ODEV_1] SET QUERY_STORE = OFF
GO
USE [ODEV_1]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 20.09.2021 14:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](200) NOT NULL,
	[PhoneCode] [nvarchar](10) NULL,
	[PlateCode] [nvarchar](10) NULL,
	[CountryId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counties]    Script Date: 20.09.2021 14:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counties](
	[CountyId] [int] IDENTITY(1,1) NOT NULL,
	[CountyName] [nvarchar](200) NULL,
	[CityId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Counties] PRIMARY KEY CLUSTERED 
(
	[CountyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 20.09.2021 14:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[PhoneCode] [nvarchar](10) NULL,
	[IsoCode] [nvarchar](10) NULL,
	[Currency] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 20.09.2021 14:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](200) NOT NULL,
	[CountyId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (1, N'ISTANBUL', N'212', N'34', 3, CAST(N'2021-09-20T14:08:17.920' AS DateTime))
INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (2, N'ANKARA', N'312', N'06', 3, CAST(N'2021-09-20T14:08:41.253' AS DateTime))
INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (3, N'IZMIR', N'232', N'35', 3, CAST(N'2021-09-20T14:09:11.647' AS DateTime))
INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (4, N'CHICAGO', N'312', NULL, 1, CAST(N'2021-09-20T14:13:09.000' AS DateTime))
INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (5, N'NEW YORK', NULL, NULL, 1, CAST(N'2021-09-20T14:13:22.693' AS DateTime))
INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (6, N'LONDRA', NULL, NULL, 6, CAST(N'2021-09-20T14:13:41.713' AS DateTime))
INSERT [dbo].[Cities] ([CityId], [CityName], [PhoneCode], [PlateCode], [CountryId], [CreatedDate]) VALUES (7, N'BERLIN', NULL, NULL, 4, CAST(N'2021-09-20T14:14:26.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Counties] ON 

INSERT [dbo].[Counties] ([CountyId], [CountyName], [CityId], [CreatedDate]) VALUES (1, N'SARIYER', 1, CAST(N'2021-09-20T14:15:56.597' AS DateTime))
INSERT [dbo].[Counties] ([CountyId], [CountyName], [CityId], [CreatedDate]) VALUES (2, N'BORNOVA', 3, CAST(N'2021-09-20T14:16:09.940' AS DateTime))
INSERT [dbo].[Counties] ([CountyId], [CountyName], [CityId], [CreatedDate]) VALUES (3, N'CANKAYA', 2, CAST(N'2021-09-20T14:16:37.340' AS DateTime))
INSERT [dbo].[Counties] ([CountyId], [CountyName], [CityId], [CreatedDate]) VALUES (4, N'BAKIRKOY', 1, CAST(N'2021-09-20T14:17:44.267' AS DateTime))
SET IDENTITY_INSERT [dbo].[Counties] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [CountryName], [PhoneCode], [IsoCode], [Currency], [CreatedDate]) VALUES (1, N'ABD', N'+1', N'US', N'USD', CAST(N'2021-09-20T14:03:13.813' AS DateTime))
INSERT [dbo].[Countries] ([CountryId], [CountryName], [PhoneCode], [IsoCode], [Currency], [CreatedDate]) VALUES (3, N'TURKEY', N'+90', N'TR', N'TL', CAST(N'2021-09-20T14:04:01.743' AS DateTime))
INSERT [dbo].[Countries] ([CountryId], [CountryName], [PhoneCode], [IsoCode], [Currency], [CreatedDate]) VALUES (4, N'GERMANY', N'+49', N'DE', N'EURO', CAST(N'2021-09-20T14:04:43.820' AS DateTime))
INSERT [dbo].[Countries] ([CountryId], [CountryName], [PhoneCode], [IsoCode], [Currency], [CreatedDate]) VALUES (6, N'UNITED KINGDOM	', N'+44', N'GB', N'STERLIN', CAST(N'2021-09-20T14:06:58.847' AS DateTime))
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [CountyId], [CreatedDate]) VALUES (2, N'OSMANIYE', 4, CAST(N'2021-09-20T14:19:03.097' AS DateTime))
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [CountyId], [CreatedDate]) VALUES (3, N'KARTALTEPE', 4, CAST(N'2021-09-20T14:19:15.023' AS DateTime))
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
ALTER TABLE [dbo].[Cities] ADD  CONSTRAINT [DF_Cities_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Counties] ADD  CONSTRAINT [DF_Counties_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Districts] ADD  CONSTRAINT [DF_Districts_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Counties]  WITH CHECK ADD  CONSTRAINT [FK_Counties_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Counties] CHECK CONSTRAINT [FK_Counties_Cities]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Counties] FOREIGN KEY([CountyId])
REFERENCES [dbo].[Counties] ([CountyId])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Counties]
GO
USE [master]
GO
ALTER DATABASE [ODEV_1] SET  READ_WRITE 
GO
