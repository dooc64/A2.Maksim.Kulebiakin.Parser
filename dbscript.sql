USE [master]
GO
/****** Object:  Database [A2.Maksim.Kulebiakin.Test.Task]    Script Date: 20.07.2022 15:27:17 ******/
CREATE DATABASE [A2.Maksim.Kulebiakin.Test.Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'A2.Maksim.Kulebiakin.Test.Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\A2.Maksim.Kulebiakin.Test.Task.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'A2.Maksim.Kulebiakin.Test.Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\A2.Maksim.Kulebiakin.Test.Task_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [A2.Maksim.Kulebiakin.Test.Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET RECOVERY FULL 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET  MULTI_USER 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'A2.Maksim.Kulebiakin.Test.Task', N'ON'
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET QUERY_STORE = OFF
GO
USE [A2.Maksim.Kulebiakin.Test.Task]
GO
/****** Object:  Table [dbo].[Deals]    Script Date: 20.07.2022 15:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deals](
	[DealNumber] [nvarchar](100) NOT NULL,
	[BuyerName] [nvarchar](500) NULL,
	[BuyerInn] [nvarchar](50) NULL,
	[SellerName] [nvarchar](500) NULL,
	[SellerInn] [nvarchar](50) NULL,
	[DateOfDeal] [nvarchar](50) NULL,
	[WoodVolumeBuyer] [nvarchar](50) NOT NULL,
	[WoodVolumeSeller] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Deals] PRIMARY KEY CLUSTERED 
(
	[DealNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UpdateDealsAndCustomerList]    Script Date: 20.07.2022 15:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDealsAndCustomerList]
	@json nvarchar(max)
AS
BEGIN
select 
	JSON_VALUE(a.value, '$.DealNumber') as DealNumber,
	JSON_VALUE(a.value, '$.BuyerName') as BuyerName,
	JSON_VALUE(a.value, '$.BuyerInn') as BuyerInn,

	JSON_VALUE(a.value, '$.SellerName') as SellerName,
	JSON_VALUE(a.value, '$.SellerInn') as SellerInn,

	JSON_VALUE(a.value, '$.DealDate') as DealDate,
	JSON_VALUE(a.value, '$.WoodVolumeBuyer') as WoodVolumeBuyer,
	JSON_VALUE(a.value, '$.WoodVolumeSeller') as WoodVolumeSeller
into #DealsTemp
from openjson(@json, '$.content') as a

insert into Deals select * from #DealsTemp 
WHERE(#DealsTemp.DealNumber not in (SELECT DealNumber FROM Deals))
END
GO
USE [master]
GO
ALTER DATABASE [A2.Maksim.Kulebiakin.Test.Task] SET  READ_WRITE 
GO
