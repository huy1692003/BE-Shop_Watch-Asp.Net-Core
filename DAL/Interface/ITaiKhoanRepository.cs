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
        bool Login(string username, string password);
        bool Create_TaiKhoan(TaiKhoans tk);
        bool Update_TaiKhoan(TaiKhoans tk);
        bool Delete_TaiKhoan(TaiKhoans tk);
        bool DoiMatKhau (string username,string new_Password);
    }
}
