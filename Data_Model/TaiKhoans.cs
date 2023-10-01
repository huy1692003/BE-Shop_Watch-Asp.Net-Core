using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data_Model
{
    public class Users
    {
        public int MaTaiKhoan { get; set; }
        public int LoaiTaiKhoan { get; set; }
        public string TenTaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string Email { get; set; }
        public string Token { get; set; }
    }

}
