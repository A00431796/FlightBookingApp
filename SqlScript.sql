USE [master]
GO
/****** Object:  Database [FlightBookingApp]    Script Date: 2019-04-07 2:08:52 PM ******/
CREATE DATABASE [FlightBookingApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlightBookingApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FlightBookingApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlightBookingApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FlightBookingApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FlightBookingApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlightBookingApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlightBookingApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlightBookingApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlightBookingApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlightBookingApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlightBookingApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlightBookingApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlightBookingApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlightBookingApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlightBookingApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlightBookingApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlightBookingApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlightBookingApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlightBookingApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlightBookingApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlightBookingApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlightBookingApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlightBookingApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlightBookingApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlightBookingApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlightBookingApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlightBookingApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlightBookingApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlightBookingApp] SET RECOVERY FULL 
GO
ALTER DATABASE [FlightBookingApp] SET  MULTI_USER 
GO
ALTER DATABASE [FlightBookingApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlightBookingApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlightBookingApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlightBookingApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlightBookingApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlightBookingApp', N'ON'
GO
ALTER DATABASE [FlightBookingApp] SET QUERY_STORE = OFF
GO
USE [FlightBookingApp]
GO
/****** Object:  Table [dbo].[airline]    Script Date: 2019-04-07 2:08:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airline](
	[airline_id] [int] NOT NULL,
	[airline_name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airport]    Script Date: 2019-04-07 2:08:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airport](
	[airport_id] [int] NOT NULL,
	[airport_name] [varchar](50) NULL,
	[airport_short_code] [varchar](3) NULL,
	[airport_country] [varchar](50) NULL,
	[city] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_details]    Script Date: 2019-04-07 2:08:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_details](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[flight_id] [int] NOT NULL,
	[payment] [varchar](256) NULL,
	[qty] [int] NULL,
	[status] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_book]    Script Date: 2019-04-07 2:08:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_book](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](256) NULL,
	[customer_emailaddress] [varchar](256) NULL,
	[customer_password] [varchar](256) NULL,
 CONSTRAINT [PK_customer_book] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flight]    Script Date: 2019-04-07 2:08:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight](
	[flight_id] [int] NOT NULL,
	[airline_id] [int] NULL,
	[flight_no] [varchar](50) NULL,
	[flight_from] [varchar](50) NULL,
	[flight_to] [varchar](50) NULL,
	[operating_date_from] [date] NULL,
	[operating_date_to] [date] NULL,
	[flight_timing_from] [varchar](50) NULL,
	[flight_timing_to] [varchar](50) NULL,
	[total_seats] [int] NULL,
	[seats_booked] [int] NULL,
	[seats_blocked] [int] NULL,
	[cost] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passenger]    Script Date: 2019-04-07 2:08:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passenger](
	[passenger_id] [int] NOT NULL,
	[passport_number] [varchar](256) NULL,
	[passenger_address] [varchar](256) NULL,
	[passenger_postalCode] [varchar](256) NULL,
	[passenger_Country] [varchar](256) NULL,
	[passenger_phoneNumber] [varchar](256) NULL,
	[passenger_emailAddress] [varchar](256) NULL,
	[passenger_DOB] [date] NULL,
	[passenger_gender] [varchar](50) NULL,
 CONSTRAINT [PK_passenger] PRIMARY KEY CLUSTERED 
(
	[passenger_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[airline] ([airline_id], [airline_name]) VALUES (1, N'WestJet Airlines')
INSERT [dbo].[airline] ([airline_id], [airline_name]) VALUES (2, N'Air Canada')
INSERT [dbo].[airline] ([airline_id], [airline_name]) VALUES (3, N'JetBlue Airways')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (1, N'Calgary International Airport', N'YYC', N'Canada', N'Calgary')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (2, N'Edmonton International Airport', N'YEG', N'Canada', N'Alberta')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (3, N'Halifax Stanfield International Airport', N'YHZ', N'Canada', N'Halifax')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (4, N'Ottawa Macdonald-Cartier International Airport', N'YOW', N'Canada', N'Ontario')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (5, N'Regina International Airport', N'YQR', N'Canada', N'Regina')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (6, N'Saskatoon International Airport', N'YXE', N'Canada', N'Saskatoon')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (7, N'StJohns International Airport', N'YYT', N'Canada', N'St.Johns')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (8, N'Toronto Pearson International Airport', N'YYZ', N'Canada', N'Toronto')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (9, N'Vancouver International Airport', N'YVR', N'Canada', N'Vancouver')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (10, N'Victoria International Airport', N'YYJ', N'Canada', N'Victoria')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (11, N'Newark', N'EWR', N'USA', N'New York')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (12, N'Los Angeles International Airport', N'LAX', N'USA', N'Los Angeles')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (13, N'Montreal International Airport', N'YUL', N'Canada', N'Montreal')
INSERT [dbo].[airport] ([airport_id], [airport_name], [airport_short_code], [airport_country], [city]) VALUES (14, N'Kamloops Airport', N'YKA', N'Canada', N'Kamloops')
SET IDENTITY_INSERT [dbo].[booking_details] ON 

INSERT [dbo].[booking_details] ([booking_id], [customer_id], [flight_id], [payment], [qty], [status]) VALUES (1, 1, 1, N'689', 2, N'Booked')
INSERT [dbo].[booking_details] ([booking_id], [customer_id], [flight_id], [payment], [qty], [status]) VALUES (2, 2, 3, N'900', 1, N'In Progress')
INSERT [dbo].[booking_details] ([booking_id], [customer_id], [flight_id], [payment], [qty], [status]) VALUES (3, 3, 2, N'969', 1, N'Cancelled')
INSERT [dbo].[booking_details] ([booking_id], [customer_id], [flight_id], [payment], [qty], [status]) VALUES (4, 4, 4, N'550', 1, N'Booked')
SET IDENTITY_INSERT [dbo].[booking_details] OFF
SET IDENTITY_INSERT [dbo].[customer_book] ON 

INSERT [dbo].[customer_book] ([customer_id], [customer_name], [customer_emailaddress], [customer_password]) VALUES (3, NULL, N'vini', N'123456789')
INSERT [dbo].[customer_book] ([customer_id], [customer_name], [customer_emailaddress], [customer_password]) VALUES (4, NULL, N'ret', N'12345')
INSERT [dbo].[customer_book] ([customer_id], [customer_name], [customer_emailaddress], [customer_password]) VALUES (5, NULL, N'subhavijayeee@gmail.com', N'1234')
SET IDENTITY_INSERT [dbo].[customer_book] OFF
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (1, 1, N'WS 3452', N'YHZ', N'YUL', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (2, 1, N'WS 3539', N'YHZ', N'YYZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 230)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (3, 1, N'WS 250', N'YHZ', N'YYZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (4, 2, N'AC 217', N'YYC', N'YVR', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (5, 2, N'AC 8194', N'YYC', N'YVR', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'02:05', N'01:15', 30, 0, 0, 120)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (6, 2, N'AC 8426', N'YYC', N'YKA', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'01:00', N'07:30', 30, 0, 0, 340)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (7, 1, N'WS 139', N'YYC', N'YVR', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (8, 1, N'WS 3320', N'YYC', N'YHZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (9, 1, N'WS 3312', N'YHZ', N'YYC', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (10, 2, N'AC 134', N'YYC', N'YYZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (11, 3, N'Flight 702', N'EWR', N'YUL', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'01:30', N'08:00', 30, 0, 0, 360)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (12, 3, N'Flight 703', N'YHZ', N'YUL', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'22:00', N'02:00', 30, 0, 0, 369)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (13, 1, N'WS 3452', N'YHZ', N'YUL', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (14, 1, N'WS 3539', N'YHZ', N'YYZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 230)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (15, 1, N'WS 250', N'YHZ', N'YYZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (16, 2, N'AC 217', N'YYC', N'YVR', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (17, 2, N'AC 8194', N'YYC', N'YVR', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'02:05', N'01:15', 30, 0, 0, 120)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (18, 2, N'AC 8426', N'YYC', N'YKA', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (19, 1, N'WS 139', N'YYC', N'YVR', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'01:00', N'07:30', 30, 0, 0, 340)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (20, 1, N'WS 3320', N'YYC', N'YHZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (21, 1, N'WS 3312', N'YHZ', N'YYC', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (22, 2, N'AC 134', N'YYC', N'YYZ', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'12:00', N'14:00', 30, 20, 0, 300)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (23, 3, N'Flight 702', N'EWR', N'YUL', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-04' AS Date), N'23:55', N'03:22', 30, 0, 0, 302)
INSERT [dbo].[flight] ([flight_id], [airline_id], [flight_no], [flight_from], [flight_to], [operating_date_from], [operating_date_to], [flight_timing_from], [flight_timing_to], [total_seats], [seats_booked], [seats_blocked], [cost]) VALUES (24, 3, N'Flight 703', N'YHZ', N'YUL', CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), N'01:30', N'08:00', 30, 0, 0, 360)
ALTER TABLE [dbo].[airport] ADD  DEFAULT (NULL) FOR [airport_name]
GO
ALTER TABLE [dbo].[airport] ADD  DEFAULT (NULL) FOR [airport_short_code]
GO
ALTER TABLE [dbo].[airport] ADD  DEFAULT (NULL) FOR [airport_country]
GO
ALTER TABLE [dbo].[booking_details] ADD  DEFAULT (NULL) FOR [qty]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [airline_id]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [flight_no]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [flight_from]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [flight_to]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [operating_date_from]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [operating_date_to]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [flight_timing_from]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [flight_timing_to]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [total_seats]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [seats_booked]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [seats_blocked]
GO
ALTER TABLE [dbo].[flight] ADD  DEFAULT (NULL) FOR [cost]
GO
USE [master]
GO
ALTER DATABASE [FlightBookingApp] SET  READ_WRITE 
GO
