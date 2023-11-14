namespace Data_Model
{
    public class HoaDonBan
    {
        public int MaHD { get; set; }
        public int TrangThai { get; set; }
        public DateTime NgayTao { get; set; }
        public DateTime NgayDuyet { get; set; }
        public DateTime NgayHuy { get; set; }
        public string? TenKH { get; set; }
        public string? Diachi { get; set; }
        public string? Email { get; set; }
        public string? SDT { get; set; }
        public string? DiaChiGiaoHang { get; set; }
        public float ThanhTien { get; set; }
        public DateTime ThoiGianGiaoHang { get; set; }
        public string? TenTaiKhoan { get; set; }
        public string? methodPay { get; set; }
        public List<ChiTietHoaDonBan>? ChiTietHoaDonBan { get; set; }
    }
    public class  HoaDonBanUpdate
    {
        public int MaHD { get; set; }
        public string? TenKH { get; set; }
        public string? Diachi { get; set; }
        public string? Email { get; set; }
        public string? SDT { get; set; }
        public string? DiaChiGiaoHang { get; set; }
        public float ThanhTien { get; set; }
        public DateTime ThoiGianGiaoHang { get; set; }
        public string? TenTaiKhoan { get; set; }
        public string? methodPay { get; set; }
        public List<ChiTietHoaDonBan>? ChiTietHoaDonBan { get; set; }

    }    
}