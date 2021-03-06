USE [master]
GO
/****** Object:  Database [HomeworkDataModelingERDiagramsThirdTask]    Script Date: 23-Aug-14 20:03:55 ******/
CREATE DATABASE [HomeworkDataModelingERDiagramsThirdTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeworkDataModelingERDiagramsThirdTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeworkDataModelingERDiagramsThirdTask.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomeworkDataModelingERDiagramsThirdTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeworkDataModelingERDiagramsThirdTask_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeworkDataModelingERDiagramsThirdTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET  MULTI_USER 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeworkDataModelingERDiagramsThirdTask', N'ON'
GO
USE [HomeworkDataModelingERDiagramsThirdTask]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[ProfessorID] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses_Students]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses_Students](
	[CourseID] [int] NULL,
	[StudentID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultieID] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultieID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TitleID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors_Titles]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors_Titles](
	[ProfessorID] [int] NULL,
	[TitleID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultieID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 23-Aug-14 20:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[TitileID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[TitileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professors] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professors] ([ProfessorID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professors]
GO
ALTER TABLE [dbo].[Courses_Students]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Students_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Courses_Students] CHECK CONSTRAINT [FK_Courses_Students_Courses]
GO
ALTER TABLE [dbo].[Courses_Students]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Students_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Courses_Students] CHECK CONSTRAINT [FK_Courses_Students_Students]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([FacultieID])
REFERENCES [dbo].[Faculties] ([FacultieID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments]
GO
ALTER TABLE [dbo].[Professors_Titles]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Titles_Professors] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professors] ([ProfessorID])
GO
ALTER TABLE [dbo].[Professors_Titles] CHECK CONSTRAINT [FK_Professors_Titles_Professors]
GO
ALTER TABLE [dbo].[Professors_Titles]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Titles_Titles] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Titles] ([TitileID])
GO
ALTER TABLE [dbo].[Professors_Titles] CHECK CONSTRAINT [FK_Professors_Titles_Titles]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([FacultieID])
REFERENCES [dbo].[Faculties] ([FacultieID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO
USE [master]
GO
ALTER DATABASE [HomeworkDataModelingERDiagramsThirdTask] SET  READ_WRITE 
GO
