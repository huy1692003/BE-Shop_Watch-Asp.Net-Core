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
    public class LoaiTaiKhoanRepository:ILoaiTaiKhoanRepository
    {
        private IDatabaseHelper db;
        public LoaiTaiKhoanRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
       public bool Create_LoaiTaiKhoan(LoaiTaiKhoans tk)
        {
            
            string msgError = "";
            try 
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemLoaiTaiKhoan",
                    "@TenLoai", tk.TenLoai,
                    "@MoTa", tk.mota );
                if(!string.IsNullOrEmpty(msgError)) 
                {
                    throw new Exception(dt.ToString()+msgError);
                    
                }
                return true;
            }
            catch(Exception ex) { throw ex; }

        }
        public List<LoaiTaiKhoans> GetAll_LoaiTK()
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_GetAll_LoaiTaiKhoan");                   
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);

                }
                return dt.ConvertTo<LoaiTaiKhoans>().ToList();
            }
            catch (Exception ex) { throw ex; }
        }
        public bool Update_LoaiTK(LoaiTaiKhoans LoaiTK)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SuaLoaiTaiKhoan",
                    "@MaLoaiTaiKhoan", LoaiTK.MaLoaiTaiKhoan,
                    "@TenLoai",LoaiTK.TenLoai,
                    "@MoTa", LoaiTK.mota);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);

                }
                return true;
            }
            catch (Exception ex) { throw ex; }
        }
        public  bool Delete_LoaiTK(int id)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_XoaLoaiTaiKhoan",
                    "@MaLoaiTaiKhoan",id);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);

                }
                return true;
            }
            catch (Exception ex) { throw ex; }
        }
    }    

}
