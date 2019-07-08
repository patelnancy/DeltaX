USE [master]
GO
/****** Object:  Database [MovieDB]    Script Date: 08-07-2019 18:01:17 ******/
CREATE DATABASE [MovieDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MovieDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MovieDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MovieDB]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 08-07-2019 18:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actor](
	[actorId] [int] IDENTITY(1,1) NOT NULL,
	[actorName] [varchar](50) NULL,
	[actorSex] [varchar](50) NULL,
	[actorDOB] [varchar](50) NULL,
	[actorBio] [varchar](3000) NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[actorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 08-07-2019 18:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[movieId] [int] IDENTITY(1,1) NOT NULL,
	[movieName] [varchar](50) NULL,
	[movieYear] [varchar](50) NULL,
	[moviePlot] [varchar](max) NULL,
	[moviePoster] [varchar](max) NULL,
	[actorId] [int] NULL,
	[producerId] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[movieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 08-07-2019 18:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producer](
	[producerId] [int] IDENTITY(1,1) NOT NULL,
	[producerName] [varchar](50) NULL,
	[producerSex] [varchar](50) NULL,
	[producerDOB] [varchar](50) NULL,
	[producerBio] [varchar](3000) NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[producerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Actor] ON 

INSERT [dbo].[Actor] ([actorId], [actorName], [actorSex], [actorDOB], [actorBio]) VALUES (1, N'Ranveer Singh', N'Male', N'06/07/1985', N'Ranveer Singh Bhavnani (born 6 July 1985) is an Indian actor who appears in Hindi films. The recipient of several awards, including three Filmfare Awards, Singh is among the highest-paid actors in the country and has featured in Forbes India''s Celebrity 100 list since 2012.')
INSERT [dbo].[Actor] ([actorId], [actorName], [actorSex], [actorDOB], [actorBio]) VALUES (2, N'Anushka Sharma', N'Female', N'01/05/1998', N'Anushka Sharma (pronounced [?''n??ka? ''??rma?]; born 1 May 1988) is an Indian actress and film producer who works in Hindi films. One of the most popular and highest-paid actresses in India, she has received several awards, including a Filmfare Award, and was featured by Forbes Asia in their 30 Under 30 list of 2018.')
INSERT [dbo].[Actor] ([actorId], [actorName], [actorSex], [actorDOB], [actorBio]) VALUES (5, N'Shahrukh khan ', N'Male', N'02/11/1965', N'Khan began his career with appearances in several television series in the late 1980s. He made his Bollywood debut in 1992 with Deewana . Early in his career, Khan was recognised for portraying villainous roles in the films Darr (1993), Baazigar (1993) and Anjaam (1994).')
INSERT [dbo].[Actor] ([actorId], [actorName], [actorSex], [actorDOB], [actorBio]) VALUES (6, N'Alia Bhatt', N'Female', N'15/03/1993', N'She is an actress and singer of Indian origin and British citizenship, who works in Hindi films. The recipient of several accolades, including three Filmfare Awards, Bhatt is one of the highest-paid actresses in India. She has appeared in Forbes India''s Celebrity 100 list since 2014 and was featured by Forbes Asia in their 30 Under 30 list of 2017.')
INSERT [dbo].[Actor] ([actorId], [actorName], [actorSex], [actorDOB], [actorBio]) VALUES (7, N'Amitabh Bachchan ', N'Male', N'11/10/1942', N'Amitabh Bachchan (pronounced [?m?''ta?b? ''b?t???n]; born Inquilaab Srivastava;[1] 11 October 1942) is an Indian film actor, film producer, television host, occasional playback singer and former politician. He first gained popularity in the early 1970s for films such as Zanjeer, Deewaar and Sholay, and was dubbed India''s "angry young man" for his on-screen roles in Bollywood.')
SET IDENTITY_INSERT [dbo].[Actor] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([movieId], [movieName], [movieYear], [moviePlot], [moviePoster], [actorId], [producerId]) VALUES (1, N'Ramleela', N'2013', N'Ram and Leela love each other but cannot stay together as their families, Rajadi and Sanera, have been at war with each other for the past 500 years. At the end, they both need to make a sacrifice.', N'~/Image/poster.jpg', 1, 1)
INSERT [dbo].[Movie] ([movieId], [movieName], [movieYear], [moviePlot], [moviePoster], [actorId], [producerId]) VALUES (12, N'Student Of The Year', N'2012', N'Abhimanyu and Rohan are good friends. However, their friendship is affected after they compete to win the Student of The Year title and Abhimanyu falls in love with Shanaya, Rohan''s girlfriend.', N'~/Image/std.jpg', 1, 3)
INSERT [dbo].[Movie] ([movieId], [movieName], [movieYear], [moviePlot], [moviePoster], [actorId], [producerId]) VALUES (13, N'Badla', N'2019', N'A young married entrepreneur finds herself in a locked hotel room next to the body of her dead lover. Hoping to find answers, she hires a prestigious lawyer to help her solve the mystery of what really happened.
', N'~/Image/badla.jpg', 2, 1)
INSERT [dbo].[Movie] ([movieId], [movieName], [movieYear], [moviePlot], [moviePoster], [actorId], [producerId]) VALUES (14, N'Article 15', N'2019', N'Based on the socio-political situation of India, the lives of police officers are followed. In a country where discrimination is everywhere, whether related to race or caste, the officers embark on a journey of acceptance and change.', N'~/Image/article.jpg', 5, 5)
INSERT [dbo].[Movie] ([movieId], [movieName], [movieYear], [moviePlot], [moviePoster], [actorId], [producerId]) VALUES (15, N'PK', N'2014', N'A stranger in the city asks questions no one has asked before. Known only by his initials, the man''s innocent questions and childlike curiosity take him on a journey of love, laughter and letting go.', N'~/Image/PK.jpg', 6, 4)
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([producerId], [producerName], [producerSex], [producerDOB], [producerBio]) VALUES (1, N'Sanjay Leela Bhansali', N'Male', N'24/02/1963', N'He is a Bollywood director, producer, screenwriter, and music director. One of the most successful filmmakers in Indian cinema, Bhansali is the recipient of several awards, including four National Film Awards, eleven Filmfare Awards and a BAFTA nomination.')
INSERT [dbo].[Producer] ([producerId], [producerName], [producerSex], [producerDOB], [producerBio]) VALUES (3, N'Yash Johar', N'Male', N'06/09/1929', N'He was an Indian Bollywood film producer. He founded Dharma Productions in 1976 and made Hindi films that were noted for featuring lavish sets and exotic locations, but upheld Indian traditions and family values.')
INSERT [dbo].[Producer] ([producerId], [producerName], [producerSex], [producerDOB], [producerBio]) VALUES (4, N'Karan Johar', N'Male', N'25/05/1972', N'Karan Kumar Johar often informally referred to as KJo,[2] is an Indian film director, producer, screenwriter, costume designer, actor and television personality who works in Hindi films.[3] He is the son of Hiroo Johar and the producer Yash Johar.')
INSERT [dbo].[Producer] ([producerId], [producerName], [producerSex], [producerDOB], [producerBio]) VALUES (5, N'Ekta Kapoor', N'Female', N'07/06/1975', N'She is an Indian television producer, film producer and director.')
INSERT [dbo].[Producer] ([producerId], [producerName], [producerSex], [producerDOB], [producerBio]) VALUES (6, N'Anurag Kashyap', N'Male', N'10/09/1972', N'He  is an Indian film director, writer, editor, producer and actor known for his works in Hindi cinema. He is the recipient of several accolades, including a National Film Award, and four Filmfare Awards.')
SET IDENTITY_INSERT [dbo].[Producer] OFF
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Actor] FOREIGN KEY([actorId])
REFERENCES [dbo].[Actor] ([actorId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Actor]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Producer] FOREIGN KEY([producerId])
REFERENCES [dbo].[Producer] ([producerId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Producer]
GO
USE [master]
GO
ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO
