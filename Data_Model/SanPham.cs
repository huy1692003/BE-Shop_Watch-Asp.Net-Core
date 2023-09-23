namespace Data_Model
{
    public class SanPham
    {
        public string MaSP { get; set; }
        public string TenMH { get; set; }
        public string MaLoai { get; set; }
        public int soLuongton { get; set; }
        public TheLoai TheLoai { get; set; }
    }
}