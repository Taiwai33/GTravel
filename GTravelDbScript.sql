USE [master]
GO
/****** Object:  Database [GTravelDB]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE DATABASE [GTravelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GTravelDB', FILENAME = N'D:\Program Files\MSSQL14.SQLEXPRESS05\MSSQL\DATA\GTravelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GTravelDB_log', FILENAME = N'D:\Program Files\MSSQL14.SQLEXPRESS05\MSSQL\DATA\GTravelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GTravelDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GTravelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GTravelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GTravelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GTravelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GTravelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GTravelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GTravelDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GTravelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GTravelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GTravelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GTravelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GTravelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GTravelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GTravelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GTravelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GTravelDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GTravelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GTravelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GTravelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GTravelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GTravelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GTravelDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GTravelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GTravelDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GTravelDB] SET  MULTI_USER 
GO
ALTER DATABASE [GTravelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GTravelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GTravelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GTravelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GTravelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GTravelDB] SET QUERY_STORE = OFF
GO
USE [GTravelDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[City] [nvarchar](max) NULL,
	[DOB] [datetime2](7) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attractions]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attractions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Attractions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostCode] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[State] [nvarchar](5) NOT NULL,
	[Longitude] [nvarchar](max) NOT NULL,
	[Latitude] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostCode] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meals]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Breakfast] [int] NOT NULL,
	[Lunch] [int] NOT NULL,
	[Dinner] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_Meals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
	[SalePrice] [decimal](7, 2) NOT NULL,
	[OrderConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourAttractions]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourAttractions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourCityId] [int] NOT NULL,
	[AttractionId] [int] NOT NULL,
 CONSTRAINT [PK_TourAttractions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourCities]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourCities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_TourCities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 11/08/2020 3:58:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[TourDurationDays] [int] NOT NULL,
	[DepartureLocation] [nvarchar](max) NOT NULL,
	[BriefDescription] [nvarchar](150) NOT NULL,
	[FullDescription] [nvarchar](max) NOT NULL,
	[AccommodationNumberOfNights] [int] NOT NULL,
	[RRP] [decimal](7, 2) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[MaxCapacity] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Tours] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200718072236_Initial', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200721233109_AddMealsTable', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200723064938_RemovedProperty_TourCity', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200723065530_AddedNavigationProperty_TourCity', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200729030238_AddedProperty_Status_Tour', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200729063202_CreatedEntities_Orders_Customers', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200804035038_IdentityUserExtended_Employee', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200810104747_AddedProperty_OrderConfirmed_Order', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200811052356_UpdatePropertyLength_BriefDescription_Tour', N'3.1.5')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7d1e604c-502c-4d10-afaa-2ea8c356058a', N'Manager', N'MANAGER', N'0f1f539b-f68a-4893-b35c-156d93f60854')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9f584300-44e7-4d26-96ff-1f718b7a085d', N'Admin', N'ADMIN', N'9c1b25bf-8919-44f5-af13-7b1b126d6100')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0948dafd-d336-438e-a828-d4dd56e6a25c', N'7d1e604c-502c-4d10-afaa-2ea8c356058a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a9d8937-6dda-4601-92ff-a30a8ed7b52c', N'9f584300-44e7-4d26-96ff-1f718b7a085d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [DOB], [FirstName], [LastName], [PostCode], [State], [StreetAddress], [Discriminator]) VALUES (N'0948dafd-d336-438e-a828-d4dd56e6a25c', N'manager@gmail.com', N'MANAGER@GMAIL.COM', N'manager@gmail.com', N'MANAGER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGqulp43Rw0grAPVALlfvtXFZnMgO1+iVrD2dDDEXWLD9QI7i/tH0kVpoXfkepSh/A==', N'7CTIRJQZOW45O3SYK23PKO6KTWKXVS3X', N'3e91b483-6bf7-4558-a97d-409e65895611', N'032166703', 0, 0, NULL, 1, 0, N'Sydney', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Manager', N'manage', NULL, N'Nsw', N'123 King st', N'Employee')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [DOB], [FirstName], [LastName], [PostCode], [State], [StreetAddress], [Discriminator]) VALUES (N'8a9d8937-6dda-4601-92ff-a30a8ed7b52c', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAXh69n8v+Yxc81AxzSG1tfcyv4ejgRVmLxjoLZuQya06MADh//IDdSsyowfkzNG6w==', N'UYE3TGIQLUGGAUCQFXS7TFB3W7J3J7DL', N'72696f42-883e-417c-beaa-4cc3911a7aa6', NULL, 0, 0, NULL, 1, 0, N'Sydney', CAST(N'1992-09-16T00:00:00.0000000' AS DateTime2), N'Admin', N'Admin', N'2000', N'NSW', N'123 Queen street', N'Employee')
GO
SET IDENTITY_INSERT [dbo].[Attractions] ON 

INSERT [dbo].[Attractions] ([Id], [Name], [Description], [CityId]) VALUES (1, N'The Brisbane Wheel', N'Ferris Wheel', 8525)
INSERT [dbo].[Attractions] ([Id], [Name], [Description], [CityId]) VALUES (3, N'Bondi Beach', N'Popular tourist beach', 4533)
INSERT [dbo].[Attractions] ([Id], [Name], [Description], [CityId]) VALUES (4, N'Taronga Zoo', N'Zoo', 21768)
INSERT [dbo].[Attractions] ([Id], [Name], [Description], [CityId]) VALUES (5, N'Test 1 ', N'test', 4533)
INSERT [dbo].[Attractions] ([Id], [Name], [Description], [CityId]) VALUES (6, N'Test 2', N'test', 4533)
SET IDENTITY_INSERT [dbo].[Attractions] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (159, 2480, N'Tucki Tucki                                       ', N'NSW  ', N'153.25943', N'-28.706486')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (176, 2481, N'Tyagarah                                          ', N'NSW  ', N'153.59285', N'-28.660755')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (396, 870, N'Alice Springs                                     ', N'NT   ', N'133.86314', N'-23.702291')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (706, 2540, N'Tapitallee                                        ', N'NSW  ', N'150.61644', N'-34.863483')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (860, 2423, N'Bulahdelah                                        ', N'NSW  ', N'152.2709', N'-32.36486')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (862, 2423, N'Coolongolook                                      ', N'NSW  ', N'152.2709', N'-32.36486')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (947, 2577, N'Knights Hill                                      ', N'NSW  ', N'150.41098', N'-34.595028')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (984, 2580, N'Jerrong                                           ', N'NSW  ', N'149.72922', N'-34.726284')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1000, 2580, N'Spring Valley                                     ', N'NSW  ', N'149.72922', N'-34.726284')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1064, 2583, N'Kialla                                            ', N'NSW  ', N'149.25417', N'-34.196526')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1296, 2567, N'Harrington Park                                   ', N'NSW  ', N'150.7565', N'-34.055157')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1442, 2390, N'Narrabri                                          ', N'NSW  ', N'149.76753', N'-30.41333')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1583, 2360, N'Spring Mountain                                   ', N'NSW  ', N'151.16202', N'-29.630053')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1597, 2365, N'Black Mountain                                    ', N'NSW  ', N'151.67303', N'-30.115913')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1613, 2365, N'South Guyra                                       ', N'NSW  ', N'151.67303', N'-30.115913')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1625, 2370, N'Furracabad                                        ', N'NSW  ', N'151.8694', N'-29.736172')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1634, 2370, N'Moogem                                            ', N'NSW  ', N'151.8694', N'-29.736172')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1739, 2469, N'Mororo                                            ', N'NSW  ', N'153.0024', N'-29.338404')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1803, 2450, N'Lowanna                                           ', N'NSW  ', N'152.65826', N'-30.097727')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (1956, 2441, N'Cooperabung                                       ', N'NSW  ', N'152.83138', N'-30.816097')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2085, 2533, N'Kiama Heights                                     ', N'NSW  ', N'150.75688', N'-34.64538')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2184, 2540, N'Bolong                                            ', N'NSW  ', N'150.61644', N'-34.863483')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2271, 2500, N'Mount Keira                                       ', N'NSW  ', N'150.8743', N'-34.423172')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2272, 2500, N'Mount Saint Thomas                                ', N'NSW  ', N'150.8743', N'-34.423172')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2276, 2500, N'Wollongong West                                   ', N'NSW  ', N'150.8743', N'-34.423172')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2555, 2259, N'Wyong                                             ', N'NSW  ', N'151.37721', N'-33.2088')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2746, 2250, N'Mount Elliot                                      ', N'NSW  ', N'151.18924', N'-33.325375')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2825, 2166, N'Cabramatta                                        ', N'NSW  ', N'150.92937', N'-33.89274')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (2917, 2339, N'Warrah                                            ', N'NSW  ', N'150.60327', N'-31.735739')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3009, 2350, N'East Armidale                                     ', N'NSW  ', N'151.90616', N'-30.493397')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3039, 2354, N'Kentucky                                          ', N'NSW  ', N'151.76263', N'-31.145899')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3365, 2430, N'Red Head                                          ', N'NSW  ', N'152.5032', N'-31.899311')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3382, 2439, N'Logans Crossing                                   ', N'NSW  ', N'152.65216', N'-31.654722')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3403, 2292, N'Hamilton North                                    ', N'NSW  ', N'151.74072', N'-32.931587')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3450, 2311, N'Lewinsbrook                                       ', N'NSW  ', N'151.52252', N'-32.3438')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3578, 2729, N'Wondalga                                          ', N'NSW  ', N'147.9238', N'-35.227753')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3612, 2660, N'Carnsdale                                         ', N'NSW  ', N'147.07831', N'-35.699905')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (3805, 2650, N'Cartwrights Hill                                  ', N'NSW  ', N'147.3762', N'-35.07459')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4013, 2640, N'Wirlinga                                          ', N'NSW  ', N'147.02655', N'-36.016197')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4072, 2617, N'Evatt                                             ', N'ACT  ', N'149.08669', N'-35.231277')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4303, 2608, N'Civic Square                                      ', N'ACT  ', N'149.12938', N'-35.282867')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4455, 2102, N'Warriewood                                        ', N'NSW  ', N'151.29095', N'-33.68994')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4502, 2011, N'Kings Cross                                       ', N'NSW  ', N'151.22162', N'-33.8736')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4504, 2011, N'Rushcutters Bay                                   ', N'NSW  ', N'151.22162', N'-33.8736')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4533, 2026, N'Bondi                                             ', N'NSW  ', N'151.26897', N'-33.89104')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4534, 2026, N'Bondi Beach                                       ', N'NSW  ', N'151.26897', N'-33.89104')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4537, 2027, N'Darling Point                                     ', N'NSW  ', N'151.25049', N'-33.868973')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4540, 2027, N'Point Piper                                       ', N'NSW  ', N'151.25049', N'-33.868973')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4541, 2028, N'Double Bay                                        ', N'NSW  ', N'151.24097', N'-33.878414')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4557, 2034, N'South Coogee                                      ', N'NSW  ', N'151.25217', N'-33.929096')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4565, 2036, N'Little Bay                                        ', N'NSW  ', N'151.23784', N'-33.969624')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4746, 3000, N'Melbourne                                         ', N'VIC  ', N'144.95677', N'-37.8174')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4926, 2870, N'Tichborne                                         ', N'NSW  ', N'148.16818', N'-33.035496')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (4993, 2899, N'Norfolk Island                                    ', N'NSW  ', N'146.92879', N'-36.084232')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (5175, 2820, N'Yarragal                                          ', N'NSW  ', N'148.98923', N'-32.553284')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (5690, 2765, N'Oakville                                          ', N'NSW  ', N'150.86026', N'-33.663002')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (5826, 3431, N'Riddells Creek                                    ', N'VIC  ', N'144.69202', N'-37.474552')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6023, 3350, N'Golden Point                                      ', N'VIC  ', N'143.8645', N'-37.57194')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6208, 3315, N'Tahara Bridge                                     ', N'VIC  ', N'141.68752', N'-37.40837')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6277, 3340, N'Merrimu                                           ', N'VIC  ', N'144.39444', N'-37.787136')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6278, 3340, N'Parwan                                            ', N'VIC  ', N'144.39444', N'-37.787136')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6313, 3268, N'Curdie Vale                                       ', N'VIC  ', N'142.9089', N'-38.5358')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6623, 3194, N'Mentone                                           ', N'VIC  ', N'145.06735', N'-37.985058')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6634, 3196, N'Chelsea                                           ', N'VIC  ', N'145.12276', N'-38.04648')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6639, 3198, N'Belvedere Park                                    ', N'VIC  ', N'145.13782', N'-38.103195')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6676, 3216, N'Freshwater Creek                                  ', N'VIC  ', N'144.334', N'-38.215904')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6681, 3216, N'Mount Duneed                                      ', N'VIC  ', N'144.334', N'-38.215904')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (6685, 3218, N'Geelong West                                      ', N'VIC  ', N'144.33098', N'-38.13873')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7297, 3584, N'Lake Boga                                         ', N'VIC  ', N'143.63762', N'-35.431026')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7453, 3556, N'Jackass Flat                                      ', N'VIC  ', N'144.17828', N'-36.65642')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7495, 3564, N'Mcevoys                                           ', N'VIC  ', N'144.7288', N'-36.169')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7525, 3571, N'Tandarra                                          ', N'VIC  ', N'144.20686', N'-36.36819')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7582, 3520, N'Korong Vale                                       ', N'VIC  ', N'143.81079', N'-36.40577')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7630, 3533, N'Mittyack                                          ', N'VIC  ', N'142.83931', N'-35.384556')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7809, 3500, N'Paringi                                           ', N'NSW  ', N'142.15416', N'-34.1931')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7952, 3465, N'Majorca                                           ', N'VIC  ', N'143.61133', N'-37.021477')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7982, 3472, N'Moliagul                                          ', N'VIC  ', N'143.65764', N'-36.864952')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (7986, 4120, N'Greenslopes                                       ', N'QLD  ', N'153.04422', N'-27.508707')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8169, 4074, N'Westlake                                          ', N'QLD  ', N'152.92152', N'-27.554083')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8232, 4110, N'Pallara                                           ', N'QLD  ', N'153.00952', N'-27.612179')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8302, 4014, N'Virginia Dc                                       ', N'QLD  ', N'153.08478', N'-27.373947')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8400, 3959, N'Fish Creek                                        ', N'VIC  ', N'146.06653', N'-38.734634')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8525, 4000, N'Brisbane                                          ', N'QLD  ', N'153.02213', N'-27.468391')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8546, 3898, N'Anglers Rest                                      ', N'VIC  ', N'147.4648', N'-37.06617')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8593, 3922, N'Summerlands                                       ', N'VIC  ', N'145.23198', N'-38.48218')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8644, 3950, N'Whitelaw                                          ', N'VIC  ', N'145.81294', N'-38.43522')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8674, 3956, N'Walkerville                                       ', N'VIC  ', N'145.95534', N'-38.59702')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8685, 3865, N'Lindenow                                          ', N'VIC  ', N'147.45595', N'-37.79674')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8737, 3875, N'Waterholes                                        ', N'VIC  ', N'147.56111', N'-37.670456')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (8892, 3850, N'Sale                                              ', N'VIC  ', N'147.10619', N'-38.22419')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9011, 3797, N'Gilderoy                                          ', N'VIC  ', N'145.78635', N'-37.86781')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9165, 4507, N'Bribie Island                                     ', N'QLD  ', N'153.12415', N'-26.987776')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9204, 4517, N'Beerburrum                                        ', N'QLD  ', N'152.98764', N'-26.951082')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9290, 4417, N'Weribone                                          ', N'QLD  ', N'149.07018', N'-27.3482')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9314, 4425, N'Dulacca                                           ', N'QLD  ', N'149.77315', N'-26.649075')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9371, 4478, N'Bayrick                                           ', N'QLD  ', N'146.39941', N'-24.889395')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9380, 4478, N'Yandarlo                                          ', N'QLD  ', N'146.39941', N'-24.889395')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9444, 4380, N'Greenlands                                        ', N'QLD  ', N'151.67543', N'-28.664595')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9632, 4356, N'Motley                                            ', N'QLD  ', N'151.55028', N'-27.663074')
GO
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9642, 4356, N'Stoneleigh                                        ', N'QLD  ', N'151.55028', N'-27.663074')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9738, 4343, N'Vinegar Hill                                      ', N'QLD  ', N'152.22461', N'-27.656075')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9932, 5671, N'Calca                                             ', N'SA   ', N'134.67377', N'-33.21045')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9944, 5680, N'Pureba                                            ', N'SA   ', N'134.37909', N'-32.6728')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (9992, 5731, N'Durham Downs                                      ', N'SA   ', N'139.66624', N'-29.81833')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10027, 6000, N'Perth                                             ', N'WA   ', N'115.85991', N'-31.948763')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10033, 6005, N'Kings Park                                        ', N'WA   ', N'115.8369', N'-31.95707')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10071, 7140, N'Malbina                                           ', N'TAS  ', N'146.45502', N'-42.544216')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10170, 7190, N'Runnymede                                         ', N'TAS  ', N'148.09169', N'-42.62988')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10394, 6963, N'Hamilton Hill                                     ', N'WA   ', N'115.788704', N'-32.076946')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10418, 7000, N'Glebe                                             ', N'TAS  ', N'147.308', N'-42.878353')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10419, 7000, N'Hobart                                            ', N'TAS  ', N'147.308', N'-42.878353')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10420, 7000, N'Mount Stuart                                      ', N'TAS  ', N'147.308', N'-42.878353')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10478, 6701, N'Yandoo Creek                                      ', N'WA   ', N'115.15198', N'-24.734545')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10533, 6721, N'Wedgefield                                        ', N'WA   ', N'118.44172', N'-20.710798')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10730, 6642, N'Angelo River                                      ', N'WA   ', N'118.55494', N'-25.639378')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10806, 6522, N'Bundanoon                                         ', N'WA   ', N'115.485565', N'-29.139368')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (10870, 6532, N'East Nabawa                                       ', N'WA   ', N'115.00459', N'-28.440886')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11105, 6415, N'Tandegin                                          ', N'WA   ', N'118.289986', N'-31.481222')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11154, 6430, N'Mullingar                                         ', N'WA   ', N'121.44648', N'-30.599072')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11397, 7315, N'Ulverstone                                        ', N'TAS  ', N'146.0724', N'-41.303173')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11465, 7322, N'Somerset                                          ', N'TAS  ', N'145.80453', N'-41.04447')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11497, 7263, N'Alberton                                          ', N'TAS  ', N'147.70265', N'-41.308784')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11577, 7303, N'Osmaston                                          ', N'TAS  ', N'146.81508', N'-41.594913')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11731, 7255, N'Palana                                            ', N'TAS  ', N'148.32925', N'-39.94938')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11829, 4309, N'Moogerah                                          ', N'QLD  ', N'152.52336', N'-27.98728')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11894, 4312, N'Somerset Dam                                      ', N'QLD  ', N'152.48264', N'-27.256065')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (11994, 4303, N'Dinmore                                           ', N'QLD  ', N'152.84018', N'-27.604588')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12080, 4211, N'Clagiraba                                         ', N'QLD  ', N'153.24126', N'-28.035454')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12209, 4737, N'Blue Mountain                                     ', N'QLD  ', N'149.17807', N'-21.43004')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12239, 4740, N'Dundula                                           ', N'QLD  ', N'149.05974', N'-21.33763')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12309, 4741, N'Long Island                                       ', N'QLD  ', N'149.2717', N'-20.808598')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12371, 4703, N'Cobraball                                         ', N'QLD  ', N'150.89433', N'-23.074562')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12401, 4705, N'Mount Gardiner                                    ', N'QLD  ', N'149.71921', N'-22.771751')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12504, 4680, N'Wooderson                                         ', N'QLD  ', N'151.91728', N'-23.446827')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12515, 4695, N'The Narrows                                       ', N'QLD  ', N'150.96587', N'-23.807116')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (12524, 4700, N'Rockhampton                                       ', N'QLD  ', N'150.95811', N'-23.180174')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13020, 4625, N'The Limits                                        ', N'QLD  ', N'151.64418', N'-25.571054')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13026, 4625, N'Yenda                                             ', N'QLD  ', N'151.64418', N'-25.571054')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13202, 4553, N'Mooloolah                                         ', N'QLD  ', N'153.01796', N'-26.771797')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13389, 5082, N'Prospect                                          ', N'SA   ', N'138.58708', N'-34.886017')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13457, 5015, N'Birkenhead                                        ', N'SA   ', N'138.53157', N'-34.808422')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13772, 4871, N'Kidston                                           ', N'QLD  ', N'145.99408', N'-16.934183')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13786, 4871, N'Mount Molloy                                      ', N'QLD  ', N'145.99408', N'-16.934183')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13852, 4873, N'Whyanbeel                                         ', N'QLD  ', N'145.29909', N'-16.230854')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13923, 4858, N'New Harbourline                                   ', N'QLD  ', N'146.07881', N'-17.622583')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (13981, 4869, N'Edmonton                                          ', N'QLD  ', N'145.73042', N'-17.025593')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14050, 4824, N'Oorindi                                           ', N'QLD  ', N'140.65253', N'-20.777472')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14096, 4829, N'Amaroo                                            ', N'QLD  ', N'140.22124', N'-23.329939')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14247, 4816, N'Maxwelton                                         ', N'QLD  ', N'146.79153', N'-19.787857')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14253, 4816, N'Palm Island                                       ', N'QLD  ', N'146.79153', N'-19.787857')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14346, 4798, N'Mentmore                                          ', N'QLD  ', N'148.7378', N'-20.889915')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14400, 4802, N'Whitsundays                                       ', N'QLD  ', N'148.98904', N'-20.271072')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14402, 4803, N'Hamilton Island                                   ', N'QLD  ', N'148.95882', N'-20.354067')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14414, 4805, N'Gumlu                                             ', N'QLD  ', N'148.458', N'-20.016611')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14492, 5583, N'Coobowie                                          ', N'SA   ', N'137.82593', N'-35.117695')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14530, 5607, N'Koppio                                            ', N'SA   ', N'136.45645', N'-35.156445')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14547, 5607, N'Sullivan                                          ', N'SA   ', N'136.45645', N'-35.156445')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14704, 5555, N'Melton                                            ', N'SA   ', N'138.19116', N'-33.65681')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14708, 5556, N'North Beach                                       ', N'SA   ', N'137.61082', N'-33.95085')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (14709, 5556, N'Wallaroo                                          ', N'SA   ', N'137.61082', N'-33.95085')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15079, 5275, N'Wangolina                                         ', N'SA   ', N'139.93712', N'-36.61323')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15096, 5279, N'Short                                             ', N'SA   ', N'140.4625', N'-37.57469')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15421, 5223, N'Bay Of Shoals                                     ', N'SA   ', N'137.54172', N'-35.81136')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15705, 6386, N'Shackleton                                        ', N'WA   ', N'117.81514', N'-31.950073')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15735, 6311, N'Contine                                           ', N'WA   ', N'117.120895', N'-32.80353')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15779, 6317, N'Moojebing                                         ', N'WA   ', N'117.738914', N'-33.64736')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15838, 6330, N'Lower King                                        ', N'WA   ', N'117.86329', N'-34.905437')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15852, 6330, N'Orana                                             ', N'WA   ', N'117.86329', N'-34.905437')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (15913, 6280, N'Geographe                                         ', N'WA   ', N'115.302734', N'-33.728947')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (16029, 6220, N'Uduc                                              ', N'WA   ', N'116.02978', N'-33.03122')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (16443, 6147, N'Parkwood                                          ', N'WA   ', N'115.94135', N'-32.04377')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (16496, 6020, N'North Beach                                       ', N'WA   ', N'115.765396', N'-31.852697')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (16513, 6027, N'Connolly                                          ', N'WA   ', N'115.75641', N'-31.763348')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20126, 870, N'The Gap                                           ', N'NT   ', N'133.8741', N'-23.71394')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20224, 2145, N'Constitution Hill                                 ', N'NSW  ', N'150.97516', N'-33.793823')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20341, 2423, N'Yagon                                             ', N'NSW  ', N'152.47795', N'-32.439606')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20415, 2470, N'Tomki                                             ', N'NSW  ', N'153.13272', N'-28.863195')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20462, 2500, N'Spring Hill                                       ', N'NSW  ', N'150.86966', N'-34.452713')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20567, 2620, N'Crestwood                                         ', N'NSW  ', N'149.21753', N'-35.348454')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20654, 2756, N'Pitt Town Bottoms                                 ', N'NSW  ', N'150.84607', N'-33.58586')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20803, 3338, N'Strathtulloh                                      ', N'VIC  ', N'144.59691', N'-37.73399')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20818, 3377, N'Shays Flat                                        ', N'VIC  ', N'143.08714', N'-37.066833')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20849, 3401, N'Wail                                              ', N'VIC  ', N'142.0867', N'-36.529957')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20891, 3549, N'Robinvale Irrigation District Section B           ', N'VIC  ', N'142.7896', N'-34.612076')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (20987, 3862, N'Miowera                                           ', N'VIC  ', N'147.07484', N'-37.47115')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21020, 4025, N'Moreton Island                                    ', N'QLD  ', N'153.40643', N'-27.14791')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21178, 4551, N'Baringa                                           ', N'QLD  ', N'153.08305', N'-26.81041')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21284, 4871, N'Fitzroy Island                                    ', N'QLD  ', N'145.99452', N'-16.933077')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21294, 4871, N'Springfield                                       ', N'QLD  ', N'144.51569', N'-17.932308')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21305, 4874, N'Jardine River                                     ', N'QLD  ', N'142.73749', N'-11.303184')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21308, 4874, N'Shelburne                                         ', N'QLD  ', N'142.98534', N'-12.016115')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21350, 5201, N'Kuitpo                                            ', N'SA   ', N'138.68143', N'-35.214912')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21421, 5301, N'Netherton                                         ', N'SA   ', N'139.9674', N'-35.509075')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21554, 5490, N'Caltowie West                                     ', N'SA   ', N'138.39105', N'-33.154613')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21555, 5491, N'Belalie North                                     ', N'SA   ', N'138.70233', N'-33.15446')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21644, 5690, N'Yellabinna                                        ', N'SA   ', N'133.32509', N'-31.122444')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21767, 6244, N'Trigwell                                          ', N'WA   ', N'116.575165', N'-33.628883')
INSERT [dbo].[Cities] ([Id], [PostCode], [Name], [State], [Longitude], [Latitude]) VALUES (21768, 2000, N'Sydney', N'NSW', N'151.2099', N'-33.865143')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [StreetAddress], [City], [State], [PostCode], [Phone], [Email]) VALUES (1, N'Jane', N'Smith', N'21 Queen st', N'Sydney', N'NSW', N'2000', N'235256696', N'jane@gmail.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [StreetAddress], [City], [State], [PostCode], [Phone], [Email]) VALUES (2, N'john', N'smith', N'32 real street', N'Brisbane', N'NSW', N'4000', N'321212', N'john@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Meals] ON 

INSERT [dbo].[Meals] ([Id], [Breakfast], [Lunch], [Dinner], [TourId]) VALUES (9, 5, 3, 2, 8)
SET IDENTITY_INSERT [dbo].[Meals] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [TourId], [SalePrice], [OrderConfirmed]) VALUES (1, 1, 8, CAST(1000.00 AS Decimal(7, 2)), 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [TourId], [SalePrice], [OrderConfirmed]) VALUES (2, 2, 12, CAST(1500.00 AS Decimal(7, 2)), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[TourAttractions] ON 

INSERT [dbo].[TourAttractions] ([Id], [TourCityId], [AttractionId]) VALUES (3, 8, 3)
INSERT [dbo].[TourAttractions] ([Id], [TourCityId], [AttractionId]) VALUES (4, 8, 6)
SET IDENTITY_INSERT [dbo].[TourAttractions] OFF
GO
SET IDENTITY_INSERT [dbo].[TourCities] ON 

INSERT [dbo].[TourCities] ([Id], [TourId], [CityId]) VALUES (6, 8, 2184)
INSERT [dbo].[TourCities] ([Id], [TourId], [CityId]) VALUES (7, 8, 4534)
INSERT [dbo].[TourCities] ([Id], [TourId], [CityId]) VALUES (8, 8, 4533)
SET IDENTITY_INSERT [dbo].[TourCities] OFF
GO
SET IDENTITY_INSERT [dbo].[Tours] ON 

INSERT [dbo].[Tours] ([Id], [Name], [TourDurationDays], [DepartureLocation], [BriefDescription], [FullDescription], [AccommodationNumberOfNights], [RRP], [Image], [MaxCapacity], [StatusId]) VALUES (8, N'Local Sydney Explore', 12, N'Bondi                                             ', N'fun fun fun trip', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Morbi enim nunc faucibus a. Velit egestas dui id ornare arcu odio. Sed sed risus pretium quam vulputate dignissim. Feugiat in fermentum posuere urna nec tincidunt. Ac tortor vitae purus faucibus ornare suspendisse sed. Consectetur lorem donec massa sapien faucibus et molestie. Felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices. Odio pellentesque diam volutpat commodo sed egestas. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Mattis molestie a iaculis at erat pellentesque adipiscing commodo elit. Libero enim sed faucibus turpis in. Pharetra convallis posuere morbi leo urna molestie. Nunc pulvinar sapien et ligula ullamcorper malesuada.

', 2, CAST(1000.00 AS Decimal(7, 2)), N'\images\29073220-54f9-48ec-9772-92f6ba0d2316.jpg', 2, 2)
INSERT [dbo].[Tours] ([Id], [Name], [TourDurationDays], [DepartureLocation], [BriefDescription], [FullDescription], [AccommodationNumberOfNights], [RRP], [Image], [MaxCapacity], [StatusId]) VALUES (12, N'Sunshine to Goldie', 3, N'Brisbane                                          ', N'Start at the infamous Surfers paradise and travel along the coast all the way to Maroochydore!', N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, CAST(1500.00 AS Decimal(7, 2)), N'\images\6201c6cc-93f8-4864-89cb-e2ebd44748a7.jpg', 8, 2)
INSERT [dbo].[Tours] ([Id], [Name], [TourDurationDays], [DepartureLocation], [BriefDescription], [FullDescription], [AccommodationNumberOfNights], [RRP], [Image], [MaxCapacity], [StatusId]) VALUES (13, N'test', 2, N'Bribie Island                                     ', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', N'Mix and match multiple content types to create the card you need, or throw everything in there. Shown below are image styles, blocks, text styles, and a list group—all wrapped in a fixed-width card. Mix and match multiple content types to create the card you need, or throw everything in there. Shown below are image styles, blocks, text styles, and a list group—all wrapped in a fixed-width card.', 1, CAST(333.00 AS Decimal(7, 2)), N'\images\51d5440d-6a51-4713-90c6-ad9b5e0e7112.jpg', 3, 1)
SET IDENTITY_INSERT [dbo].[Tours] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attractions_CityId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_Attractions_CityId] ON [dbo].[Attractions]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Meals_TourId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Meals_TourId] ON [dbo].[Meals]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_TourId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_Orders_TourId] ON [dbo].[Orders]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TourAttractions_AttractionId_TourCityId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TourAttractions_AttractionId_TourCityId] ON [dbo].[TourAttractions]
(
	[AttractionId] ASC,
	[TourCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TourAttractions_TourCityId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_TourAttractions_TourCityId] ON [dbo].[TourAttractions]
(
	[TourCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TourCities_CityId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_TourCities_CityId] ON [dbo].[TourCities]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TourCities_TourId]    Script Date: 11/08/2020 3:58:11 pm ******/
CREATE NONCLUSTERED INDEX [IX_TourCities_TourId] ON [dbo].[TourCities]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (CONVERT([bit],(0))) FOR [OrderConfirmed]
GO
ALTER TABLE [dbo].[Tours] ADD  DEFAULT ((0)) FOR [StatusId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Attractions]  WITH CHECK ADD  CONSTRAINT [FK_Attractions_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Attractions] CHECK CONSTRAINT [FK_Attractions_Cities_CityId]
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD  CONSTRAINT [FK_Meals_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Meals] CHECK CONSTRAINT [FK_Meals_Tours_TourId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Tours_TourId]
GO
ALTER TABLE [dbo].[TourAttractions]  WITH CHECK ADD  CONSTRAINT [FK_TourAttractions_Attractions_AttractionId] FOREIGN KEY([AttractionId])
REFERENCES [dbo].[Attractions] ([Id])
GO
ALTER TABLE [dbo].[TourAttractions] CHECK CONSTRAINT [FK_TourAttractions_Attractions_AttractionId]
GO
ALTER TABLE [dbo].[TourAttractions]  WITH CHECK ADD  CONSTRAINT [FK_TourAttractions_TourCities_TourCityId] FOREIGN KEY([TourCityId])
REFERENCES [dbo].[TourCities] ([Id])
GO
ALTER TABLE [dbo].[TourAttractions] CHECK CONSTRAINT [FK_TourAttractions_TourCities_TourCityId]
GO
ALTER TABLE [dbo].[TourCities]  WITH CHECK ADD  CONSTRAINT [FK_TourCities_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[TourCities] CHECK CONSTRAINT [FK_TourCities_Cities_CityId]
GO
ALTER TABLE [dbo].[TourCities]  WITH CHECK ADD  CONSTRAINT [FK_TourCities_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
GO
ALTER TABLE [dbo].[TourCities] CHECK CONSTRAINT [FK_TourCities_Tours_TourId]
GO
USE [master]
GO
ALTER DATABASE [GTravelDB] SET  READ_WRITE 
GO
