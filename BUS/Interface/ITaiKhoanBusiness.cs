using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
   public interface ITaiKhoanBusiness
    {
        TaiKhoans Login(string username, string password, int role);
        bool Create_TaiKhoan(string username, string password, int ltk);
        bool Update_TaiKhoan(TaiKhoans tk);
        bool Delete_TaiKhoan(string tk);
        bool DoiMatKhau(string username, string new_Password);
        TaiKhoans GetInfo_User(string username);
      
    }
}
