using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BUS.Interface;
using DAL;
using Data_Model;
using DAL.Interface;
using static System.Net.Mime.MediaTypeNames;

namespace BUS
{
    public class TaiKhoanBusiness : ITaiKhoanBusiness
    {
        private ITaiKhoanRepository tk_Dal;
        public TaiKhoanBusiness(ITaiKhoanRepository tk_Dal)
        {
            this.tk_Dal = tk_Dal;
        }

        public bool Login(string username, string password)
        {
            if(tk_Dal.Login(username, password))
            {
                return true;
            }
            return false;
        }
        public bool Create_TaiKhoan(string username, string password,int ltk)
        {
            
                return tk_Dal.Create_TaiKhoan(username, password, ltk);
          
        }
        public bool Update_TaiKhoan(TaiKhoans tk)
        {
            if (tk_Dal.Update_TaiKhoan(tk))
            {
                return true;
            }
            return false;
        }
        public bool Delete_TaiKhoan(string tentk)
        {
            if (tk_Dal.Delete_TaiKhoan(tentk))
            {
                return true;
            }
            return false;
        }
        public bool DoiMatKhau(string username, string new_Password)
        {
            if (tk_Dal.DoiMatKhau(username,new_Password))
            {
                return true;
            }
            return false;
        }    
        public TaiKhoans GetInfo_User(string username)
        {
            if (tk_Dal.GetInfo_User(username)==null)
            {
                return null;
            }
            return tk_Dal.GetInfo_User(username);
        }
    }

}
