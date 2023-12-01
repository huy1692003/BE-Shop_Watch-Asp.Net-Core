using DAL.Interface;
using Data_Model;
using System;
using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using Microsoft.AspNetCore.Mvc;

namespace DAL
{
    public class GioHangRepository : IGioHangRepository
    {
        private IDatabaseHelper db;
        public GioHangRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
        public bool add_toCart([FromBody] GioHang gioHang)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_add_toCart",
                     "@maSP", gioHang.maSP,
                     "@tenSP", gioHang.tenSP,
                     "@anhSP", gioHang.anhSP,
                     "@giaban", gioHang.giaban,
                     "@taikhoan", gioHang.taikhoan);
                if (msgError != "")
                {
                    throw new Exception(msgError.ToString());
                }
                return msgError == "";
            }catch
            (Exception e)
            { throw new Exception(e.ToString()); }
        }
        
        public bool deleteCart(int maGH)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_deleteCart",
                     "@maGH", maGH);
                if (msgError != "")
                {
                    throw new Exception(msgError.ToString());
                }
                return msgError == "";
            }catch(Exception ex)
            {
                throw ex;
            }
        }
        public bool update_SL(int maGH, int sl)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateSL_Cart", "@maGH", maGH, "@soluong", sl);
                if (msgError != "")
                {
                    throw new Exception(msgError.ToString());
                }
                return msgError == "";
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public List<GioHang> getALl_Cart_byTenTK(string tentk)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getAllCart_byTenTK", "@tentaikhoan", tentk);
                if (msgError != "")
                {
                    throw new Exception(msgError.ToString());
                }
                return dt.ConvertTo<GioHang>().ToList();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

    }
}
