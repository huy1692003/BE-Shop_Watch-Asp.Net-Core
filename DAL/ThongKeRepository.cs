using Data_Model;
using DAL.Interface;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace DAL
{
    public class ThongKeRepository:IThongKeRepository
    {

        private IDatabaseHelper db;
        public ThongKeRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
        public List<HoaDonBan> getHDB_CXN()
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_donhangCXN");
                if (msgError != "")
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<HoaDonBan>().ToList();
            }catch (Exception e)
            {
                throw e;
            }
            
        }
        public List<thongke.KhachHangMuaNhieu> getListKH_muanhieu()
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_danhsachKH_muanhieu");
                if (msgError != "")
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<thongke.KhachHangMuaNhieu>().ToList();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public List<thongke.SanPhamBanChay> getListSP_BanChay()
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_banchay");
                if (msgError != "")
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<thongke.SanPhamBanChay>().ToList();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public List<thongke.DoanhThuTheoThoiGian> getListHDB_Date(string time_start,string time_end)
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_doanhthu_time", "@date_start",time_start=="0"?"": time_start, "@date_end",time_end== "0" ? "":time_end);
                if (msgError != "")
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<thongke.DoanhThuTheoThoiGian>().ToList();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public List<thongke.DoanhThuNam> showDoanhThu()
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_showdoanhthu");
                if (msgError != "")
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<thongke.DoanhThuNam>().ToList();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
