USE [master]
GO
	/****** Object:  Database [POC]    Script Date: 21-02-2023 12:18:26 ******/
	CREATE DATABASE [POC] CONTAINMENT = NONE ON PRIMARY (
		NAME = N'POC',
		FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\POC.mdf',
		SIZE = 5120KB,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 1024KB
	) LOG ON (
		NAME = N'POC_log',
		FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\POC_log.ldf',
		SIZE = 5184KB,
		MAXSIZE = 2048GB,
		FILEGROWTH = 10 %
	) WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO 
ALTER DATABASE [POC]
SET COMPATIBILITY_LEVEL = 100
GO 
IF (
		1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled')
	) begin EXEC [POC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

USE [POC]
GO
	/****** Object:  Table [dbo].[TransactionData]    Script Date: 21-02-2023 12:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
CREATE TABLE [dbo].[TransactionData](
		[Transaction_Number] [varchar](20) NULL,
		[Transaction_Type] [varchar](20) NULL,
		[Transaction_Date] [timestamp] NOT NULL,
		[changedBy] [varchar](20) NULL,
		[ChangedOn] [datetime] NULL,
		[status] [varchar](20) NULL,
		[Process_Name] [varchar](255) NULL
	) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
CREATE TABLE [dbo].[UserData](
		[UserID] [int] IDENTITY(1, 1) NOT NULL,
		[FirstName] [varchar](25) NULL,
		[LastName] [varchar](25) NULL,
		[Address] [varchar](100) NULL,
		[Gender] [varchar](10) NULL,
		[Password] [varchar](25) NULL,
		[Role] [varchar](10) NULL,
		[UserName] [varchar](50) NULL,
		CONSTRAINT [PK_UserData] PRIMARY KEY CLUSTERED ([UserID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
INSERT INTO [dbo].[UserData]
VALUES 
	(
		'Admin',
		'Khot',
		'FLAT NO 61 DURGA APARTMENTS  MAHALAXMI  NAGAR BIBVEWADI',
		'Male',
		'Admin',
		'Admin',
		'Admin'
	);
GO

/****** Object:  Table [dbo].[UserData]    Script Date: 21-02-2023 12:18:27 ******/

/****** Object:  Table [dbo].[UserProcessData]    Script Date: 27-02-2023 14:00:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserProcessData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessName] [varchar](50) NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserProcessData]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserData] ([UserID])
GO

/****** Object:  Table [dbo].[UserProcessData]    Script Date: 27-02-2023 14:00:06 ******/
	

/****** Object:  Table [dbo].[ProcessMetaData]    Script Date: 27-02-2023 14:04:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProcessMetaData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessMetaData]    Script Date: 27-02-2023 14:04:34 ******/

/****** Object:  Table [dbo].[FieldMetaData]    Script Date: 27-02-2023 14:05:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FieldMetaData](
	[ID] [int] NULL,
	[FieldName] [varchar](50) NULL,
	[DataType] [varchar](50) NULL,
	[length] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldMetaData]    Script Date: 27-02-2023 14:05:18 ******/

USE [master]
GO
ALTER DATABASE [POC]
SET READ_WRITE 
GO