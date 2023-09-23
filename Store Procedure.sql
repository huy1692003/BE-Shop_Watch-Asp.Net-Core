---Thủ tục thêm NHÂN VIÊN
create proc sp_nhanvien_create 
 @MaNV nchar(20),
 @TenNV nvarchar(50),
 @DiaChi nvarchar(100),
 @Dienthoai nvarchar(15),
 @ngaysinh date
 as
 begin
	insert into NhanVien(MaNV,TenNV,DiaChi,DienThoai,ngaysinh) values (@MaNV,@TenNV,@DiaChi,@Dienthoai,@ngaysinh)
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
alter proc sp_nhanvien_update
 @MaNV nchar(20),
 @TenNV nvarchar(50) ,
 @DiaChi nvarchar(100) ,
 @Dienthoai nvarchar(15),
 @ngaysinh date 
 as
 begin
	update NhanVien Set TenNV=@TenNV,DiaChi=@DiaChi,DienThoai=@Dienthoai,ngaysinh=@ngaysinh where MaNV=@MaNV
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


 