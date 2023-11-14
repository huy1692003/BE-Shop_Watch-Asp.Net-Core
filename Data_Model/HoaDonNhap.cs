using System.ComponentModel.DataAnnotations.Schema;

namespace Data_Model
{
    public class HoaDonNhap
    {        
            public int MaHD { get; set; }
            public DateTime NgayNhap { get; set; }
            public int MaNCC { get; set; }
            public string TenTaiKhoan { get; set; }
            public string GhiChu { get; set; }
            public string? methodPay { get; set; }
            public float Tongtien { get; set; }

            public List<ChiTietHoaDonNhap> ChiTietHoaDonNhap { get; set; }      
             
    }
}