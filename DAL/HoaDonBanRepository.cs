using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HoaDonBanRepository
    {
        private IDatabaseHelper _dbHelper;
        public HoaDonBanRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public HoaDonBan GetHDB_byID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadon_get_by_id",
                     "@MaHoaDon", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<HoaDonBan>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create_HDB(HoaDonBan model)
        {
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadon_create",
            //    "@MaHD", model.MaHD,
            //    "@MaNV", model.MaNV,
            //    "@MaKH", model.MaKH,
            //    "@listSP_chitiethoadon", model.ChiTietHoaDonBan != null ? MessageConvert.SerializeObject(model.ChiTietHoaDonBan) : null);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            return true;
            //}
            //catch (Exception ex)
            //{
            //throw ex;
        
        }
        public bool Update_HDB(HoaDonBan model)
        {
            string msgError = "";
            try
            {
               // var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoa_don_update",
               //"@MaHD", model.MaHD,
               // "@MaNV", model.MaNV,
               // "@MaKH", model.MaKH,
               // "@listSP_chitiethoadon", model.ChiTietHoaDonBan != null ? MessageConvert.SerializeObject(model.ChiTietHoaDonBan) : null);
               // if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
               // {
               //     throw new Exception(Convert.ToString(result) + msgError);
               // }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Delete_HDB(string MaHDB)
        {
            string msgError = "";
            try
            {
            //var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_DeleteHDB",
            //     "@MaHDB", MaHDB);
            //if (!string.IsNullOrEmpty(msgError))
            //throw new Exception(msgError);
            return true;
        }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
