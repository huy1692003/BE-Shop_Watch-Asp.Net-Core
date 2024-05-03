using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data_Model
{
    public class thongke
    {
        public class KhachHangMuaNhieu
        {
            public string TenTaiKhoan { get; set; }
            public string AnhDaiDien { get; set; }
            public string HoTen { get; set; }
            public string SoDienThoai { get; set; }
            public string DiaChi { get; set; }
            public float tongtien { get; set; }
            public int sldh { get; set; }
        }
        public class SanPhamBanChay
        {
            public int MaSP { get; set; }
            public string TenMH { get; set; }
            public string anhSP { get; set; }
            public int sldaban { get; set; }
            public float doanhthu { get; set; }
        }
        public class DoanhThuTheoThoiGian
        {
            public int MaHD { get; set; }
            public DateTime NgayTao { get; set; }
            public string TenKH { get; set; }
            public string DiaChiGiaoHang { get; set; }
            public float ThanhTien { get; set; }
        }
        public class DoanhThuNam
        {
            public int thang { get; set; }
            public float DoanhThu { get; set; }
        }
    }
}
