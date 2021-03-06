USE [master]
GO
/****** Object:  Database [HomeworkDataModelingERDiagramsFifthTask]    Script Date: 23-Aug-14 20:05:12 ******/
CREATE DATABASE [HomeworkDataModelingERDiagramsFifthTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeworkDataModelingERDiagramsFifthTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeworkDataModelingERDiagramsFifthTask.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomeworkDataModelingERDiagramsFifthTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeworkDataModelingERDiagramsFifthTask_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeworkDataModelingERDiagramsFifthTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET  MULTI_USER 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeworkDataModelingERDiagramsFifthTask', N'ON'
GO
USE [HomeworkDataModelingERDiagramsFifthTask]
GO
/****** Object:  Table [dbo].[Explanations]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explanations](
	[ExplanationID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](250) NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_Explanations] PRIMARY KEY CLUSTERED 
(
	[ExplanationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parts_Of_Speach]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parts_Of_Speach](
	[PartOfSpeachID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Parts_Of_Speach] PRIMARY KEY CLUSTERED 
(
	[PartOfSpeachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Words]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[SynonimID] [int] NULL,
	[ExplanationID] [int] NULL,
	[TranslationWordID] [int] NULL,
	[AntonymID] [int] NULL,
	[PartOfSpeachID] [int] NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Explanations]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Explanations](
	[WordID] [int] NOT NULL,
	[ExplanationID] [int] NOT NULL,
 CONSTRAINT [PK_Words_Explanations] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC,
	[ExplanationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Hypernym_Hyponym]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Hypernym_Hyponym](
	[WordID] [int] NOT NULL,
	[HypernymID] [int] NOT NULL,
	[HyponymID] [int] NOT NULL,
 CONSTRAINT [PK_Words_Hypernym_Hyponym] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC,
	[HypernymID] ASC,
	[HyponymID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Synonims]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Synonims](
	[WordID] [int] NOT NULL,
	[SynonimID] [int] NOT NULL,
 CONSTRAINT [PK_Words_Synonims] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC,
	[SynonimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Translations]    Script Date: 23-Aug-14 20:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Translations](
	[WordID] [int] NOT NULL,
	[TranslationID] [int] NOT NULL,
 CONSTRAINT [PK_Words_Translations] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC,
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Explanations_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Explanations] CHECK CONSTRAINT [FK_Explanations_Languages]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Parts_Of_Speach] FOREIGN KEY([PartOfSpeachID])
REFERENCES [dbo].[Parts_Of_Speach] ([PartOfSpeachID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Parts_Of_Speach]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Words] FOREIGN KEY([AntonymID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Words]
GO
ALTER TABLE [dbo].[Words_Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Explanations_Explanations] FOREIGN KEY([ExplanationID])
REFERENCES [dbo].[Explanations] ([ExplanationID])
GO
ALTER TABLE [dbo].[Words_Explanations] CHECK CONSTRAINT [FK_Words_Explanations_Explanations]
GO
ALTER TABLE [dbo].[Words_Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Explanations_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Explanations] CHECK CONSTRAINT [FK_Words_Explanations_Words]
GO
ALTER TABLE [dbo].[Words_Hypernym_Hyponym]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hypernym_Hyponym_Word] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Hypernym_Hyponym] CHECK CONSTRAINT [FK_Words_Hypernym_Hyponym_Word]
GO
ALTER TABLE [dbo].[Words_Hypernym_Hyponym]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hypernym_Hyponym_Word_Hypernym] FOREIGN KEY([HypernymID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Hypernym_Hyponym] CHECK CONSTRAINT [FK_Words_Hypernym_Hyponym_Word_Hypernym]
GO
ALTER TABLE [dbo].[Words_Hypernym_Hyponym]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hypernym_Hyponym_Word_Hyponym] FOREIGN KEY([HyponymID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Hypernym_Hyponym] CHECK CONSTRAINT [FK_Words_Hypernym_Hyponym_Word_Hyponym]
GO
ALTER TABLE [dbo].[Words_Synonims]  WITH CHECK ADD  CONSTRAINT [FK_Words_Synonims_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Synonims] CHECK CONSTRAINT [FK_Words_Synonims_Words]
GO
ALTER TABLE [dbo].[Words_Synonims]  WITH CHECK ADD  CONSTRAINT [FK_Words_Synonims_WordSynonim] FOREIGN KEY([SynonimID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Synonims] CHECK CONSTRAINT [FK_Words_Synonims_WordSynonim]
GO
ALTER TABLE [dbo].[Words_Translations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Translations_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Translations] CHECK CONSTRAINT [FK_Words_Translations_Words]
GO
ALTER TABLE [dbo].[Words_Translations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Translations_WordsTranslations] FOREIGN KEY([TranslationID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Words_Translations] CHECK CONSTRAINT [FK_Words_Translations_WordsTranslations]
GO
USE [master]
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsFifthTask] SET  READ_WRITE 
GO
