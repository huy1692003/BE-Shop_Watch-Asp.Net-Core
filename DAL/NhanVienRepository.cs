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
    public class NhanVienRepository : INhanVienRepository
    {
        private IDatabaseHelper db;
        public NhanVienRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
        public List<NhanVien> getAllNV()
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getAllNV");

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<NhanVien>().ToList();
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public bool createNV(NhanVien nv)
        {
            string msgError = "";
            try
            {
                var data = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_createNV",

                        "@TenTaiKhoan", nv.TenTaiKhoan,
                        "@MatKhau", nv.MatKhau,
                        "@Email", nv.Email,
                        "@HoTen", nv.HoTen,
                        "@DiaChi", nv.DiaChi,
                        "@SoDienThoai", nv.SoDienThoai);

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
