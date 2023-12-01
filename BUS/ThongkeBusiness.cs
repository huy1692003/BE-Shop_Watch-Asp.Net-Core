using Data_Model;
using BUS.Interface;
using System;
using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Interface;

namespace BUS
{
    public class ThongkeBusiness:IThongkeBusiness
    {
        private IThongKeRepository dal_tk;
        public ThongkeBusiness(IThongKeRepository dal_tk)
        {
            this.dal_tk = dal_tk;
        }

        public List<HoaDonBan> getHDB_CXN()
        {
            return dal_tk.getHDB_CXN();
        }
        public List<thongke.KhachHangMuaNhieu> getListKH_muanhieu()
        {
            return dal_tk.getListKH_muanhieu();
        }
        public List<thongke.SanPhamBanChay> getListSP_BanChay()
        {
            return dal_tk.getListSP_BanChay();
        }
        public List<thongke.DoanhThuTheoThoiGian> getListHDB_Date(string time_start, string time_end)
        {
            return dal_tk.getListHDB_Date(time_start, time_end);
        }
        public List<thongke.DoanhThuNam> showDoanhThu()
        {
            return dal_tk.showDoanhThu();
        }

    }
}
