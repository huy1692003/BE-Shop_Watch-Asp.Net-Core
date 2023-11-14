using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
    public interface IHoaDonNhapBusiness
    {
        bool create_HDN(HoaDonNhap HDN);
        HoaDonNhap getDetail_HDN_byID(int Ma_HDN);
        bool update_HDN(HoaDonNhap HDN);
        bool delete_HDN(int MaHDN);
        List<HoaDonNhap> getListHDN(out int total, int page, int pageSize, string time_begin, string time_end, string tentaikhoan);
    }
}
