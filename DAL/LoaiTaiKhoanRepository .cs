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
    public class SanPhamRepository:ISanPhamRepository
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public LoaiTaiKhoan GetSP_byID(string MaNV)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_searchNV_by_MaNV",
                     "@MaNV", MaNV);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<LoaiTaiKhoan>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create_SP(LoaiTaiKhoan nv)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nhanvien_create",
                "@MaNV", nv.MaNV,
                "@TenNV", nv.TenNV,
                "@DiaChi", nv.DiaChi,
                "@Dienthoai", nv.DienThoai,
                "@ngaysinh", nv.ngaysinh);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Update_SP(SanPham nv)
        {
            string msgError = "";
            try
            {
                //var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nhanvien_update",
                //"@MaNV", nv.MaNV,
                //"@TenNV", nv.TenNV,
                //"@DiaChi", nv.DiaChi,
                //"@Dienthoai", nv.DienThoai,
                //"@ngaysinh", nv.ngaysinh);
                //if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                //{
                //    throw new Exception(Convert.ToString(result) + msgError);
                //}
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Delete_SP(string MaNV)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_DeleteNV",
                     "@MaNV", MaNV);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
