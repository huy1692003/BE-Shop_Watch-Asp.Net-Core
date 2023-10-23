---Thủ tục Tài Khoản
-- Tạo stored procedure cho thêm loại tài khoản
CREATE PROCEDURE sp_ThemLoaiTaiKhoan
    @TenLoai NVARCHAR(50),
    @MoTa NVARCHAR(250)
AS
BEGIN
    INSERT INTO LoaiTaiKhoans (TenLoai, MoTa)
    VALUES (@TenLoai, @MoTa);
END;

-- Tạo stored procedure cho sửa loại tài khoản
CREATE PROCEDURE sp_SuaLoaiTaiKhoan
    @MaLoaiTaiKhoan INT,
    @TenLoai NVARCHAR(50),
    @MoTa NVARCHAR(250)
AS
BEGIN
    UPDATE LoaiTaiKhoans
    SET TenLoai = @TenLoai, MoTa = @MoTa
    WHERE MaLoaiTaiKhoan = @MaLoaiTaiKhoan;
END;

-- Tạo stored procedure cho xóa loại tài khoản
CREATE PROCEDURE sp_XoaLoaiTaiKhoan
    @MaLoaiTaiKhoan INT
AS
BEGIN
    DELETE FROM LoaiTaiKhoans
    WHERE MaLoaiTaiKhoan = @MaLoaiTaiKhoan;
END;

-- Tạo stored procedure cho tìm kiếm loại tài khoản
CREATE PROCEDURE sp_TimKiemLoaiTaiKhoan
    @TenLoai NVARCHAR(50)
AS
BEGIN
    SELECT * FROM LoaiTaiKhoans
    WHERE TenLoai LIKE N'%' + @TenLoai + '%';
END;
--------------------------lấy tất cả loại tài khoản
CREATE PROCEDURE sp_GetAll_LoaiTaiKhoan
    
AS
BEGIN
    SELECT * FROM LoaiTaiKhoans
   
END;

 ------Thủ tục Tài Khoản 
-- Tạo stored procedure cho thêm tài khoản
alter PROCEDURE sp_ThemTaiKhoan
    @TenTaiKhoan NVARCHAR(50),
    @MatKhau NVARCHAR(50) ,
	@LoaiTaiKhoan INT
AS
BEGIN
    INSERT INTO TaiKhoans (TenTaiKhoan, MatKhau,MaLoaiTaiKhoan)
    VALUES (@TenTaiKhoan, @MatKhau,@LoaiTaiKhoan);
END;

-- Tạo stored procedure cho xóa tài khoản
CREATE PROCEDURE sp_XoaTaiKhoan
    @TenTaiKhoan NVARCHAR(50)
AS
BEGIN
    DELETE FROM TaiKhoans
    WHERE TenTaiKhoan = @TenTaiKhoan;
END;

-- Tạo stored procedure cho đổi mật khẩu
CREATE PROCEDURE sp_DoiMatKhau
    @TenTaiKhoan NVARCHAR(50),
    @MatKhauMoi NVARCHAR(50)
AS
BEGIN
    UPDATE TaiKhoans
    SET MatKhau = @MatKhauMoi
    WHERE TenTaiKhoan = @TenTaiKhoan;
END;

-- Tạo stored procedure cho cập nhật tài khoản
alter PROCEDURE sp_CapNhatTaiKhoan
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

-- Tạo stored procedure cho đăng nhập
CREATE PROCEDURE sp_DangNhap
    @TenTaiKhoan NVARCHAR(50),
    @MatKhau NVARCHAR(50)
AS
BEGIN
    SELECT * FROM TaiKhoans
    WHERE TenTaiKhoan = @TenTaiKhoan AND MatKhau = @MatKhau;
END;
----Tạo procude Get infor user
create procedure sp_GetInfo_User
@TenTaiKhoan nvarchar(50)
as 
begin
select k.HoTen,k.DiaChi,k.SoDienThoai,k.Email From TaiKhoans as k where k.TenTaiKhoan=@TenTaiKhoan
end
  
 -------BẢNG NHÀ CUNG CẤP-----------------------
   ----1.Tìm kiếm nhà cung cấp theo mã Nhà cung cấp
    create proc sp_searchNCC_by_MaNCC
 @MaNCC int
 as
 begin 
 select * From NhaCungCap as ncc where ncc.MaNCC=@MaNCC
 end

   ----2.Tạo mới nhà cung cấp
 create proc sp_nhacungcap_create 
 @MaNCC int,
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15)
 as
 begin
		INSERT INTO NhaCungCap(MaNCC,TenNCC,DiaChi,SoDienThoai) values (@MaNCC,@TenNCC,@DiaChi,@SoDienThoai)
 end

 ----Cập nhật thông tin Nhà cung cấp
create proc sp_nhacungcap_update
 @MaNCC int,
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15)
 as
 begin
	update NhaCungCap Set TenNCC=@TenNCC,DiaChi=@DiaChi,SoDienThoai=@SoDienthoai where MaNCC=@MaNCC
 end


 ----Xóa ncc theo mã 
 create proc sp_DeleteNCC
 @MaNCC int
 as
 begin 
 delete NhaCungCap where @MaNCC=MaNCC
 end
 exec sp_DeleteNV 'NV30'

 -----Tạo khách hàng
alter proc sp_khachhang_create ( 
 @TenKH nvarchar(50),
 @DiaChi nvarchar(100),
 @Dienthoai nvarchar(15),
 @ngaysinh date)
 as
 begin
	insert into KhachHang(TenKhachHang,DiaChi,DienThoai,ngaysinh) values (@TenKH,@DiaChi,@Dienthoai,@ngaysinh)
 end
  exec sp_nhanvien_create 'NV30',N'NVTest' ,N'Hưng Yên','038746373','2003-09-14'
 -----Tìm kiếm khachhang by Mã KH
 alter proc sp_searchKH_by_MaKH
 @MaKH int
 as
 begin 
 select * From KhachHang as kh where kh.MaKH=@MaKH
 end
 ----Cập nhật thông tin khách hàng
alter proc sp_khachhang_update
 @MaKH int,
 @TenKH nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @Dienthoai nvarchar(15),
 @ngaysinh date 
 as
 begin
	update KhachHang Set TenKhachHang=@TenKH,DiaChi=@DiaChi,DienThoai=@Dienthoai,ngaysinh=@ngaysinh where MaKH=@MaKH
 end
 exec sp_nhanvien_update 'NV01',N'NVTest' ,N'Hưng Yên','038746373','2003-09-14'
 ----Xóa khách hàng theo mã 
 alter proc sp_DeleteKH
 @MaKH int
 as
 begin 
 delete KhachHang where @MaKH=MaKH
 end


----------------Thủ tục Thể Loại
-- Tạo stored procedure cho thêm thể loại
CREATE PROCEDURE sp_ThemTheLoai
    @TenLoai NVARCHAR(50),
    @GhiChu NVARCHAR(250)
AS
BEGIN
    INSERT INTO TheLoai (TenLoai, Ghichu)
    VALUES (@TenLoai, @GhiChu);
END;

-- Tạo stored procedure cho sửa thể loại
CREATE PROCEDURE sp_SuaTheLoai
    @MaLoai INT,
    @TenLoai NVARCHAR(50),
    @GhiChu NVARCHAR(250)
AS
BEGIN
    UPDATE TheLoai
    SET TenLoai = @TenLoai, Ghichu = @GhiChu
    WHERE MaLoai = @MaLoai;
END;

-- Tạo stored procedure cho xóa thể loại
CREATE PROCEDURE sp_XoaTheLoai
    @MaLoai INT
AS
BEGIN
    DELETE FROM TheLoai
    WHERE MaLoai = @MaLoai;
END;

-- Tạo stored procedure cho tìm kiếm thể loại
CREATE PROCEDURE sp_TimKiemTheLoai
    @TenLoai NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM TheLoai
    WHERE TenLoai LIKE N'%' + @TenLoai + '%';
END;
   


   ---Tạo procedure lấy tất cả thể loại
   create proc sp_GetALl_TheLoai
   as
   begin
   select *From TheLoai
   end


   ------Thủ tục Thương hiệu
   -- Tạo stored procedure cho thêm thương hiệu
CREATE PROCEDURE sp_ThemThuongHieu
    @TenThuongHieu NVARCHAR(255),
    @MoTa NVARCHAR(MAX),
    @HinhAnh NVARCHAR(500)
AS
BEGIN
    INSERT INTO ThuongHieu (TenThuongHieu, MoTa, HinhAnh)
    VALUES (@TenThuongHieu, @MoTa, @HinhAnh);
END;

-- Tạo stored procedure cho sửa thông tin thương hiệu
CREATE PROCEDURE sp_SuaThuongHieu
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

-- Tạo stored procedure cho xóa thương hiệu
CREATE PROCEDURE sp_XoaThuongHieu
    @MaTH INT
AS
BEGIN
    DELETE FROM ThuongHieu
    WHERE MaTH = @MaTH;
END;

-- Tạo stored procedure cho tìm kiếm thương hiệu
CREATE PROCEDURE sp_TimKiemThuongHieu
    @TenThuongHieu NVARCHAR(255)
AS
BEGIN
    SELECT *
    FROM ThuongHieu
    WHERE TenThuongHieu LIKE N'%' + @TenThuongHieu + '%';
END;

---Tạo sto procedure lấy tất cả các thương hiệu
create proc sp_getAll_ThuongHieu
as
begin
select * From ThuongHieu
end


------Thủ tục bảng sản Phẩm
-- Tạo stored procedure cho thêm sản phẩm
alter PROCEDURE sp_ThemSanPham
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

-- Tạo stored procedure cho sửa thông tin sản phẩm (không sửa sldaban)
alter PROCEDURE sp_SuaThongTinSanPham
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

-- Tạo stored procedure cho sửa sldaban của sản phẩm
CREATE PROCEDURE sp_SuaSLDaBanSanPham
    @MaSP INT,
    @SoLuongDaBan INT
AS
BEGIN
    UPDATE SanPham
    SET sldaban = @SoLuongDaBan
    WHERE MaSP = @MaSP;
END;

-- Tạo stored procedure cho xóa sản phẩm
CREATE PROCEDURE sp_XoaSanPham
    @MaSP INT
AS
BEGIN
    DELETE FROM SanPham
    WHERE MaSP = @MaSP;
END;

-- Tạo stored procedure cho tìm kiếm sản phẩm theo tên
CREATE PROCEDURE sp_TimKiemSanPhamTheoTen
    @TenMH NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM SanPham
    WHERE TenMH LIKE N'%' + @TenMH + '%';
END;
----tạo procedure search và phân trang
alter PROCEDURE [dbo].[sp_search_sanpham]
    @page_index INT,
    @page_size INT,
    @ten_sanpham NVARCHAR(250) ,
    @gia_tien VARCHAR(50) ,
    @ten_theloai VARCHAR(250) ,
    @ten_thuonghieu VARCHAR(250)
AS
BEGIN
    SET NOCOUNT ON;

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
            AND (@gia_tien ='' OR sp.GiaBan LIKE '%' + @gia_tien + '%')
            AND (@ten_theloai ='' OR tl.TenLoai like '%'+ @ten_theloai+ '%')
            AND (@ten_thuonghieu='' OR th.TenThuongHieu = '%'+@ten_thuonghieu+'%');
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
            AND (@gia_tien ='' OR sp.GiaBan LIKE '%' + @gia_tien + '%')
            AND (@ten_theloai ='' OR tl.TenLoai like '%'+ @ten_theloai+ '%')
            AND (@ten_thuonghieu='' OR th.TenThuongHieu = '%'+@ten_thuonghieu+'%');

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

EXEC sp_search_sanpham @page_size=2,@page_index=5 ,@ten_sanpham = '',    @gia_tien = '',    @ten_theloai  = '',    @ten_thuonghieu  = ''


----------Thủ tục bảng Hóa Đơn Bán and Chi tiết hóa đơn bán
Create proc sp_CreateDonHangBan
    @TrangThai BIT,
    @NgayTao DATETIME,      
    @TenKH NVARCHAR(50),    
    @Diachi NVARCHAR(250),
    @Email NVARCHAR(50),
    @SDT NVARCHAR(50),
    @DiaChiGiaoHang NVARCHAR(350),
    @ThoiGianGiaoHang DATETIME,
	@list_json_chitietHDB NVARCHAR(MAX)
	as
begin
		----Tạo hóa đơn
		insert into HoaDonBan(TrangThai,NgayTao,TenKH,Diachi,Email,SDT,DiaChiGiaoHang,ThoiGianGiaoHang)
		values(@TrangThai,@NgayTao,@TenKH,@Diachi,@Email,@SDT,@DiaChiGiaoHang,@ThoiGianGiaoHang)

		----Lấy mã hóa hơn vừa tạo xong
		declare @MaHoaDon int 
		set @MaHoaDon=SCOPE_IDENTITY();
		declare @Tongtien Float;

		---Thêm chi tiết hóa đơn nhập
		if(@list_json_chitietHDB is not null)
		begin
			insert into ChiTietHoaDonBan(MaHD,MaSP,soLuong,giaBan,tongtien)
			select
			@MaHoaDon,
			JSON_VALUE(l.value,'$.MaSP'),
			JSON_VALUE(l.value,'$.SoLuong'),
			JSON_VALUE(l.value,'$.GiaBan'),
			cast(JSON_VALUE(l.value,'$.SoLuong')as int)*CAST(JSON_VALUE(l.value,'$.GiaBan')as float)
			from openjson(@list_json_chitietHDB) as l
		end
		---Cập nhật giá tiền tất cả của hóa đơn
		---lấy tổng tiền tất cả
		declare @ThanhTien float
		select @ThanhTien=(select SUM(ct.tongtien) from ChiTietHoaDonBan ct where ct.MaHD=@MaHoaDon)
		----Cập nhật
		Update HoaDonBan 
		set HoaDonBan.ThanhTien=@ThanhTien
	    where HoaDonBan.MaHD=@MaHoaDon
end

------Xóa đơn hàng bán
create proc sp_Delete_DonHangBan
@MaHD int
as
begin
delete HoaDonBan 
where HoaDonBan.MaHD=@MaHD
end

----Xác nhận đơn hàng bởi admin---
create proc sp_XacNhan_HDB
@MaHD int
as
begin
update HoaDonBan 
set HoaDonBan.TrangThai=1,HoaDonBan.NgayDuyet=GetDate()
where MaHD=@MaHD
end
