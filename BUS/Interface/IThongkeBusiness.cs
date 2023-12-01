using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
    public interface IThongkeBusiness
    {
        List<HoaDonBan> getHDB_CXN();
        List<thongke.KhachHangMuaNhieu> getListKH_muanhieu();
        List<thongke.SanPhamBanChay> getListSP_BanChay();
        List<thongke.DoanhThuTheoThoiGian> getListHDB_Date(string time_start, string time_end);
        List<thongke.DoanhThuNam> showDoanhThu();

    }
}
