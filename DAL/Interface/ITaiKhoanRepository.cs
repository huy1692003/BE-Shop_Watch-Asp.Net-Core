using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
    public interface ITaiKhoanRepository
    {
        TaiKhoans Login(string username, string password);
        bool Create_TaiKhoan(string username, string password, int ltk);
        bool Update_TaiKhoan(TaiKhoans tk);
        bool Delete_TaiKhoan(string tentk);
        bool DoiMatKhau (string username,string new_Password);
        TaiKhoans GetInfo_User(string username);
    }
}
