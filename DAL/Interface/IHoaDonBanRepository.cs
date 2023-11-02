using Data_Model;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.Interface
{
    public partial interface IHoaDonBanRepository
    {
        bool Create_HDB(HoaDonBan hdb);
        bool Delete_HDB(int MaHD);

        bool ConFirm_HDB(int MaHD);
        List<HoaDonBan> getHoaDonBan(out int total, int page, int pageSize, int trangthai, string time_begin, string time_end, string tentaikhoan);
    }
}
