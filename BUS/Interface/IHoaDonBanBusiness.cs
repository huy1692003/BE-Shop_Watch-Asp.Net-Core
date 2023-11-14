using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Model;
using DAL;

namespace BUS.Interface
{
  public partial interface IHoaDonBanBusiness
    {
        bool Create_HDB(HoaDonBan hdb);
        bool Delete_HDB(int MaHD);
        bool update_StatusHDB(int MaHD, int trangthai);
        List<HoaDonBan> getHoaDonBan(out int total, int page, int pageSize, int trangthai, string time_begin, string time_end, string tentaikhoan);
        HoaDonBan getDetail_HoaDonBan(int MaHD);
        bool updateDetail_HDB(HoaDonBanUpdate a);
    }
}
