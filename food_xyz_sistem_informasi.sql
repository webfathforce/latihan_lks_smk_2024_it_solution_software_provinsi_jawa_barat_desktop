USE [master]
GO
/****** Object:  Database [food_xyz_sistem_informasi]    Script Date: 26/04/2024 14:23:25 ******/
CREATE DATABASE [food_xyz_sistem_informasi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'food_xyz_sistem_informasi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\food_xyz_sistem_informasi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'food_xyz_sistem_informasi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\food_xyz_sistem_informasi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [food_xyz_sistem_informasi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ARITHABORT OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET RECOVERY FULL 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET  MULTI_USER 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'food_xyz_sistem_informasi', N'ON'
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET QUERY_STORE = ON
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [food_xyz_sistem_informasi]
GO
/****** Object:  Table [dbo].[tbl_barang]    Script Date: 26/04/2024 14:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_barang](
	[id_barang] [int] IDENTITY(1,1) NOT NULL,
	[kode_barang] [varchar](50) NOT NULL,
	[nama_barang] [varchar](50) NOT NULL,
	[expired_date] [date] NOT NULL,
	[jumlah_barang] [bigint] NOT NULL,
	[satuan] [varchar](50) NOT NULL,
	[harga_satuan] [bigint] NOT NULL,
 CONSTRAINT [PK_tbl_barang] PRIMARY KEY CLUSTERED 
(
	[id_barang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_log]    Script Date: 26/04/2024 14:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_log](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[waktu] [timestamp] NOT NULL,
	[activitas] [varchar](50) NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_tbl_log] PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_transaksi]    Script Date: 26/04/2024 14:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_transaksi](
	[id_transaksi] [int] IDENTITY(1,1) NOT NULL,
	[no_transaksi] [varchar](50) NOT NULL,
	[tgl_transaksi] [date] NOT NULL,
	[total_bayar] [bigint] NOT NULL,
	[id_user] [int] NOT NULL,
	[id_barang] [int] NOT NULL,
 CONSTRAINT [PK_tbl_transaksi] PRIMARY KEY CLUSTERED 
(
	[id_transaksi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 26/04/2024 14:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[tipe_user] [varchar](50) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[alamat] [varchar](150) NOT NULL,
	[telepon] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_log]  WITH CHECK ADD  CONSTRAINT [FK_tbl_log_tbl_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[tbl_user] ([id_user])
GO
ALTER TABLE [dbo].[tbl_log] CHECK CONSTRAINT [FK_tbl_log_tbl_user]
GO
ALTER TABLE [dbo].[tbl_transaksi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_transaksi_tbl_barang] FOREIGN KEY([id_barang])
REFERENCES [dbo].[tbl_barang] ([id_barang])
GO
ALTER TABLE [dbo].[tbl_transaksi] CHECK CONSTRAINT [FK_tbl_transaksi_tbl_barang]
GO
ALTER TABLE [dbo].[tbl_transaksi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_transaksi_tbl_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[tbl_user] ([id_user])
GO
ALTER TABLE [dbo].[tbl_transaksi] CHECK CONSTRAINT [FK_tbl_transaksi_tbl_user]
GO
USE [master]
GO
ALTER DATABASE [food_xyz_sistem_informasi] SET  READ_WRITE 
GO
