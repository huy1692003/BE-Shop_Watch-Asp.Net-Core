using Microsoft.AspNetCore.Http;

namespace Data_Model
{
    public class SanPham
    {
        public int MaSP { get; set; }
        public int MaTH { get; set; }
        public string TenMH { get; set; }
        public int MaLoai { get; set; }
        public int soLuongton { get; set; }
        public double GiaBan { get; set; }
        public string image_SP { get; set; }
        public string mota { get; set; }
        public int sldaban { get; set; }
        public string trangthai { get; set; }
    }

  

}