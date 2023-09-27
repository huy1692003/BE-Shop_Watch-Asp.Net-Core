---Thủ tục thêm NHÂN VIÊN
create proc sp_nhanvien_create 
 @MaNV nchar(20),
 @TenNV nvarchar(50),
 @DiaChi nvarchar(100),
 @Dienthoai nvarchar(15),
 @ngaysinh date,
 @email nvarchar(100)
 as
 begin
	insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai,ngaysinh,email) values (@MaNV,@TenNV,@DiaChi,@Dienthoai,@ngaysinh,@email)
 end
  exec sp_nhanvien_create 'NV30',N'NVTest' ,N'Hưng Yên','038746373','2003-09-14'

 -----Tìm kiếm nhân viên by Mã NV
 create proc sp_searchNV_by_MaNV
 @MaNV nchar(20)
 as
 begin 
 select * From NhanVien as nv where nv.MaNV=@MaNV
 end

 ----Cập nhật thông tin Nhân Viên
create proc sp_nhanvien_update
 @MaNV nchar(20),
 @TenNV nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @Dienthoai nvarchar(15),
 @ngaysinh date ,
 @email nvarchar(100)
 as
 begin
	update NhanVien Set TenNV=@TenNV,DiaChi=@DiaChi,DienThoai=@Dienthoai,ngaysinh=@ngaysinh,email=@email where MaNV=@MaNV
 end
 exec sp_nhanvien_update 'NV01',N'NVTest' ,N'Hưng Yên','038746373','2003-09-14'

 ----Xóa nhân viên theo mã 
 create proc sp_DeleteNV
 @MaNV nchar(20)
 as
 begin 
 delete NhanVien where @MaNV=MaNV
 end
 exec sp_DeleteNV 'NV30'
  
 -------BẢNG NHÀ CUNG CẤP-----------------------
   ----1.Tìm kiếm nhà cung cấp theo mã Nhà cung cấp
    create proc sp_searchNCC_by_MaNCC
 @MaNCC nchar(20)
 as
 begin 
 select * From NhaCungCap as ncc where ncc.MaNCC=@MaNCC
 end

   ----2.Tạo mới nhà cung cấp
 create proc sp_nhacungcap_create 
 @MaNCC nchar(20),
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15)
 as
 begin
		INSERT INTO NhaCungCap(MaNCC,TenNCC,DiaChi,SoDienThoai) values (@MaNCC,@TenNCC,@DiaChi,@SoDienThoai)
 end

 ----Cập nhật thông tin Nhà cung cấp
create proc sp_nhacungcap_update
 @MaNCC nchar(20),
 @TenNCC nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @SoDienThoai nvarchar(15)
 as
 begin
	update NhaCungCap Set TenNCC=@TenNCC,DiaChi=@DiaChi,SoDienThoai=@SoDienthoai where MaNCC=@MaNCC
 end


 ----Xóa nhân viên theo mã 
 create proc sp_DeleteNCC
 @MaNCC nchar(20)
 as
 begin 
 delete NhaCungCap where @MaNCC=MaNCC
 end
 exec sp_DeleteNV 'NV30'

 -----Tạo khách hàng
 create proc sp_khachhang_create 
 @MaKH nchar(20),
 @TenKH nvarchar(50),
 @DiaChi nvarchar(100),
 @Dienthoai nvarchar(15),
 @ngaysinh date
 as
 begin
	insert into KhachHang(MaKH,TenKhachHang,DiaChi,DienThoai,ngaysinh) values (@MaKH,@TenKH,@DiaChi,@Dienthoai,@ngaysinh)
 end
  exec sp_nhanvien_create 'NV30',N'NVTest' ,N'Hưng Yên','038746373','2003-09-14'
 -----Tìm kiếm khachhang by Mã KH
 create proc sp_searchKH_by_MaKH
 @MaKH nchar(20)
 as
 begin 
 select * From KhachHang as kh where kh.MaKH=@MaKH
 end
 ----Cập nhật thông tin Nhân Viên
create proc sp_khachhang_update
 @MaKH nchar(20),
 @TenKH nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @Dienthoai nvarchar(15),
 @ngaysinh date 
 as
 begin
	update KhachHang Set TenKhachHang=@TenKH,DiaChi=@DiaChi,DienThoai=@Dienthoai,ngaysinh=@ngaysinh where MaKH=@MaKH
 end
 exec sp_nhanvien_update 'NV01',N'NVTest' ,N'Hưng Yên','038746373','2003-09-14'
 ----Xóa nhân viên theo mã 
 create proc sp_DeleteKH
 @MaKH nchar(20)
 as
 begin 
 delete KhachHang where @MaKH=MaKH
 end
 exec sp_DeleteNV 'NV30'

----------------tạo hóa đơn 
 alter PROCEDURE [dbo].[sp_hoadon_create]
(@TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai         bit,  
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDon INT;
        INSERT INTO HoaDons
                (TenKH, 
                 Diachi, 
                 TrangThai               
                )
                VALUES
                (@TenKH, 
                 @Diachi, 
                 @TrangThai
                );

				SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitiethoadon IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietHoaDons
						 (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia               
                        )
                    SELECT JSON_VALUE(p.value, '$.maSanPham'), 
                            @MaHoaDon, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.tongGia')    
                    FROM OPENJSON(@list_json_chitiethoadon) AS p;
                END;
        SELECT '';
    END;


	-------
	create PROCEDURE [dbo].[sp_hoa_don_update]
(@MaHoaDon        int, 
 @TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai         bit,  
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE HoaDons
		SET
			TenKH  = @TenKH ,
			Diachi = @Diachi,
			TrangThai = @TrangThai
		WHERE MaHoaDon = @MaHoaDon;
		
		IF(@list_json_chitiethoadon IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.tongGia') as tongGia,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitiethoadon) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO ChiTietHoaDons (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia ) 
			   SELECT
				  #Results.maSanPham,
				  @MaHoaDon,
				  #Results.soLuong,
				  #Results.tongGia			 
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE ChiTietHoaDons 
			  SET
				 SoLuong = #Results.soLuong,
				 TongGia = #Results.tongGia
			  FROM #Results 
			  WHERE  ChiTietHoaDons.maChiTietHoaDon = #Results.maChiTietHoaDon AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM ChiTietHoaDons C
			INNER JOIN #Results R
				ON C.maChiTietHoaDon=R.maChiTietHoaDon
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;