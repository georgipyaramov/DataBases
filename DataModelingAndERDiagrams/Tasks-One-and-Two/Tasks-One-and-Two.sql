USE [master]
GO
/****** Object:  Database [HomeworkDataModelingERDiagramsFirstSecondTask]    Script Date: 23-Aug-14 16:25:20 ******/
CREATE DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeworkDataModelingERDiagramsFirstSecondTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeworkDataModelingERDiagramsFirstSecondTask.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomeworkDataModelingERDiagramsFirstSecondTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeworkDataModelingERDiagramsFirstSecondTask_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeworkDataModelingERDiagramsFirstSecondTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET  MULTI_USER 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeworkDataModelingERDiagramsFirstSecondTask', N'ON'
GO
USE [HomeworkDataModelingERDiagramsFirstSecondTask]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 23-Aug-14 16:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](150) NOT NULL,
	[TownID] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 23-Aug-14 16:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[ContinentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ContinentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 23-Aug-14 16:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentID] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 23-Aug-14 16:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 23-Aug-14 16:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (1, N'Dnepar Str 12', 1)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (2, N'Otets Paisi 35A', 2)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (3, N'Capitan Petko Voivoda 25', 3)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (4, N'301 Front St W', 4)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (5, N' 1 Rideau Street', 5)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (6, N'Köpenicker Straße 81', 6)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (7, N'Gollierstraße 71', 7)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (8, N'96 Snowsfields', 8)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (9, N'17 Magdalen St', 8)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (10, N'90 Longley St', 9)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (11, N'R. Teodoro da Silva, 389', 10)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (12, N'R. Susana, 119', 11)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (13, N'492-500 Elizabeth St', 12)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (15, N'72 Urana St', 13)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (16, N'Zhang Tai Lu', 14)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (17, N'Drake St', 15)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (18, N'Nelson Mandela Dr', 16)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (19, N'Unnamed Rd', 17)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (20, N'Unnamed Rd', 18)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (21, N'18 El-Amir Hussein', 19)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (22, N'59 Small Passage', 20)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (23, N'Komazawa Dori', 21)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (24, N'Kuko Dori', 22)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (25, N'Lakhe Chaur Marg', 23)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (26, N'Ratanpur', 24)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (27, N'50 View Rd', 25)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (28, N'193 Gillies Ave', 25)
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (29, N'73-75 Barbour St', 26)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (2, N'North America')
INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (3, N'South America')
INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (4, N'Asia')
INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (5, N'Australia')
INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (6, N'Antarctica')
INSERT [dbo].[Continents] ([ContinentID], [Name]) VALUES (7, N'Africa')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (2, N'Germany', 1)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (3, N'United Kingdom', 1)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (5, N'Canada', 2)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (6, N'Brasil', 3)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (7, N'Australia', 5)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (8, N'China', 4)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (9, N'Botswana', 7)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (10, N'Angola', 7)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (11, N'Egypt', 7)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (12, N'Japan', 4)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (13, N'Nepal', 4)
INSERT [dbo].[Countries] ([CountryID], [Name], [ContinentID]) VALUES (15, N'New Zealand', 5)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (1, N'Lyudmil', N'Yankov', 1)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (2, N'Pavel', N'Tsvetkov', 2)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (3, N'Violeta ', N'Ignatova', 3)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (4, N'Phyllida', N'Paige', 4)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (5, N'Mitchell', N'Fairchild', 5)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (6, N'Heida', N'Raske', 6)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (7, N'Bonifaz', N'Dreschner', 7)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (8, N'Natasha ', N'Crowford', 8)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (9, N'Victor', N'Bishop', 9)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (10, N'Christian ', N'Waters', 10)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (11, N'Lonnie', N'Lopez', 11)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (12, N'Ramon', N'Scott', 12)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (13, N'Monique	', N'Hughes', 13)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (15, N'Chinwe', N'Afolayan', 15)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (16, N'Huang', N'Wu', 16)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (17, N'Yin', N'Lee', 17)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (18, N'Wattana', N'Metharom', 18)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (21, N'Phyllida', N'Raske', 19)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (22, N'Wattana', N'Somboon', 20)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (23, N'Aliyyah', N'Boulos', 21)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (24, N'Shihab', N'Nejem', 21)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (25, N'Atuf', N'Karim', 22)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (26, N'Ryuu', N'Matsumoto', 23)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (27, N'Susumu', N'Mori', 24)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (28, N'Krystal	', N'Pope', 25)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (29, N'Otilia	', N'Amador', 26)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (30, N'Steve	', N'Turner', 27)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (31, N'George	', N'Jenkins', 28)
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (32, N'Julia', N'Ross', 29)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (2, N'Plovdiv', 1)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (3, N'Varna', 1)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (4, N'Toronto', 5)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (5, N'Ottawa', 5)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (6, N'Berlin', 2)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (7, N'Munhen', 2)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (8, N'London', 3)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (9, N'New Castle', 3)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (10, N'Rio de Janeiro', 6)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (11, N'Sao Paulo', 6)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (12, N'Sydney', 7)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (13, N'Wagga Wagga', 7)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (14, N'Beijing', 8)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (15, N'Hong Kong', 8)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (16, N'Gaborone', 9)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (17, N'Kanye', 9)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (18, N'Namacunde', 10)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (19, N'Cairo', 11)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (20, N'Alexandria', 11)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (21, N'Tokyo', 12)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (22, N'Hiroshima', 12)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (23, N'Kathmandu', 13)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (24, N'Ghorahi', 13)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (25, N'Auckland', 15)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryID]) VALUES (26, N'Christchurch', 15)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentID])
REFERENCES [dbo].[Continents] ([ContinentID])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFirstSecondTask] SET  READ_WRITE 
GO
