using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data_Model
{
    public class DanhGia
    {
        public int? id { get; set; }
        public int maSP { get; set; }
        public string noidung { get; set; }
        public int sosao { get; set; }
        public string tentaikhoan { get; set; }
        public DateTime ngaytao { get; set; }
    }
}
