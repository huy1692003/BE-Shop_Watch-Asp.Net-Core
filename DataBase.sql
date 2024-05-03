USE [master]
GO
/****** Object:  Database [BanDongHo]    Script Date: 02-12-2023 10:34:39 PM ******/
CREATE DATABASE [BanDongHo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanDongHo', FILENAME = N'D:\SQL_Sever\MSSQL16.MSSQLSERVER\MSSQL\DATA\BanDongHo.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanDongHo_log', FILENAME = N'D:\SQL_Sever\MSSQL16.MSSQLSERVER\MSSQL\DATA\BanDongHo_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BanDongHo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanDongHo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanDongHo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanDongHo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanDongHo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanDongHo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanDongHo] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanDongHo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanDongHo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanDongHo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanDongHo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanDongHo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanDongHo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanDongHo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanDongHo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanDongHo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanDongHo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanDongHo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanDongHo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanDongHo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanDongHo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanDongHo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanDongHo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanDongHo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanDongHo] SET RECOVERY FULL 
GO
ALTER DATABASE [BanDongHo] SET  MULTI_USER 
GO
ALTER DATABASE [BanDongHo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanDongHo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanDongHo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanDongHo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanDongHo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanDongHo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanDongHo', N'ON'
GO
ALTER DATABASE [BanDongHo] SET QUERY_STORE = ON
GO
ALTER DATABASE [BanDongHo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BanDongHo]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonBan]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonBan](
	[MaChiTietHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [float] NULL,
	[TongTien] [float] NULL,
	[imageSP] [varchar](300) NULL,
	[tenSP] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaChiTietHDN] [int] IDENTITY(1,1) NOT NULL,
	[MaHDN] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [float] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[maGH] [int] IDENTITY(1,1) NOT NULL,
	[maSP] [int] NULL,
	[tenSP] [nvarchar](200) NULL,
	[anhSP] [nvarchar](300) NULL,
	[soluong] [int] NULL,
	[giaban] [float] NULL,
	[tongtien] [float] NULL,
	[taikhoan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayDuyet] [datetime] NULL,
	[TenKH] [nvarchar](50) NULL,
	[Diachi] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[ThanhTien] [float] NULL,
	[DiaChiGiaoHang] [nvarchar](350) NULL,
	[ThoiGianGiaoHang] [datetime] NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[NgayHuy] [datetime] NULL,
	[methodPay] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNCC] [int] NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[methodPay] [nvarchar](150) NULL,
	[Tongtien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTaiKhoans]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoans](
	[MaLoaiTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[mota] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](30) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaTH] [int] NULL,
	[TenMH] [nvarchar](50) NOT NULL,
	[MaLoai] [int] NULL,
	[soLuongton] [int] NULL,
	[GiaBan] [float] NULL,
	[image_SP] [nvarchar](max) NULL,
	[mota] [nvarchar](max) NULL,
	[sldaban] [int] NULL,
	[trangthai] [nvarchar](255) NULL,
	[luotxem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoans]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoans](
	[TenTaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MaLoaiTaiKhoan] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
	[Token] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[Ghichu] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 02-12-2023 10:34:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](255) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonBan] ON 
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (62, 48, 111, 17, 1111116, 18200000, N'/image/watch11.jpg', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (63, 51, 109, 23, 1111110, 25320000, N'/image/watch17.png', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (65, 51, 104, 9, 1111110, 21328880, N'/image/watch17.png', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (66, 51, 104, 8, 500000, 9000000, NULL, NULL)
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (67, 54, 97, 10, 1111110, 11111100, N'/image/watch2.jpg', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (71, 58, 97, 1, 1111110, 1111110, N'/image/watch2.jpg', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (73, 61, 97, 1, 1111110, 1111110, N'/image/watch2.jpg', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (75, 62, 107, 6, 1111110, 9200002, N'/image/watch18.png', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (77, 64, 107, 7, 1111110, 8203000, N'/image/watch18.png', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (79, 66, 97, 1, 1111110, 1111110, N'/image/watch2.jpg', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (80, 68, 110, 12, 1111110, 15300200, N'/image/watch11.jpg_638368944467519299', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (82, 68, 128, 6, 8000000, 48000000, N'/image/watch17.jpg_638368945003125603', N'Đồng Hồ Treo Tường K8272')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (84, 70, 113, 14, 3500000, 17230000, N'/image/watch1.webp', N'Đồng Hồ  Đôi Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (1068, 1054, 106, 1, 1111110, 1111110, N'/image/watch20.jpg', N'Đồng Hồ Kawasaki')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHD], [MaHD], [MaSP], [SoLuong], [GiaBan], [TongTien], [imageSP], [tenSP]) VALUES (1069, 1054, 100, 1, 1111110, 1111110, N'/image/watch5.jpg', N'Đồng Hồ Kawasaki')
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhap] ON 
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (4, 3, 106, 12, 2131231, 25574772)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (12, 8, 99, 123, 123, 15129)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (13, 9, 101, 12, 132, 1584)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (16, 12, 100, 2342, 23432, 54877744)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (17, 12, 102, 3, 3232, 9696)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (18, 13, 99, 1232, 23423, 28857136)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (20, 15, 98, 123, 1232, 151536)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (21, 15, 100, 24, 23423, 562152)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (25, 16, 98, 223, 242, 53966)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (28, 11, 101, 22, 300000, 6600000)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (29, 9, 107, 442, 2342343, 1035315606)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (30, 8, 104, 1243, 23423, 29114789)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (33, 19, 97, 10, 30000, 300000)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (34, 19, 98, 20, 300000, 6000000)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (35, 18, 98, 10, 10, 100)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHDN], [MaHDN], [MaSP], [SoLuong], [GiaNhap], [TongTien]) VALUES (1031, 1017, 104, 13, 2340000, 30420000)
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 
GO
INSERT [dbo].[GioHang] ([maGH], [maSP], [tenSP], [anhSP], [soluong], [giaban], [tongtien], [taikhoan]) VALUES (1052, 110, N'Đồng Hồ Kawasaki', N'/image/watch10.jpg', 34, 1111110, 37777740, N'admin')
GO
INSERT [dbo].[GioHang] ([maGH], [maSP], [tenSP], [anhSP], [soluong], [giaban], [tongtien], [taikhoan]) VALUES (1053, 100, N'Đồng Hồ Kawasaki', N'/image/watch5.jpg', 13, 1111110, 14444430, N'admin')
GO
INSERT [dbo].[GioHang] ([maGH], [maSP], [tenSP], [anhSP], [soluong], [giaban], [tongtien], [taikhoan]) VALUES (1054, 116, N'Đồng Hồ Đôi Kawasaki', N'/image/watch18.jpg', 1, 1111110, 1111110, N'admin')
GO
INSERT [dbo].[GioHang] ([maGH], [maSP], [tenSP], [anhSP], [soluong], [giaban], [tongtien], [taikhoan]) VALUES (1055, 97, N'Đồng Hồ Kawasaki', N'/image/watch2.jpg', 1, 1111110, 1111110, N'admin')
GO
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] ON 
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (48, 1, CAST(N'2023-02-17T23:07:39.577' AS DateTime), CAST(N'2023-11-17T23:55:59.387' AS DateTime), N'Đào Quang Huy', N'Hưng Yên', N'daohuy1692003@gmail.com', N'364174636', 111111610, N'Hưng Yên', CAST(N'2023-11-19T23:10:39.577' AS DateTime), N'huy', NULL, N'Thanh toán qua ATM')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (51, 1, CAST(N'2023-11-21T08:07:34.893' AS DateTime), CAST(N'2023-12-01T15:45:43.090' AS DateTime), N'Nguyễn Văn Tuấn', N'Hưng Yên', N'h@gmail.com', N'12345532', 8888880, N'Hưng Yên', CAST(N'2023-11-23T08:07:34.893' AS DateTime), N'huy', NULL, N'Thanh toán khi nhận hàng')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (52, 2, CAST(N'2023-10-21T00:00:00.000' AS DateTime), NULL, N'Đào Quang Huy', N'Hà Nội', N'kien123.com', N'0364174636', 9000000, NULL, NULL, N'kien', CAST(N'2023-12-01T20:36:43.890' AS DateTime), NULL)
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (53, 2, CAST(N'2023-04-15T00:00:00.000' AS DateTime), NULL, N'Đào Quang Huy', N'Hồ Chí Minh', N'thao@gmail.com', N'001987643', 45000000, N'Hải Dương', NULL, N'huy', NULL, NULL)
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (54, 0, CAST(N'2023-08-01T19:23:02.277' AS DateTime), NULL, N'Đào Quang Huy', N'Hưng Yên', N'huy@gmail.com', N'364174636', 11111100, N'Yên Khê _ Việt Hòa _ Khoái Châu', CAST(N'2023-12-03T19:23:02.277' AS DateTime), N'huy', NULL, N'Thanh toán qua Momo')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (58, 0, CAST(N'2023-12-01T19:25:28.313' AS DateTime), NULL, N'Đào Quang Huy', N'0364174636', N'huy@gmail.com', N'364174636', 1111110, N'Hưng Yên', CAST(N'2023-12-03T19:25:28.313' AS DateTime), N'kien', NULL, N'Thanh toán qua Momo')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (61, 0, CAST(N'2023-12-01T19:33:00.733' AS DateTime), NULL, N'h', N'f', N'f@gmail.com', N'123122332', 1111110, N'ff', CAST(N'2023-12-03T19:33:00.733' AS DateTime), N'quang', NULL, N'Thanh toán qua Momo')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (62, 0, CAST(N'2023-12-01T19:37:36.190' AS DateTime), NULL, N'h', N'h', N'h@d.com', N'298743', 1111110, N'f', CAST(N'2023-12-03T19:37:36.190' AS DateTime), N'thao', NULL, N'Thanh toán qua ATM')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (64, 0, CAST(N'2023-11-01T19:40:18.803' AS DateTime), NULL, N'h', N'h', N'h@d.com', N'298743', 92003000, N'f', CAST(N'2023-12-03T19:40:18.803' AS DateTime), N'quyen', NULL, N'Thanh toán qua ATM')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (66, 0, CAST(N'2023-01-01T19:46:18.363' AS DateTime), NULL, N'huy', N'hdhs', N'sfdfsd@d.com', N'19283767', 11111100, N'13231000', CAST(N'2023-12-03T19:46:18.363' AS DateTime), N'thao', NULL, N'Thanh toán qua ATM')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (68, 0, CAST(N'2023-06-01T20:19:52.997' AS DateTime), NULL, N'Đào Quang Huy', N'22423', N'huy@gmail.com', N'2423423', 49111110, N'23423423', CAST(N'2023-12-03T20:19:52.997' AS DateTime), N'huy', NULL, N'Thanh toán khi nhận hàng')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (70, 2, CAST(N'2023-12-01T20:21:10.553' AS DateTime), NULL, N'huy', N'123123', N'h@h.com', N'123123', 3500000, N'Hưng Yên', CAST(N'2023-12-03T20:21:10.553' AS DateTime), N'quang', CAST(N'2023-12-01T20:37:16.297' AS DateTime), N'Thanh toán qua Momo')
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [TrangThai], [NgayTao], [NgayDuyet], [TenKH], [Diachi], [Email], [SDT], [ThanhTien], [DiaChiGiaoHang], [ThoiGianGiaoHang], [TenTaiKhoan], [NgayHuy], [methodPay]) VALUES (1054, 0, CAST(N'2023-12-02T11:23:19.720' AS DateTime), NULL, N'đào huy', N'ffđ', N'h@gmail.com', N'2345346456', 2222220, N'hfdhhfg', CAST(N'2023-12-04T11:23:19.720' AS DateTime), N'huy', NULL, N'Thanh toán khi nhận hàng')
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (3, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 3, N'huy', N'ok', N'1', 25574772)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (8, CAST(N'2023-11-12T22:59:32.903' AS DateTime), 2, N'huy', N'ok', N'2', 29129918)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (9, CAST(N'2023-11-12T23:00:40.693' AS DateTime), 4, N'huy', N'ok', N'3', 1035317190)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (11, CAST(N'2023-11-12T23:05:15.573' AS DateTime), 5, N'huy', N'ok', N'1', 6600000)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (12, CAST(N'2023-11-12T23:08:02.700' AS DateTime), 3, N'huy', N'ok', NULL, 54887440)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (13, CAST(N'2023-11-12T23:09:06.693' AS DateTime), 3, N'huy', N'ok', N'2', 28857136)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (15, CAST(N'2023-11-12T23:12:57.670' AS DateTime), 1, N'huy', N'ok', N'2', 713688)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (16, CAST(N'2023-11-12T23:51:37.593' AS DateTime), 3, N'huy', N'ok', NULL, 53966)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (18, CAST(N'2023-12-01T18:25:36.333' AS DateTime), 1, N'admin', N'ok', N'1', 100)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (19, CAST(N'2023-12-01T18:28:19.140' AS DateTime), 4, N'admin', N'ok', N'1', 6300000)
GO
INSERT [dbo].[HoaDonNhap] ([MaHD], [NgayNhap], [MaNCC], [TenTaiKhoan], [GhiChu], [methodPay], [Tongtien]) VALUES (1017, CAST(N'2023-12-02T00:16:03.667' AS DateTime), 5, N'admin', N'ok', N'3', 30420000)
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoans] ON 
GO
INSERT [dbo].[LoaiTaiKhoans] ([MaLoaiTaiKhoan], [TenLoai], [mota]) VALUES (1, N'Admin', N'Quản trị viên hệ thống')
GO
INSERT [dbo].[LoaiTaiKhoans] ([MaLoaiTaiKhoan], [TenLoai], [mota]) VALUES (2, N'Khách Hàng', N'Khách hàng ')
GO
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoans] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (1, N'Nhà Cung Cấp 1', N'Địa chỉ NCC 1', N'ncc1@example.com', N'987654321')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (2, N'Nhà Cung Cấp 2', N'Địa chỉ NCC 2', N'ncc2@example.com', N'123456789')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (3, N'Nhà Cung Cấp 3', N'Hà Nội', N'huy@gmail.com', N'02334534')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (4, N'Nhà Cung Cấp 4', N'Hà Nội', N'huy9999@gmail.com', N'09999999999')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (5, N'Nhà Cung Cấp 4', N'Hưng Yên', N'concec@gmail.com', N'012345678')
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (97, 11, N'Đồng Hồ Kawasaki', 17, 10, 1111110, N'/image/watch2.jpg', N'string', 18, N'Còn Hàng', 29)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (98, 10, N'Đồng Hồ Kawasaki', 5, 30, 1111110, N'/image/watch1.png', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (99, 8, N'Đồng Hồ Kawasaki', 18, 0, 1111110, N'/image/watch19.jpg', N'string', 10, N'Còn Hàng', 2)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (100, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch5.jpg', N'string', 11, N'Còn Hàng', 35)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (101, 6, N'Đồng Hồ Kawasaki', 4, 110, 1111110, N'/image/watch19.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (102, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch15.png_638368943755581684', N'string', 12, N'Còn Hàng', 14)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (103, 6, N'Đồng Hồ Kawasaki', 3, 0, 3202343, N'/image/watch17.png_638368944302783039', N'string', 17, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (104, 6, N'Đồng Hồ Kawasaki', 17, 13, 1111110, N'/image/watch17.png', N'string', 19, N'Còn Hàng', 7)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (105, 6, N'Đồng Hồ Kawasaki 1', 17, 0, 1111110, N'/image/watch12.png', N'string', 10, N'Còn Hàng', 5)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (106, 11, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch20.jpg', N'string', 11, N'Còn Hàng', 20)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (107, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch18.png', N'string', 14, N'Còn Hàng', 16)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (108, 6, N'Đồng Hồ Kawasaki', 4, 110, 1111110, N'/image/watch19.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (109, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch17.png', N'string', 23, N'Còn Hàng', 7)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (110, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch11.jpg_638368944467519299', N'string', 13, N'Còn Hàng', 7)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (111, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111116, N'/image/watch11.jpg', N'string', 17, N'Còn Hàng', 17)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (112, 6, N'Đồng Hồ Kawasaki', 17, 0, 1111110, N'/image/watch15.png', N'string', 10, N'Còn Hàng', 19)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (113, 10, N'Đồng Hồ  Đôi Kawasaki', 3, 0, 3500000, N'/image/watch1.webp', N'string', 10, N'Còn Hàng', 3)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (114, 10, N'Đồng Hồ Đôi Kawasaki', 3, 0, 1111110, N'/image/watch3.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (115, 6, N'Đồng Hồ Đôi Kawasaki', 3, 0, 1111110, N'/image/watch4.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (116, 8, N'Đồng Hồ Đôi Kawasaki', 3, 0, 1111110, N'/image/watch18.jpg', N'string', 10, N'Còn Hàng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (117, 6, N'Đồng Hồ Đôi Kawasaki', 3, 0, 1111110, N'/image/watch14.jpg', N'string', 10, N'Còn Hàng', 3)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (118, 6, N'Đồng Hồ Kawasaki', 3, 0, 1111110, N'/image/watch20.webp', N'string', 10, N'Còn Hàng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (119, 6, N'Đồng Hồ Kawasaki', 3, 0, 1111110, N'/image/watch15.jpg', N'string', 10, N'Còn Hàng', 3)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (120, 6, N'Đồng Hồ Kawasaki', 3, 0, 1111110, N'/image/watch19.jpg_638368944751204510', N'string', 10, N'Còn Hàng', 2)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (121, 6, N'Đồng Hồ Nữ Kawasaki', 18, 0, 1111110, N'/image/watch13.jpg', N'string', 10, N'Còn Hàng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (122, 6, N'Đồng Hồ  Nữ Kawasaki', 18, 0, 4300300, N'/image/watch5.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (123, 6, N'Đồng Hồ Nữ Kawasaki', 18, 0, 1111110, N'/image/watch9.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (126, 7, N'Đồng Hồ Nữ Hoho', 4, 0, 3500000, N'/image/watch17.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (127, 7, N'Đồng Hồ Nữ Osaka', 18, 0, 4300000, N'/image/watch16.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (128, 7, N'Đồng Hồ Treo Tường K8272', 18, 0, 8000000, N'/image/watch17.jpg_638368945003125603', N'string', 27, N'Còn Hàng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (129, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (130, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (131, 7, N'Đồng hồ để bàn chính hãng Border B1526', 5, 0, 1290233, N'/image/watch8.jpg_638368947046240643', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (132, 7, N'Đồng Hồ Đôi Chính Hãng Rolex', 3, 0, 1900990, N'/image/watch10.jpg_638370715929049678', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (133, 7, N'Đồng Hồ Đôi Chính Hãng Heala', 3, 0, 1900990, N'/image/watch15.jpg_638370716485409582', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (134, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (135, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (136, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (137, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (138, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (139, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (140, 7, N'Đồng Hồ Chính Hãng Rolex', 18, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (141, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (142, 7, N'Đồng Hồ Chính Nữ Rolex', 18, 0, 1900990, N'/image/watch18.jpg_638370714973012912', N'string', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (143, 7, N'Đồng Hồ Chính Hãng Rolex', 4, 0, 1900990, N'/image/watch19.jpg', N'string', 10, N'string', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (144, 6, N'Đồng Hồ Chính Hãng Rolex', 5, 0, 1202304, N'/image/watch19.jpg', N'f', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (148, 7, N'Đồng Hồ Chính Hãng Rolex', 5, 0, 10923223, N'/image/watch19.jpg', N'464', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (150, 8, N'Đồng Hồ Chính Hãng Rolex Hihi', 3, 0, 3430000, N'/image/watch4.jpg_638370715586340315', N'34434', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (158, 10, N'57', 4, 5675, 575, N'/image/watch19.jpg', N'5675', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (1157, 8, N'Đồng hồ nữ chính hãng KASSAW K910-1', 18, 0, 3100500, N'/image/watch1.jpg', N'ok', 10, N'Còn Hàng', 5)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (1158, 10, N'Đồng hồ nữ chính hãng KASSAW K910-2', 18, 0, 3500000, N'/image/watch2.jpg', N'ok', 10, N'Còn Hàng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (1159, 10, N'Đồng hồ nam Tissot Le Locle', 17, 0, 2000000, N'/image/watch4.jpg', N'ok', 10, N'Còn Hàng', 7)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (1160, 10, N'Đồng Hồ Nam lamboghini', 18, 0, 400000, N'/image/watch18.jpg', N'hi', 10, N'Còn Hàng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (1161, 10, N'Đồng Hồ Nữ OkeKuku', 4, 0, 3203000, N'/image/watch19.jpg', N'Hehe', 10, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (2161, 10, N'Đồng hồ nữ Hobini', 18, 0, 2320000, N'/image/watch13.jpg_638370714164464434', N'ok', 0, N'Còn Hàng', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaTH], [TenMH], [MaLoai], [soLuongton], [GiaBan], [image_SP], [mota], [sldaban], [trangthai], [luotxem]) VALUES (2162, 11, N'đồng hồ mới thêm', 5, 0, 3500000, N'/image/watch1.jpg_638371113350517173', N'ok', 0, N'Còn Hàng', 0)
GO
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[TaiKhoans] ([TenTaiKhoan], [MatKhau], [Email], [MaLoaiTaiKhoan], [HoTen], [DiaChi], [SoDienThoai], [AnhDaiDien], [Token]) VALUES (N'admin', N'123', N'daohuy1692003@gmail.com', 1, N'Đào Quang Huy new', N'Hưng Yên', N'0364174636', N'/image/avatar.jpg', NULL)
GO
INSERT [dbo].[TaiKhoans] ([TenTaiKhoan], [MatKhau], [Email], [MaLoaiTaiKhoan], [HoTen], [DiaChi], [SoDienThoai], [AnhDaiDien], [Token]) VALUES (N'huy', N'123', N'daohuy1692003@gmail.com', 2, N'Đào Quang Huy new', N'Hưng Yên', N'0364174636', N'/image/tokuda.jpg', NULL)
GO
INSERT [dbo].[TaiKhoans] ([TenTaiKhoan], [MatKhau], [Email], [MaLoaiTaiKhoan], [HoTen], [DiaChi], [SoDienThoai], [AnhDaiDien], [Token]) VALUES (N'kien', N'123', N'kien123@gmail.com', 2, N'Nguyễn Trung Kiên', N'Hưng Yên', N'023354254', N'/image/boy.png', NULL)
GO
INSERT [dbo].[TaiKhoans] ([TenTaiKhoan], [MatKhau], [Email], [MaLoaiTaiKhoan], [HoTen], [DiaChi], [SoDienThoai], [AnhDaiDien], [Token]) VALUES (N'quang', N'123', N'quang@gmail.com', 2, N'Lê Văn Quảng', N'Hà Nội', N'09871233', N'/image/okee.jpg', NULL)
GO
INSERT [dbo].[TaiKhoans] ([TenTaiKhoan], [MatKhau], [Email], [MaLoaiTaiKhoan], [HoTen], [DiaChi], [SoDienThoai], [AnhDaiDien], [Token]) VALUES (N'quyen', N'123', N'quyen123@gmail.com', 2, N'Nguyễn Công Quyến', N'Hà Nam', N'01242353', N'/image/images.jpg', NULL)
GO
INSERT [dbo].[TaiKhoans] ([TenTaiKhoan], [MatKhau], [Email], [MaLoaiTaiKhoan], [HoTen], [DiaChi], [SoDienThoai], [AnhDaiDien], [Token]) VALUES (N'thao', N'123', N'thao@gmail.com', 2, N'Đào thanh thảo', N'Hưng yên', N'02353453', N'/image/tải xuống.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [Ghichu]) VALUES (3, N'Đồng hồ Đôi', N'Đồng hồ dành cho các cặp đôi ...')
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [Ghichu]) VALUES (4, N'Phụ Kiện Đồng Hồ', N'Phụ kiện đồng hồ ..................')
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [Ghichu]) VALUES (5, N'Đồng hồ treo tường', N'Đồng hồ khiến căn nhà trở lên sang trọng hơn ...')
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [Ghichu]) VALUES (17, N'Đồng hồ Nam', N'Đồng hồ dành cho nam giới')
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai], [Ghichu]) VALUES (18, N'Đồng Hồ Nữ', N'Đồng Hồ dành cho nữ giới nhé')
GO
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (6, N'Moschino', N'Sản phẩm hay', N'/image/mochino.png')
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (7, N'D&G', N'ok', N'/image/d&g.png')
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (8, N'Cartiero', N'Hot', N'/image/carito.png')
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (10, N'Chloe', N'Thương hiệu hàng đầu việt nam', N'/image/choloe.png')
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (11, N'Moschino', N'Hihi', N'/image/mochino.png')
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (12, N'Rolex', N'hihi', N'/image/rolex.png')
GO
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [MoTa], [HinhAnh]) VALUES (13, N'Dior', N'gjhjh', N'/image/dior.png')
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
ALTER TABLE [dbo].[GioHang] ADD  DEFAULT ((0)) FOR [tongtien]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [sldaban]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [luotxem]
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDonBan] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HoaDonNhap] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([taikhoan])
REFERENCES [dbo].[TaiKhoans] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoans] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoans] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoans]  WITH CHECK ADD FOREIGN KEY([MaLoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoans] ([MaLoaiTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[sp_add_toCart]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_add_toCart]
@maSP int,
@tenSP nvarchar(200),
@anhSP nvarchar(200),
@giaban float,
@taikhoan nvarchar(50)
as
begin
      --tìm kiếm trong giỏ hàng đã tồn tại sản phẩm đó chưa
      declare @record int 
      select @record= count(*) from GioHang where maSP=@maSP and taikhoan=@taikhoan

    if(@record=1 )
        begin
          update GioHang 
          set soluong=soluong+1 ,tongtien=(soluong+1)*giaban          
          where maSP=@maSP

        end
    else
        begin
           insert into GioHang(maSP,tenSP,anhSP,soluong,giaban,tongtien,taikhoan)
           values(@maSP,@tenSP,@anhSP,1,@giaban,@giaban*1,@taikhoan)
        end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_CapNhatTaiKhoan]
    @TenTaiKhoan NVARCHAR(50),
    @Email NVARCHAR(50),
    @HoTen NVARCHAR(50),
    @DiaChi NVARCHAR(250),
    @SoDienThoai NVARCHAR(11),
    @AnhDaiDien NVARCHAR(500)  
AS
BEGIN
    UPDATE TaiKhoans
    SET Email = @Email, HoTen = @HoTen, DiaChi = @DiaChi, SoDienThoai = @SoDienThoai, AnhDaiDien = @AnhDaiDien
    WHERE TenTaiKhoan = @TenTaiKhoan;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateDonHangBan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_CreateDonHangBan]
    @TrangThai int,
    @NgayTao DATETIME,      
    @TenKH NVARCHAR(50),    
    @Diachi NVARCHAR(250),
    @Email NVARCHAR(50),
    @SDT NVARCHAR(50),
    @DiaChiGiaoHang NVARCHAR(350),
    @ThoiGianGiaoHang DATETIME,
	@tentaikhoan nvarchar(50),
	@methodPay nvarchar(100),
	@list_json_chitietHDB NVARCHAR(MAX)
	as
begin
		----Tạo hóa đơn
		insert into HoaDonBan(TrangThai,NgayTao,TenKH,Diachi,Email,SDT,DiaChiGiaoHang,ThoiGianGiaoHang,TenTaiKhoan,methodPay)
		values(@TrangThai,@NgayTao,@TenKH,@Diachi,@Email,@SDT,@DiaChiGiaoHang,@ThoiGianGiaoHang,@tentaikhoan,@methodPay)

		----Lấy mã hóa hơn vừa tạo xong
		declare @MaHoaDon int 
		set @MaHoaDon=SCOPE_IDENTITY();
		declare @Tongtien Float;

		---Thêm chi tiết hóa đơn bán
		if(@list_json_chitietHDB is not null)
		begin
			insert into ChiTietHoaDonBan(MaHD,MaSP,imageSP,tenSP,soLuong,giaBan,tongtien)
			select
			@MaHoaDon,
			JSON_VALUE(l.value,'$.maSP'),
			JSON_VALUE(l.value,'$.imageSP'),
			JSON_VALUE(l.value,'$.tenSP'),
			JSON_VALUE(l.value,'$.soLuong'),
			JSON_VALUE(l.value,'$.giaBan'),
			cast(JSON_VALUE(l.value,'$.soLuong')as int)*CAST(JSON_VALUE(l.value,'$.giaBan')as float)
			from openjson(@list_json_chitietHDB) as l

          
		end
		---Cập nhật giá tiền tất cả của hóa đơn
		---lấy tổng tiền tất cả
		declare @ThanhTien float
		select @ThanhTien=(select SUM(ct.tongTien) from ChiTietHoaDonBan ct where ct.MaHD=@MaHoaDon)
		----Cập nhật
		Update HoaDonBan 
		set HoaDonBan.ThanhTien=@ThanhTien
	    where HoaDonBan.MaHD=@MaHoaDon
        ----Cập nhật lại số lượng đã bán của sản phẩm
           
             update SanPham
             set sldaban=sldaban+c.SoLuong
             from ChiTietHoaDonBan as c            
             where SanPham.MaSP=c.MaSP and c.MaHD=@MaHoaDon
      
        
        
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateHDN]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CreateHDN]
   @MaNCC int,
   @TenTK nvarchar(200),
   @GhiChu  nvarchar(Max),
   @methodPay nvarchar(50),
   @ngaynhap datetime ,
   @list_json_chitietHDN NVARCHAR(MAX)
	as
begin
		----Tạo hóa đơn
		insert into HoaDonNhap(MaNCC,TenTaiKhoan,GhiChu,methodPay,NgayNhap)
		values(@MaNCC,@TenTK,@GhiChu,@methodPay,@ngaynhap)
		----Lấy mã hóa hơn vừa tạo xong
		declare @MaHoaDon int 
		set @MaHoaDon=SCOPE_IDENTITY();
		declare @Tongtien Float;

		---Thêm chi tiết hóa đơn nhập
		if(@list_json_chitietHDN is not null)
		begin
			insert into ChiTietHoaDonNhap(MaHDN,MaSP,SoLuong,GiaNhap,TongTien)
			select
			@MaHoaDon,
			JSON_VALUE(l.value,'$.maSP'),			
			JSON_VALUE(l.value,'$.soLuong'),
			JSON_VALUE(l.value,'$.giaNhap'),
			cast(JSON_VALUE(l.value,'$.soLuong')as int)*CAST(JSON_VALUE(l.value,'$.giaNhap')as float)
			from openjson(@list_json_chitietHDN) as l
            ----Cập nhật lại số lượng sản phẩm
            update SanPham
            set soLuongton = soLuongton + cast(JSON_VALUE(l.value, '$.soLuong') as int) from openjson(@list_json_chitietHDN) as l
            where MaSP = JSON_VALUE(l.value, '$.maSP')

		end
		---Cập nhật giá tiền tất cả của hóa đơn
		---lấy tổng tiền tất cả
		declare @ThanhTien float
		select @ThanhTien=(select SUM(ct.TongTien) from ChiTietHoaDonNhap ct where ct.MaHDN=@MaHoaDon)
		----Cập nhật
		Update HoaDonNhap 
		set HoaDonNhap.Tongtien=@ThanhTien
	    where HoaDonNhap.MaHD=@MaHoaDon
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DangNhap]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DangNhap]
    @TenTaiKhoan NVARCHAR(50),
    @MatKhau NVARCHAR(50),
    @MaLoaiTK int
AS
BEGIN
    SELECT * FROM TaiKhoans
    WHERE TenTaiKhoan = @TenTaiKhoan AND MatKhau = @MatKhau AND MaLoaiTaiKhoan=@MaLoaiTK;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsachKH_muanhieu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[sp_danhsachKH_muanhieu]
    as
    begin
    select t.TenTaiKhoan,t.AnhDaiDien,t.HoTen,t.SoDienThoai,t.DiaChi,SUM(h.ThanhTien) as tongtien,COUNT(h.MaHD) as sldh 
    from HoaDonBan as h  
    join TaiKhoans as t on t.TenTaiKhoan=h.TenTaiKhoan
    where t.MaLoaiTaiKhoan=2
    group by t.TenTaiKhoan,t.AnhDaiDien,t.HoTen,t.SoDienThoai,t.DiaChi   
    having SUM(h.ThanhTien)>3000000
    order by sldh DESC    
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_DonHangBan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Delete_DonHangBan]
@MaHD int
as
begin
delete HoaDonBan 
where HoaDonBan.MaHD=@MaHD
end
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteCart]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE proc [dbo].[sp_deleteCart]
    @maGH int
    as 
    begin
    delete from GioHang where maGH=@maGH
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteHDN]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[sp_DeleteHDN] 
  @maHDN int
  as
  begin
  delete HoaDonNhap where MaHD=@maHDN
  end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteKH]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteKH]
 @MaKH int
 as
 begin 
 delete KhachHang where @MaKH=MaKH
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteNCC]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_DeleteNCC]
 @MaNCC int
 as
 begin 
 delete NhaCungCap where @MaNCC=MaNCC
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_doanhthu_time]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[sp_doanhthu_time]
    @date_start date,
    @date_end date
    as
    begin       
        select h.MaHD,h.NgayTao,h.TenKH,h.Diachi,h.ThanhTien
        from HoaDonBan as h
        where h.NgayTao between convert(date,@date_start) and convert(date,@date_end) or
        @date_end='' and @date_start=''        
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoiMatKhau]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DoiMatKhau]
    @TenTaiKhoan NVARCHAR(50),
    @MatKhauMoi NVARCHAR(50)
AS
BEGIN
    UPDATE TaiKhoans
    SET MatKhau = @MatKhauMoi
    WHERE TenTaiKhoan = @TenTaiKhoan;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_donhangCXN]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_donhangCXN]
    as
    begin
    select * from HoaDonBan where TrangThai=0
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAll_LoaiTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAll_LoaiTaiKhoan]
    
AS
BEGIN
    SELECT * FROM LoaiTaiKhoans
   
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getALL_NCC]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_getALL_NCC]
 as
 begin 
 select * From NhaCungCap 
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetALl_TheLoai]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_GetALl_TheLoai]
   as
   begin
   select *From TheLoai
   end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_ThuongHieu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_ThuongHieu]
as
begin
select * From ThuongHieu
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllCart_byTenTK]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAllCart_byTenTK]
    @tentaikhoan nvarchar(50)
    as
    begin
    select * from GioHang where taikhoan=@tentaikhoan
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_getDetail_HDN]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_getDetail_HDN]
  @maHDN int
  as
  begin
  select * ,(select * from ChiTietHoaDonNhap as n where n.MaHDN=@maHDN for json auto ) as listchitiethdn from HoaDonNhap where MaHD=@maHDN
  end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDetailDH]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDetailDH]
    @MaHD int
AS
BEGIN
    -- Lấy thông tin đơn hàng bán
    SELECT
        dh.MaHD,
        dh.TrangThai,
        dh.NgayTao,
        dh.TenKH,
        dh.Diachi,
        dh.Email,
        dh.SDT,
		dh.ThanhTien,
        dh.DiaChiGiaoHang,
        dh.ThoiGianGiaoHang,
        dh.TenTaiKhoan,
		dh.methodPay,
        (
            SELECT
			    ct.MaChiTietHD,
				ct.MaHD,
                ct.MaSP,
				ct.tenSP,
				ct.imageSP,
                ct.SoLuong,
                ct.GiaBan,
                ct.tongtien
            FROM ChiTietHoaDonBan ct
            WHERE ct.MaHD = @MaHD
            FOR JSON AUTO
        ) AS ChiTietHoaDonBanJson
    FROM HoaDonBan dh
    WHERE dh.MaHD = @MaHD;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDonHangBanAndChiTiet]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDonHangBanAndChiTiet]
    @MaHD int
AS
BEGIN
    -- Lấy thông tin đơn hàng bán
    SELECT
        dh.MaHD,
        dh.TrangThai,
        dh.NgayTao,
        dh.TenKH,
        dh.Diachi,
        dh.Email,
        dh.SDT,
        dh.DiaChiGiaoHang,
        dh.ThoiGianGiaoHang,
        dh.TenTaiKhoan
    FROM HoaDonBan dh
    WHERE dh.MaHD = @MaHD;

    -- Lấy thông tin chi tiết hóa đơn bán
    SELECT
        ct.MaSP,
        ct.SoLuong,
        ct.GiaBan,
        ct.tongtien
    FROM ChiTietHoaDonBan ct
    WHERE ct.MaHD = @MaHD;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHoaDonban]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetHoaDonban]
    @page_index INT,
    @page_size INT,
    @trangthai int,
    @searchTime_begin DATE,
    @searchTime_end DATE,
    @tentaikhoan VARCHAR(250)
AS
BEGIN
    DECLARE @RecordCount INT;
    IF (@searchTime_begin != '' AND @searchTime_end = '')
    BEGIN
        SELECT @searchTime_end = DATEADD(DAY, 1, GETDATE()); -- Add 1 day to the current date
    END
    SET NOCOUNT ON;
    IF @page_size = 0
    BEGIN
        SELECT
            ROW_NUMBER() OVER (ORDER BY MaHD ASC) AS RowNumber, *
        FROM HoaDonBan AS h
        WHERE
            h.TrangThai=@trangthai
			 AND (@tentaikhoan = '' OR h.TenTaiKhoan = @tentaikhoan)
            AND (
                (h.NgayTao BETWEEN CONVERT(DATE, @searchTime_begin) AND CONVERT(DATE, @searchTime_end))
                OR (@searchTime_begin = '' AND @searchTime_end = '')
            )
    END
    ELSE
    BEGIN
        SELECT ROW_NUMBER() OVER (ORDER BY MaHD ASC) AS RowNumber, *
        INTO #Results
        FROM HoaDonBan AS h
        WHERE
            h.TrangThai=@trangthai
			 AND (@tentaikhoan = '' OR h.TenTaiKhoan = @tentaikhoan)
            AND (
                (h.NgayTao BETWEEN CONVERT(DATE, @searchTime_begin) AND CONVERT(DATE, @searchTime_end))
                OR (@searchTime_begin = '' AND @searchTime_end = '')
            )

        SELECT @RecordCount = COUNT(*)
        FROM #Results;
        
        SELECT *, @RecordCount AS RecordCount
        FROM #Results
        WHERE
            RowNumber BETWEEN (@page_index - 1) * @page_size + 1
            AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;

        DROP TABLE #Results;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHoaDonNhap]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create PROCEDURE [dbo].[sp_GetHoaDonNhap]
    @page_index INT,
    @page_size INT,   
    @searchTime_begin DATE,
    @searchTime_end DATE,
    @tentaikhoan VARCHAR(250)
AS
BEGIN
    DECLARE @RecordCount INT;
    IF (@searchTime_begin != '' AND @searchTime_end = '')
    BEGIN
        SELECT @searchTime_end = DATEADD(DAY, 1, GETDATE()); -- Add 1 day to the current date
    END
    SET NOCOUNT ON;
    IF @page_size = 0
    BEGIN
        SELECT
            ROW_NUMBER() OVER (ORDER BY MaHD ASC) AS RowNumber, *
        FROM HoaDonNhap AS h
        WHERE          
			 (@tentaikhoan = '' OR h.TenTaiKhoan = @tentaikhoan)
            AND (
                (h.NgayNhap BETWEEN CONVERT(DATE, @searchTime_begin) AND CONVERT(DATE, @searchTime_end))
                OR (@searchTime_begin = '' AND @searchTime_end = '')
            )
    END
    ELSE
    BEGIN
        SELECT ROW_NUMBER() OVER (ORDER BY MaHD ASC) AS RowNumber, *
        INTO #Results
        FROM HoaDonNhap AS h
        WHERE          
			  (@tentaikhoan = '' OR h.TenTaiKhoan = @tentaikhoan)
            AND (
                (h.NgayNhap BETWEEN CONVERT(DATE, @searchTime_begin) AND CONVERT(DATE, @searchTime_end))
                OR (@searchTime_begin = '' AND @searchTime_end = '')
            )

        SELECT @RecordCount = COUNT(*)
        FROM #Results;
        
        SELECT *, @RecordCount AS RecordCount
        FROM #Results
        WHERE
            RowNumber BETWEEN (@page_index - 1) * @page_size + 1
            AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;

        DROP TABLE #Results;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfo_User]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetInfo_User]
@TenTaiKhoan nvarchar(50)
as 
begin
select* From TaiKhoans as k where k.TenTaiKhoan=@TenTaiKhoan
end
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_create]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_nhacungcap_create] 
 @email nvarchar(100),
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15)
 as
 begin
		INSERT INTO NhaCungCap(Email,TenNCC,DiaChi,SoDienThoai) values (@email,@TenNCC,@DiaChi,@SoDienThoai)
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_nhacungcap_update]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_nhacungcap_update]
 @MaNCC int,
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15),
 @email nvarchar(100)
 as
 begin
	update NhaCungCap Set TenNCC=@TenNCC,DiaChi=@DiaChi,SoDienThoai=@SoDienthoai,Email=@email where MaNCC=@MaNCC
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_banchay]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    create proc [dbo].[sp_sanpham_banchay]
    as
    begin
    select s.MaSP,s.TenMH,s.image_SP,s.sldaban,SUM(c.TongTien) as doanhthu
    from SanPham as s
    join ChiTietHoaDonBan as c on s.MaSP=c.MaSP
    group by s.MaSP,s.TenMH,s.image_SP,s.luotxem,s.sldaban
    order by s.sldaban DESC
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_search_sanpham]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_search_sanpham]
    @page_index INT,
    @page_size INT,
    @ten_sanpham NVARCHAR(250) ,
    @gia_tien VARCHAR(50) ,
    @ma_theloai int ,
    @ma_thuonghieu int
AS
BEGIN
    SET NOCOUNT ON;
    ----lấy giá cần tìm kiếm
    IF @gia_tien!=''
    begin
    DECLARE @vi_tri INT = CHARINDEX('-', @gia_tien)
-- Tách thành hai biến dựa trên vị trí của '-'
    DECLARE @giatien_1 float = SUBSTRING(@gia_tien, 1, @vi_tri - 1)
    DECLARE @giatien_2 float = SUBSTRING(@gia_tien, @vi_tri + 1, LEN(@gia_tien))
    end

    IF @page_size = 0
    BEGIN
        SELECT
            ROW_NUMBER() OVER (ORDER BY MaSP ASC) AS RowNumber, 
          sp.*
        FROM SanPham AS sp
		join TheLoai as tl on sp.MaLoai=tl.MaLoai
		join ThuongHieu as th on th.MaTH=sp.MaTH
        WHERE
             (@ten_sanpham ='' OR sp.TenMH LIKE '%' + @ten_sanpham + '%')
            AND (@gia_tien ='' OR sp.GiaBan between @giatien_1 and @giatien_2)
            AND (@ma_theloai ='' OR tl.MaLoai = @ma_theloai)
            AND (@ma_thuonghieu='' OR th.MaTH = @ma_thuonghieu);
    END
    ELSE
    BEGIN
        DECLARE @RecordCount INT;
        
        SELECT
            ROW_NUMBER() OVER (ORDER BY MaSP ASC) AS RowNumber, 
            sp.*
        INTO #Results
        FROM SanPham AS sp
		join TheLoai as tl on sp.MaLoai=tl.MaLoai
		join ThuongHieu as th on th.MaTH=sp.MaTH
        WHERE
             (@ten_sanpham ='' OR sp.TenMH LIKE '%' + @ten_sanpham + '%')
             AND (@gia_tien ='' OR sp.GiaBan between @giatien_1 and @giatien_2)
            AND (@ma_theloai ='' OR tl.MaLoai = @ma_theloai)
            AND (@ma_thuonghieu='' OR th.MaTH = @ma_thuonghieu);

        SELECT @RecordCount = COUNT(*)
        FROM #Results;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results
        WHERE
            RowNumber BETWEEN (@page_index - 1) * @page_size + 1
            AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;
        
        DROP TABLE #Results;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_searchNCC_by_MaNCC]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[sp_searchNCC_by_MaNCC]
 @MaNCC int
 as
 begin 
 select * From NhaCungCap as ncc where ncc.MaNCC=@MaNCC
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_showdoanhthu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_showdoanhthu]
   as
   begin
   ---Tạo bảng ảo chứa tháng
        CREATE TABLE #temp (thang INT);
        INSERT INTO #temp (thang)
        VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

        -- Thực hiện LEFT JOIN để kết hợp thông tin từ bảng HoaDonBan và bảng tạm thời
        SELECT 
            m.thang,
            ISNULL(SUM(h.ThanhTien),0) AS DoanhThu
        FROM 
            #temp m
        left JOIN   HoaDonBan h ON MONTH(h.NgayTao) = m.thang      
        GROUP BY m.thang;

        -- Xóa bảng tạm thời sau khi sử dụng
        DROP TABLE #temp;
   end
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaLoaiTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuaLoaiTaiKhoan]
    @MaLoaiTaiKhoan INT,
    @TenLoai NVARCHAR(50),
    @MoTa NVARCHAR(250)
AS
BEGIN
    UPDATE LoaiTaiKhoans
    SET TenLoai = @TenLoai, MoTa = @MoTa
    WHERE MaLoaiTaiKhoan = @MaLoaiTaiKhoan;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaSLDaBanSanPham]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuaSLDaBanSanPham]
    @MaSP INT,
    @SoLuongDaBan INT
AS
BEGIN
    UPDATE SanPham
    SET sldaban = @SoLuongDaBan
    WHERE MaSP = @MaSP;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaTheLoai]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuaTheLoai]
    @MaLoai INT,
    @TenLoai NVARCHAR(50),
    @GhiChu NVARCHAR(250)
AS
BEGIN
    UPDATE TheLoai
    SET TenLoai = @TenLoai, Ghichu = @GhiChu
    WHERE MaLoai = @MaLoai;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaThongTinSanPham]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_SuaThongTinSanPham]
    @MaSP INT,
    @MaTH INT,
    @TenMH NVARCHAR(50),
    @MaLoai INT,
    @SoLuongTon INT,
	@GiaBan Float,
    @Image_SP NVARCHAR(MAX),
    @MoTa NVARCHAR(MAX),
    @TrangThai NVARCHAR(255)
AS
BEGIN
    UPDATE SanPham
    SET MaTH = @MaTH, TenMH = @TenMH, MaLoai = @MaLoai, soLuongton = @SoLuongTon,GiaBan=@GiaBan,
        image_SP = @Image_SP, mota = @MoTa, trangthai = @TrangThai
    WHERE MaSP = @MaSP;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaThuongHieu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuaThuongHieu]
    @MaTH INT,
    @TenThuongHieu NVARCHAR(255),
    @MoTa NVARCHAR(MAX),
    @HinhAnh NVARCHAR(500)
AS
BEGIN
    UPDATE ThuongHieu
    SET TenThuongHieu = @TenThuongHieu, MoTa = @MoTa, HinhAnh = @HinhAnh
    WHERE MaTH = @MaTH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLoaiTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemLoaiTaiKhoan]
    @TenLoai NVARCHAR(50),
    @MoTa NVARCHAR(250)
AS
BEGIN
    INSERT INTO LoaiTaiKhoans (TenLoai, MoTa)
    VALUES (@TenLoai, @MoTa);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSanPham]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ThemSanPham]
    @MaTH INT,
    @TenMH NVARCHAR(50),
    @MaLoai INT,
    @SoLuongTon INT,
	@GiaBan FLoat,
    @Image_SP NVARCHAR(MAX),
    @MoTa NVARCHAR(MAX),
    @TrangThai NVARCHAR(255)
AS
BEGIN
    INSERT INTO SanPham (MaTH, TenMH, MaLoai, soLuongton,GiaBan, image_SP, mota, trangthai)
    VALUES (@MaTH, @TenMH, @MaLoai, @SoLuongTon,@GiaBan ,@Image_SP, @MoTa, @TrangThai);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemTaiKhoan]
    @TenTaiKhoan NVARCHAR(50),
    @MatKhau NVARCHAR(50) ,
	@LoaiTaiKhoan INT
AS
BEGIN
    INSERT INTO TaiKhoans (TenTaiKhoan, MatKhau,MaLoaiTaiKhoan,HoTen,DiaChi,SoDienThoai,AnhDaiDien,Email)
    VALUES (@TenTaiKhoan, @MatKhau,@LoaiTaiKhoan,N'Trống',N'Trống',N'Trống',N'Trống',N'Trống');
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTheLoai]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemTheLoai]
    @TenLoai NVARCHAR(50),
    @GhiChu NVARCHAR(250)
AS
BEGIN
    INSERT INTO TheLoai (TenLoai,Ghichu)
    VALUES (@TenLoai, @GhiChu);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemThuongHieu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemThuongHieu]
    @TenThuongHieu NVARCHAR(255),
    @MoTa NVARCHAR(MAX),
    @HinhAnh NVARCHAR(500)
AS
BEGIN
    INSERT INTO ThuongHieu (TenThuongHieu, MoTa, HinhAnh)
    VALUES (@TenThuongHieu, @MoTa, @HinhAnh);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemSanPhamTheoTen]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemSanPhamTheoTen]
    @TenMH NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM SanPham
    WHERE TenMH LIKE N'%' + @TenMH + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemTheLoai]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemTheLoai]
    @TenLoai NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM TheLoai
    WHERE TenLoai LIKE N'%' + @TenLoai + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemThuongHieu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemThuongHieu]
    @TenThuongHieu NVARCHAR(255)
AS
BEGIN
    SELECT *
    FROM ThuongHieu
    WHERE TenThuongHieu LIKE N'%' + @TenThuongHieu + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_updateHDB]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_updateHDB]  
    @maHD int,
    @TenKH NVARCHAR(50),    
    @Diachi NVARCHAR(250),
    @Email NVARCHAR(50),
    @SDT NVARCHAR(50),
    @DiaChiGiaoHang NVARCHAR(350),   
	@methodPay NVARCHAR(100),
	@list_json_chitietHDB NVARCHAR(MAX)
	as
begin
        ------Cập nhật thông tin hóa đơn bán
        update HoaDonBan 
		set TenKH=@TenKH,Diachi=@Diachi,Email=@Email,SDT=@SDT,DiaChiGiaoHang=@DiaChiGiaoHang,methodPay=@methodPay
		where HoaDonBan.MaHD=@maHD
		---Thêm chi tiết hóa đơn nhập nếu trong bảng chi tiết chưa có
		IF (@list_json_chitietHDB IS NOT NULL)
			BEGIN
				-- Bước 1: Trích xuất dữ liệu từ JSON và lưu vào bảng tạm #UpdatedDetails
				CREATE TABLE #UpdatedDetails (
					maSP INT,
					imageSP NVARCHAR(MAX),
					tenSP NVARCHAR(100),
					soLuong INT,
					giaBan FLOAT,
					tongTien FLOAT
				)

				INSERT INTO #UpdatedDetails (maSP, imageSP, tenSP, soLuong, giaBan, tongTien)
				SELECT
					JSON_VALUE(l.value, '$.maSP'),
					JSON_VALUE(l.value, '$.imageSP'),
					JSON_VALUE(l.value, '$.tenSP'),
					CAST(JSON_VALUE(l.value, '$.soLuong') AS INT),
					CAST(JSON_VALUE(l.value, '$.giaBan') AS FLOAT),
					CAST(JSON_VALUE(l.value, '$.soLuong') AS INT) * CAST(JSON_VALUE(l.value, '$.giaBan') AS FLOAT)
				FROM OPENJSON(@list_json_chitietHDB) AS l

				-- Bước 2: Thêm chi tiết mới hoặc cập nhật chi tiết đã tồn tại
				-- Cập nhật chi tiết hóa đơn bán
				UPDATE ct
				SET ct.imageSP = u.imageSP,
					ct.tenSP = u.tenSP,
					ct.soLuong = u.soLuong,
					ct.giaBan = u.giaBan,
					ct.tongTien = u.tongTien
				FROM ChiTietHoaDonBan ct
				INNER JOIN #UpdatedDetails u ON ct.maSP = u.maSP
				WHERE ct.MaHD = @maHD

				-- Thêm chi tiết hóa đơn bán mới
				INSERT INTO ChiTietHoaDonBan (MaHD, maSP, imageSP, tenSP, soLuong, giaBan, tongTien)
				SELECT @maHD, maSP, imageSP, tenSP, soLuong, giaBan, tongTien
				FROM #UpdatedDetails
				WHERE maSP NOT IN (SELECT maSP FROM ChiTietHoaDonBan WHERE MaHD = @maHD)

				-- Bước 3: Xóa các chi tiết không có trong danh sách cập nhật
				DELETE FROM ChiTietHoaDonBan
				WHERE MaHD = @maHD AND maSP NOT IN (SELECT maSP FROM #UpdatedDetails)

				-- Bước 4: Xóa bảng tạm
				DROP TABLE #UpdatedDetails
			END
		---Cập nhật giá tiền tất cả của hóa đơn
		---lấy tổng tiền tất cả
		declare @ThanhTien float
		select @ThanhTien=(select SUM(ct.tongTien) from ChiTietHoaDonBan ct where ct.MaHD=@maHD)
		----Cập nhật
		Update HoaDonBan 
		set HoaDonBan.ThanhTien=@ThanhTien
	    where HoaDonBan.MaHD=@maHD
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateHDN]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_updateHDN]
    @maHDN int,
    @MaNCC int, 
    @GhiChu  nvarchar(Max),
    @methodPay nvarchar(50), 
	@list_json_chitietHDN NVARCHAR(MAX)
	as
begin
        ------Cập nhật thông tin hóa đơn bán
        update HoaDonNhap
		set MaNCC=@MaNCC,GhiChu=@GhiChu,methodPay=@methodPay
		where HoaDonNhap.MaHD=@maHDN

        ----Xóa số lượng tồn sản phẩm của các chitiethd cũ      
            update sp set sp.soLuongton=sp.soLuongton- c.soLuong 
            from ChiTietHoaDonNhap as c 
            join SanPham as sp on sp.MaSP=c.MaSP
            where c.MaHDN=@maHDN
		---Thêm chi tiết hóa đơn nhập nếu trong bảng chi tiết chưa có
		IF (@list_json_chitietHDN IS NOT NULL)
			BEGIN

			
				-- Bước 1: Trích xuất dữ liệu từ JSON và lưu vào bảng tạm #UpdatedDetails
				CREATE TABLE #UpdatedDetails (
					maSP INT,					
					soLuong INT,
					giaNhap FLOAT,
					tongTien FLOAT
				)

				INSERT INTO #UpdatedDetails (maSP, soLuong, giaNhap, tongTien)
				SELECT
					JSON_VALUE(l.value, '$.maSP'),					
					CAST(JSON_VALUE(l.value, '$.soLuong') AS INT),
					CAST(JSON_VALUE(l.value, '$.giaNhap') AS FLOAT),
					CAST(JSON_VALUE(l.value, '$.soLuong') AS INT) * CAST(JSON_VALUE(l.value, '$.giaNhap') AS FLOAT)
				FROM OPENJSON(@list_json_chitietHDN) AS l

				-- Bước 2: Thêm chi tiết mới hoặc cập nhật chi tiết đã tồn tại
				-- Cập nhật chi tiết hóa đơn nhập cũ
				UPDATE ct
				SET
					ct.SoLuong = u.soLuong,
					ct.GiaNhap = u.giaNhap,
					ct.tongTien = u.tongTien
				FROM ChiTietHoaDonNhap ct
				INNER JOIN #UpdatedDetails u ON ct.MaSP = u.maSP
				WHERE ct.MaHDN = @maHDN

				-- Thêm chi tiết hóa đơn nhập mới 
				insert into ChiTietHoaDonNhap(MaHDN,MaSP,SoLuong,GiaNhap,TongTien)
				select @MaHDN,s.maSP,s.soLuong,s.giaNhap,s.tongTien
				FROM #UpdatedDetails as s
				WHERE s.maSP NOT IN (SELECT MaSP FROM ChiTietHoaDonNhap WHERE MaHDN = @maHDN)
                ---Cập nhật số lượng của các sp mới nhập mà chưa tồn tại trong hóa đơn cũ             
                
				-- Bước 3: Xóa các chi tiết không có trong danh sách cập nhật
				DELETE FROM ChiTietHoaDonNhap
				WHERE MaHDN = @maHDN AND MaSP NOT IN (SELECT maSP FROM #UpdatedDetails)

                ----Cập nhật lại số lượng tồn của các sản phẩm sau khi sửa hóa đơn

                  update sp set sp.soLuongton=sp.soLuongton+ c.soLuong 
                  from ChiTietHoaDonNhap as c 
                  join SanPham as sp on sp.MaSP=c.MaSP
                  where c.MaHDN=@maHDN
				-- Bước 4: Xóa bảng tạm
				DROP TABLE #UpdatedDetails
			END
		
		---Cập nhật giá tiền tất cả của hóa đơn
		---lấy tổng tiền tất cả
		declare @ThanhTien float
		select @ThanhTien=(select SUM(ct.TongTien) from ChiTietHoaDonNhap ct where ct.MaHDN=@maHDN)
		----Cập nhật
		Update HoaDonNhap 
		set HoaDonNhap.Tongtien=@ThanhTien
	    where HoaDonNhap.MaHD=@maHDN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLuotXem]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateLuotXem]
@maSP int
as
begin
update SanPham 
set luotxem=luotxem+1
where MaSP=@maSP
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateSL_Cart]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_updateSL_Cart]
    @maGH int,
    @soluong int
    as 
    begin
    update GioHang
    set soluong=@soluong, tongtien=@soluong*giaban
    where maGH=@maGH
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateStatus_HDB]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_updateStatus_HDB]
@MaHD int,
@trangthai int
as
begin
if @trangthai=1
	begin
	update HoaDonBan 
	set HoaDonBan.TrangThai=1,HoaDonBan.NgayDuyet=GetDate()
	where MaHD=@MaHD
	end
if @trangthai=2
	begin
	update HoaDonBan 
	set HoaDonBan.TrangThai=2,HoaDonBan.NgayHuy=GetDate()
	where MaHD=@MaHD

    --update lại số lượng bán ra của sản phẩm
    update SanPham
    set sldaban=sldaban-c.SoLuong
    from ChiTietHoaDonBan as c
    join SanPham  as sp on sp.MaSP=c.MaSP 
    where c.MaHD=@MaHD
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XacNhan_HDB]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XacNhan_HDB]
@MaHD int
as
begin
update HoaDonBan 
set HoaDonBan.TrangThai=1,HoaDonBan.NgayDuyet=GetDate()
where MaHD=@MaHD
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaLoaiTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaLoaiTaiKhoan]
    @MaLoaiTaiKhoan INT
AS
BEGIN
    DELETE FROM LoaiTaiKhoans
    WHERE MaLoaiTaiKhoan = @MaLoaiTaiKhoan;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaSanPham]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaSanPham]
    @MaSP INT
AS
BEGIN
    DELETE FROM SanPham
    WHERE MaSP = @MaSP;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaTaiKhoan]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaTaiKhoan]
    @TenTaiKhoan NVARCHAR(50)
AS
BEGIN
    DELETE FROM TaiKhoans
    WHERE TenTaiKhoan = @TenTaiKhoan;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaTheLoai]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaTheLoai]
    @MaLoai INT
AS
BEGIN
    DELETE FROM TheLoai
    WHERE MaLoai = @MaLoai;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaThuongHieu]    Script Date: 02-12-2023 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaThuongHieu]
    @MaTH INT
AS
BEGIN
    DELETE FROM ThuongHieu
    WHERE MaTH = @MaTH;
END;
GO
USE [master]
GO
ALTER DATABASE [BanDongHo] SET  READ_WRITE 
GO
