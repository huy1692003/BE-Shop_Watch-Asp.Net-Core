using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BUS.HoaDonBanBusiness;
using DAL;
using Data_Model;
using DAL.Interface;

namespace BUS
{
    public class HoaDonBanBusiness:IHoaDonBanBusiness
    {
        private IHoaDonBanRepository hdb_Dal;
        public HoaDonBanBusiness(IHoaDonBanRepository hdb_helper)
        {
            this.hdb_Dal = hdb_helper;
        }
        public bool Create_HDB(HoaDonBan hdb)
        {
            return hdb_Dal.Create_HDB(hdb);
        }
        public bool Delete_HDB(int MaHD)
        {
            return hdb_Dal.Delete_HDB(MaHD);
        }
        public bool ConFirm_HDB(int MaHD)
        {
            return hdb_Dal.ConFirm_HDB(MaHD);
        }
        public List<HoaDonBan> getHoaDonBan(out int total, int page, int pageSize, int trangthai, string time_begin, string time_end, string tentaikhoan)
        {     
            return hdb_Dal.getHoaDonBan(out total, page, pageSize, trangthai, time_begin,time_end,  tentaikhoan);
        }    
    }

}
