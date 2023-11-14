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
-- Tạo stored procedure cho thêm tài khoảnc
alter PROCEDURE sp_ThemTaiKhoan
    @TenTaiKhoan NVARCHAR(50),
    @MatKhau NVARCHAR(50) ,
	@LoaiTaiKhoan INT
AS
BEGIN
    INSERT INTO TaiKhoans (TenTaiKhoan, MatKhau,MaLoaiTaiKhoan,HoTen,DiaChi,SoDienThoai,AnhDaiDien,Email)
    VALUES (@TenTaiKhoan, @MatKhau,@LoaiTaiKhoan,N'Trống',N'Trống',N'Trống',N'Trống',N'Trống');
END;
exec sp_ThemTaiKhoan 'huyok','123',2
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
create PROCEDURE sp_CapNhatTaiKhoan
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
   create proc sp_getALL_NCC
 as
 begin 
 select * From NhaCungCap 
 end

--
 alter proc sp_nhacungcap_create 
 @email nvarchar(100),
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15)
 as
 begin
		INSERT INTO NhaCungCap(Email,TenNCC,DiaChi,SoDienThoai) values (@email,@TenNCC,@DiaChi,@SoDienThoai)
 end

 ----Cập nhật thông tin Nhà cung cấp
alter proc sp_nhacungcap_update
 @MaNCC int,
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15),
 @email nvarchar(100)
 as
 begin
	update NhaCungCap Set TenNCC=@TenNCC,DiaChi=@DiaChi,SoDienThoai=@SoDienthoai,Email=@email where MaNCC=@MaNCC
 end


 ----Xóa ncc theo mã 
 create proc sp_DeleteNCC
 @MaNCC int
 as
 begin 
 delete NhaCungCap where @MaNCC=MaNCC
 end
 exec sp_DeleteNCC 0

----------------Thủ tục Thể Loại
-- Tạo stored procedure cho thêm thể loại
alter PROCEDURE sp_ThemTheLoai
    @TenLoai NVARCHAR(50),
    @GhiChu NVARCHAR(250)
AS
BEGIN
    INSERT INTO TheLoai (TenLoai,Ghichu)
    VALUES (@TenLoai, @GhiChu);
END;
exec sp_ThemTheLoai 'ok','ok'

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
exec sp_XoaTheLoai 6

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
create PROCEDURE sp_ThemSanPham
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
create PROCEDURE sp_SuaThongTinSanPham
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
 exec sp_SuaThongTinSanPham 20000,1,'ok',1,55,10000,'ok','ok','còn'
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
    @ma_theloai int ,
    @ma_thuonghieu int
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
            AND (@gia_tien ='' OR sp.GiaBan LIKE '%' + @gia_tien + '%')
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

EXEC sp_search_sanpham @page_size=0,@page_index=1 ,@ten_sanpham = '',    @gia_tien = '',    @ma_theloai ='',    @ma_thuonghieu  = ''


----------Thủ tục bảng Hóa Đơn Bán and Chi tiết hóa đơn bán
alter proc sp_CreateDonHangBan
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

		---Thêm chi tiết hóa đơn nhập
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
Create proc sp_updateStatus_HDB
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
	end
end
update HoaDonBan 
set TrangThai=0
-----Lấy thông tin dơn hàng bán
exec sp_GetHoaDonban @page_index=1, @page_size=2, @trangthai=2,  @searchTime_begin='',@searchTime_end='',@tentaikhoan =''
ALTER PROCEDURE sp_GetHoaDonBan
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
---CHi tiết đơn hàng cụ thể
 exec sp_GetDetailDH 10
alter PROCEDURE sp_GetDetailDH
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


alter table ChiTietHoaDonBan
alter column tenSP nvarchar(300)
update ChiTietHoaDonBan
set tenSP =N'Đồng Hồ Nam'

----Update hoadonban and chitiet
alter proc sp_updateHDB  
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

-- Ví dụ: Chạy thủ tục lưu trữ sp_updateHDB với các tham số tương ứng
EXEC sp_updateHDB
    @maHD = 1, -- Thay thế 123 bằng giá trị thực tế của maHD
    @TenKH = N'Tên Khách Hàng', -- Thay thế 'Tên Khách Hàng' bằng giá trị thực tế của TenKH
    @Diachi = N'Địa Chỉ', -- Thay thế 'Địa Chỉ' bằng giá trị thực tế của Diachi
    @Email = N'example@email.com', -- Thay thế 'example@email.com' bằng giá trị thực tế của Email
    @SDT = N'1234567890', -- Thay thế '1234567890' bằng giá trị thực tế của SDT
    @DiaChiGiaoHang = N'Địa Chỉ Giao Hàng', -- Thay thế 'Địa Chỉ Giao Hàng' bằng giá trị thực tế của DiaChiGiaoHang
    @list_json_chitietHDB = N'[{"maSP": 107, "imageSP": "url", "tenSP": "Sản phẩm 1", "soLuong": 12, "giaBan": 20000}]' -- Thay thế JSON này bằng dữ liệu thực tế.

	
-----Thêm hóa đơn nhập and chi tiết hóa đơn nhập
create proc sp_CreateHDN
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


------Update hóa đơn nhập and chitiet
alter proc sp_updateHDN
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
				-- Cập nhật chi tiết hóa đơn bán
				UPDATE ct
				SET
					ct.SoLuong = u.soLuong,
					ct.GiaNhap = u.giaNhap,
					ct.tongTien = u.tongTien
				FROM ChiTietHoaDonNhap ct
				INNER JOIN #UpdatedDetails u ON ct.MaSP = u.maSP
				WHERE ct.MaHDN = @maHDN

				-- Thêm chi tiết hóa đơn bán mới
				insert into ChiTietHoaDonNhap(MaHDN,MaSP,SoLuong,GiaNhap,TongTien)
				select @MaHDN,s.maSP,s.soLuong,s.giaNhap,s.tongTien
				FROM #UpdatedDetails as s
				WHERE s.maSP NOT IN (SELECT MaSP FROM ChiTietHoaDonNhap WHERE MaHDN = @maHDN)

				-- Bước 3: Xóa các chi tiết không có trong danh sách cập nhật
				DELETE FROM ChiTietHoaDonNhap
				WHERE MaHDN = @maHDN AND MaSP NOT IN (SELECT maSP FROM #UpdatedDetails)

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
  
  ------Thủ túc lấy về chi tiết hóa đơn nhập
  exec sp_getDetail_HDN 3
  create proc sp_getDetail_HDN
  @maHDN int
  as
  begin
  select * ,(select * from ChiTietHoaDonNhap as n where n.MaHDN=@maHDN for json auto ) as listchitiethdn from HoaDonNhap where MaHD=@maHDN
  end

  ---thủ tục xóa hóa đơn nhập by id
  exec sp_DeleteHDN 5
  alter proc sp_DeleteHDN 
  @maHDN int
  as
  begin
  delete HoaDonNhap where MaHD=@maHDN
  end
  ------thủ tục lấy danh sách hóa đơn nhập và phân trang
  exec sp_GetHoaDonNhap 1,5,'2002-09-01','',''
  create PROCEDURE sp_GetHoaDonNhap
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