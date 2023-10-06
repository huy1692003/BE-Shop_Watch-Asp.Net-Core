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
        bool ConFirm_HDB(int MaHD);
    }
}
