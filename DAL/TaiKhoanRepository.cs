using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace DAL
{
    public class TaiKhoanRepository:ITaiKhoanRepository
    {
        private IDatabaseHelper db;
        public TaiKhoanRepository(IDatabaseHelper db)
        {
            this.db = db;
        }

        public TaiKhoans? Login(string username, string password)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_DangNhap",
                    "@TenTaiKhoan", username,
                    "@MatKhau", password);
                TaiKhoans tk = dt.ConvertTo<TaiKhoans>().ToList().FirstOrDefault();
                if(!string.IsNullOrEmpty
                    (msgError) )
                {
                    throw new Exception(msgError);
                }
                return tk!=null ? tk :null;
              
            }
            catch(Exception ex) 
            { throw new Exception(msgError, ex); }
        }
       
        public bool Create_TaiKhoan(string username, string password,int ltk)
        {
            string msgError = "";
            try
            {
                
                int count = GetInfo_User(username) != null ? 1 : 0;
                if(count==1)
                {
                    return false;
                }
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemTaiKhoan",
                     "@TenTaiKhoan", username,
                     "@MatKhau", password,
                     "@LoaiTaiKhoan", ltk);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                bool check = string.IsNullOrEmpty(msgError) == true ? true : false;
                return check;
                
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public bool Update_TaiKhoan(TaiKhoans tk)
        {
            string msgError = "";
            try
            {
                var checkNull = GetInfo_User(tk.TenTaiKhoan);
                if (checkNull==null)
                {
                    return false;
                }
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_CapNhatTaiKhoan",
                    "@TenTaiKhoan", tk.TenTaiKhoan,
                    "@Email", tk.Email,
                    "@HoTen",tk.HoTen,
                    "@DiaChi",tk.DiaChi,
                    "@SoDienThoai",tk.SoDienThoai,
                    "@AnhDaiDien",tk.AnhDaiDien);              
                if (!string.IsNullOrEmpty(msgError))
                    {
                        throw new Exception(msgError );
                    }
                bool check = string.IsNullOrEmpty(msgError) == true ? true : false;
                return check;
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public bool Delete_TaiKhoan(string tentk)
        {
            string msgError = "";
            try           
            {               
                int FindTK = GetInfo_User(tentk) != null ? 1 : 0;
                if (FindTK==0)
                {
                   return false;
                }
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_XoaTaiKhoan","@TenTaiKhoan", tentk);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                bool check = string.IsNullOrEmpty(msgError) == true ? true : false;
                return check;
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public bool DoiMatKhau(string username, string new_Password)
        {
            string msgError = "";
            try
            {
                int FindTK = GetInfo_User(username) != null ? 1 : 0;
                if (FindTK == 0)
                {
                    return false;
                }
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_DoiMatKhau",
                    "@TenTaiKhoan", username,
                    "@MatKhauMoi", new_Password);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                bool check = string.IsNullOrEmpty(msgError) == true ? true : false;
                return check;
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public TaiKhoans? GetInfo_User(string username)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_GetInfo_User",
                    "@TenTaiKhoan", username);
                if (!string.IsNullOrEmpty(msgError))
                {
                    return null;
                }
                return dt.ConvertTo<TaiKhoans>().FirstOrDefault();
            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
    }
}
