namespace Data_Model
{
    public class SanPham
    {
        public string MaSP { get; set; }
        public string TenMH { get; set; }
        public string MaLoai { get; set; }
        public int SoLuongTon { get; set; }
        public string ImageUrl { get; set; }
        public string Mota { get; set; }
        public bool TrangThai { get; set; }
        public TheLoai TheLoai { get; set; }
    }

}