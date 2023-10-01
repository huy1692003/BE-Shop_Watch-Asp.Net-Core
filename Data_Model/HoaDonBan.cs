namespace Data_Model
{
    public class HoaDonBan
    {
        public string MaHD { get; set; }
        public DateTime NgayBan { get; set; }
        public string MaNV { get; set; }
        public string MaKH { get; set; }
        public LoaiTaiKhoan NhanVien { get; set; }
        public KhachHang KhachHang { get; set; }
        public List<ChiTietHoaDonBan> ChiTietHoaDonBan { get; set; }
    }
}