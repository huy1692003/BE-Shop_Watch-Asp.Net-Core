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
    public class KhachHangRepository : IKhachHangRepository
    {
        private IDatabaseHelper _db;

        public KhachHangRepository(IDatabaseHelper _db)
        {
            this._db = _db;
        }
        public List<KhachHang> getALLKH()
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getALLKH");
                if(!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<KhachHang>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool createKH(KhachHang kh)
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_createKH",

                        "@TenTaiKhoan", kh.TenTaiKhoan,
                        "@MatKhau", kh.MatKhau,
                        "@Email", kh.Email,
                        "@HoTen", kh.HoTen,
                        "@DiaChi", kh.DiaChi,
                        "@SoDienThoai", kh.SoDienThoai);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError);
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }


    }
}
