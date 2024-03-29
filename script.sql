USE [master]
GO
/****** Object:  Database [BIT_SWD03]    Script Date: 9.3.2023 14.56.49 ******/
CREATE DATABASE [BIT_SWD03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIT_SWD03', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BIT_SWD03.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BIT_SWD03_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BIT_SWD03_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BIT_SWD03] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIT_SWD03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIT_SWD03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIT_SWD03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIT_SWD03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIT_SWD03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIT_SWD03] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIT_SWD03] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIT_SWD03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIT_SWD03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIT_SWD03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIT_SWD03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIT_SWD03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIT_SWD03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIT_SWD03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIT_SWD03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIT_SWD03] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BIT_SWD03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIT_SWD03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIT_SWD03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIT_SWD03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIT_SWD03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIT_SWD03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIT_SWD03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIT_SWD03] SET RECOVERY FULL 
GO
ALTER DATABASE [BIT_SWD03] SET  MULTI_USER 
GO
ALTER DATABASE [BIT_SWD03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIT_SWD03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIT_SWD03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIT_SWD03] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BIT_SWD03] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BIT_SWD03] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BIT_SWD03', N'ON'
GO
ALTER DATABASE [BIT_SWD03] SET QUERY_STORE = ON
GO
ALTER DATABASE [BIT_SWD03] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BIT_SWD03]
GO
/****** Object:  Table [dbo].[AcademicAdvisor]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicAdvisor](
	[teacher_number] [char](4) NOT NULL,
	[campus_code] [char](4) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_AcademicAdvisor] PRIMARY KEY CLUSTERED 
(
	[teacher_number] ASC,
	[campus_code] ASC,
	[start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[campus_code] [char](4) NOT NULL,
	[campus_name] [varchar](10) NOT NULL,
	[street] [varchar](20) NULL,
	[postcode] [char](5) NULL,
	[city] [varchar](10) NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[campus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_Campus] UNIQUE NONCLUSTERED 
(
	[campus_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_code] [char](4) NOT NULL,
	[course_name] [varchar](20) NOT NULL,
	[credits] [smallint] NOT NULL,
	[person_in_charge] [char](4) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_Course] UNIQUE NONCLUSTERED 
(
	[course_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseGrade]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGrade](
	[student_number] [char](4) NOT NULL,
	[course_code] [char](4) NOT NULL,
	[instance_number] [smallint] NOT NULL,
	[grade] [smallint] NULL,
	[grade_date] [date] NULL,
	[examiner] [char](4) NULL,
 CONSTRAINT [PK_CourseGrade] PRIMARY KEY CLUSTERED 
(
	[student_number] ASC,
	[course_code] ASC,
	[instance_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseInstance]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstance](
	[course_code] [char](4) NOT NULL,
	[instance_number] [smallint] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[participants] [smallint] NULL,
	[teacher_number] [char](4) NULL,
 CONSTRAINT [PK_CourseInstance] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC,
	[instance_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cyclist]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cyclist](
	[cyclistNumber] [int] NOT NULL,
	[familyName] [varchar](50) NOT NULL,
	[givenName] [varchar](50) NOT NULL,
	[teamNumber] [int] NOT NULL,
 CONSTRAINT [PK_Cyclist] PRIMARY KEY CLUSTERED 
(
	[cyclistNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[deptno] [int] NOT NULL,
	[deptname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[deptno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[empno] [int] NOT NULL,
	[empname] [varchar](50) NOT NULL,
	[deptno] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[empno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MisconductIncident]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MisconductIncident](
	[student_number] [char](4) NOT NULL,
	[misconduct_code] [char](4) NOT NULL,
	[course_code] [char](4) NOT NULL,
	[instance_number] [smallint] NOT NULL,
	[sanction_code] [char](4) NOT NULL,
	[decision_date] [date] NOT NULL,
 CONSTRAINT [PK_MisconductIncident] PRIMARY KEY CLUSTERED 
(
	[student_number] ASC,
	[misconduct_code] ASC,
	[course_code] ASC,
	[instance_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MisconductType]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MisconductType](
	[misconduct_code] [char](4) NOT NULL,
	[description] [varchar](120) NOT NULL,
 CONSTRAINT [PK_Misconduct] PRIMARY KEY CLUSTERED 
(
	[misconduct_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prerequisite]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prerequisite](
	[course_code] [char](4) NOT NULL,
	[prerequisite_code] [char](4) NOT NULL,
 CONSTRAINT [PK_Prerequisite] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC,
	[prerequisite_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanctionType]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanctionType](
	[sanction_code] [char](4) NOT NULL,
	[description] [varchar](20) NOT NULL,
	[decision_maker] [varchar](30) NOT NULL,
 CONSTRAINT [PK_MisconductSanction] PRIMARY KEY CLUSTERED 
(
	[sanction_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_number] [char](4) NOT NULL,
	[first_name] [varchar](8) NOT NULL,
	[surname] [varchar](8) NOT NULL,
	[birth_date] [date] NOT NULL,
	[gender] [char](1) NOT NULL,
	[email] [varchar](20) NULL,
	[street] [varchar](20) NULL,
	[postcode] [char](5) NULL,
	[city] [varchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacher_number] [char](4) NOT NULL,
	[first_name] [varchar](8) NOT NULL,
	[surname] [varchar](8) NOT NULL,
	[birth_date] [date] NOT NULL,
	[gender] [char](1) NOT NULL,
	[salary] [decimal](8, 2) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[campus_code] [char](4) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacher_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 9.3.2023 14.56.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[teamNumber] [int] NOT NULL,
	[teamName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[teamNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AcademicAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_AcademicAdvisor_Campus] FOREIGN KEY([campus_code])
REFERENCES [dbo].[Campus] ([campus_code])
GO
ALTER TABLE [dbo].[AcademicAdvisor] CHECK CONSTRAINT [FK_AcademicAdvisor_Campus]
GO
ALTER TABLE [dbo].[AcademicAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_AcademicAdvisor_Teacher] FOREIGN KEY([teacher_number])
REFERENCES [dbo].[Teacher] ([teacher_number])
GO
ALTER TABLE [dbo].[AcademicAdvisor] CHECK CONSTRAINT [FK_AcademicAdvisor_Teacher]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([person_in_charge])
REFERENCES [dbo].[Teacher] ([teacher_number])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_CourseInstance] FOREIGN KEY([course_code], [instance_number])
REFERENCES [dbo].[CourseInstance] ([course_code], [instance_number])
GO
ALTER TABLE [dbo].[CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_CourseInstance]
GO
ALTER TABLE [dbo].[CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_Student] FOREIGN KEY([student_number])
REFERENCES [dbo].[Student] ([student_number])
GO
ALTER TABLE [dbo].[CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_Student]
GO
ALTER TABLE [dbo].[CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_Teacher] FOREIGN KEY([examiner])
REFERENCES [dbo].[Teacher] ([teacher_number])
GO
ALTER TABLE [dbo].[CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_Teacher]
GO
ALTER TABLE [dbo].[CourseInstance]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstance_Course] FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[CourseInstance] CHECK CONSTRAINT [FK_CourseInstance_Course]
GO
ALTER TABLE [dbo].[CourseInstance]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstance_Teacher] FOREIGN KEY([teacher_number])
REFERENCES [dbo].[Teacher] ([teacher_number])
GO
ALTER TABLE [dbo].[CourseInstance] CHECK CONSTRAINT [FK_CourseInstance_Teacher]
GO
ALTER TABLE [dbo].[Cyclist]  WITH CHECK ADD  CONSTRAINT [FK_Cyclist_Team] FOREIGN KEY([teamNumber])
REFERENCES [dbo].[Team] ([teamNumber])
GO
ALTER TABLE [dbo].[Cyclist] CHECK CONSTRAINT [FK_Cyclist_Team]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([deptno])
REFERENCES [dbo].[Department] ([deptno])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[MisconductIncident]  WITH CHECK ADD  CONSTRAINT [FK_MisconductIncident_CourseInstance] FOREIGN KEY([course_code], [instance_number])
REFERENCES [dbo].[CourseInstance] ([course_code], [instance_number])
GO
ALTER TABLE [dbo].[MisconductIncident] CHECK CONSTRAINT [FK_MisconductIncident_CourseInstance]
GO
ALTER TABLE [dbo].[MisconductIncident]  WITH CHECK ADD  CONSTRAINT [FK_MisconductIncident_MisconductType] FOREIGN KEY([misconduct_code])
REFERENCES [dbo].[MisconductType] ([misconduct_code])
GO
ALTER TABLE [dbo].[MisconductIncident] CHECK CONSTRAINT [FK_MisconductIncident_MisconductType]
GO
ALTER TABLE [dbo].[MisconductIncident]  WITH CHECK ADD  CONSTRAINT [FK_MisconductIncident_SanctionType] FOREIGN KEY([sanction_code])
REFERENCES [dbo].[SanctionType] ([sanction_code])
GO
ALTER TABLE [dbo].[MisconductIncident] CHECK CONSTRAINT [FK_MisconductIncident_SanctionType]
GO
ALTER TABLE [dbo].[MisconductIncident]  WITH CHECK ADD  CONSTRAINT [FK_MisconductIncident_Student] FOREIGN KEY([student_number])
REFERENCES [dbo].[Student] ([student_number])
GO
ALTER TABLE [dbo].[MisconductIncident] CHECK CONSTRAINT [FK_MisconductIncident_Student]
GO
ALTER TABLE [dbo].[Prerequisite]  WITH CHECK ADD  CONSTRAINT [FK_Prerequisite_Course] FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[Prerequisite] CHECK CONSTRAINT [FK_Prerequisite_Course]
GO
ALTER TABLE [dbo].[Prerequisite]  WITH CHECK ADD  CONSTRAINT [FK_Prerequisite_Course_prior] FOREIGN KEY([prerequisite_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[Prerequisite] CHECK CONSTRAINT [FK_Prerequisite_Course_prior]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Campus] FOREIGN KEY([campus_code])
REFERENCES [dbo].[Campus] ([campus_code])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Campus]
GO
ALTER TABLE [dbo].[AcademicAdvisor]  WITH CHECK ADD  CONSTRAINT [CHK_AcademicAdvisor_end_date] CHECK  (([end_date] IS NULL OR [end_date]>=[start_date]))
GO
ALTER TABLE [dbo].[AcademicAdvisor] CHECK CONSTRAINT [CHK_AcademicAdvisor_end_date]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [CHK_Course_credits] CHECK  (([credits]>=(0)))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [CHK_Course_credits]
GO
ALTER TABLE [dbo].[CourseGrade]  WITH CHECK ADD  CONSTRAINT [CHK_CourseGrade_grade] CHECK  (([grade]>=(0) AND [grade]<=(5) OR [grade] IS NULL))
GO
ALTER TABLE [dbo].[CourseGrade] CHECK CONSTRAINT [CHK_CourseGrade_grade]
GO
ALTER TABLE [dbo].[CourseInstance]  WITH CHECK ADD  CONSTRAINT [CHK_CourseInstance_end_date] CHECK  (([end_date] IS NULL OR [end_date]>=[start_date]))
GO
ALTER TABLE [dbo].[CourseInstance] CHECK CONSTRAINT [CHK_CourseInstance_end_date]
GO
ALTER TABLE [dbo].[CourseInstance]  WITH CHECK ADD  CONSTRAINT [CHK_CourseInstance_participants] CHECK  (([participants] IS NULL OR [participants]>=(0)))
GO
ALTER TABLE [dbo].[CourseInstance] CHECK CONSTRAINT [CHK_CourseInstance_participants]
GO
ALTER TABLE [dbo].[Prerequisite]  WITH CHECK ADD  CONSTRAINT [CHK_Prerequisite_code] CHECK  (([course_code]<>[prerequisite_code]))
GO
ALTER TABLE [dbo].[Prerequisite] CHECK CONSTRAINT [CHK_Prerequisite_code]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CHK_Student_gender] CHECK  (([gender]='M' OR [gender]='F'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CHK_Student_gender]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [CHK_Teacher_salary] CHECK  (([salary]>=(0)))
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [CHK_Teacher_salary]
GO
USE [master]
GO
ALTER DATABASE [BIT_SWD03] SET  READ_WRITE 
GO
