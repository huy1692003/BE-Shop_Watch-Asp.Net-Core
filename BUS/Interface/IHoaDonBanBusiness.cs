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
        HoaDonBan GetHDB_byID(string MaHDB);
        bool Update_HDB(HoaDonBan nv);
        bool Delete_NV(string MaNV);
    }
}
