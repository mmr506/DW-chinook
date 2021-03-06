USE [master]
GO
/****** Object:  Database [Chinook_SA]    Script Date: 3/5/2016 7:51:11 PM ******/
CREATE DATABASE [Chinook_SA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'chinnok_sa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\chinnok_sa.mdf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'chinnok_sa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\chinnok_sa_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Chinook_SA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chinook_SA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chinook_SA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chinook_SA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chinook_SA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chinook_SA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chinook_SA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chinook_SA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chinook_SA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chinook_SA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chinook_SA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chinook_SA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chinook_SA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chinook_SA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chinook_SA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chinook_SA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chinook_SA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chinook_SA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chinook_SA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chinook_SA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chinook_SA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chinook_SA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chinook_SA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chinook_SA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chinook_SA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chinook_SA] SET  MULTI_USER 
GO
ALTER DATABASE [Chinook_SA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chinook_SA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chinook_SA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chinook_SA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Chinook_SA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Chinook_SA', N'ON'
GO
USE [Chinook_SA]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumId] [int] NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[ArtistId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artist]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistId] [int] NOT NULL,
	[Name] [nvarchar](120) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Company] [nvarchar](80) NULL,
	[Address] [nvarchar](70) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[Email] [nvarchar](60) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] NOT NULL,
	[Name] [nvarchar](120) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[BillingAddress] [nvarchar](70) NULL,
	[BillingCity] [nvarchar](40) NULL,
	[BillingState] [nvarchar](40) NULL,
	[BillingCountry] [nvarchar](40) NULL,
	[BillingPostalCode] [nvarchar](10) NULL,
	[Total] [numeric](10, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceLine]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLine](
	[InvoiceLineId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaType]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaType](
	[MediaTypeId] [int] NOT NULL,
	[Name] [nvarchar](120) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Track]    Script Date: 3/5/2016 7:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[TrackId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[AlbumId] [int] NULL,
	[MediaTypeId] [int] NOT NULL,
	[GenreId] [int] NULL,
	[Milliseconds] [int] NOT NULL,
	[Bytes] [int] NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Chinook_SA] SET  READ_WRITE 
GO
