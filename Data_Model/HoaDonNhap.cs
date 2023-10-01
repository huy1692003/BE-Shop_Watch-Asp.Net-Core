namespace Data_Model
{
    public class HoaDonNhap
    {
        public string MaHD { get; set; }
        public DateTime NgayNhap { get; set; }
        public string maNCC { get; set; }
        public string MaNV { get; set; }
        public NhaCungCap NhaCungCap { get; set; }
        public LoaiTaiKhoan NhanVien { get; set; }
        public List<ChiTietHoaDonNhap> ChiTietHoaDonNhap { get; set; }
    }
}