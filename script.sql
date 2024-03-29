USE [master]
GO
CREATE DATABASE [POC_TEST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POC_TEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\POC_TEST.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'POC_TEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\POC_TEST_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

USE [POC_TEST]
GO

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
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NULL,
	[LastName] [varchar](25) NULL,
	[Address] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[Password] [varchar](25) NULL,
	[Role] [varchar](10) NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_UserData] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER DATABASE [POC] SET  READ_WRITE 
GO
