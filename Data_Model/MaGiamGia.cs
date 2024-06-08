using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data_Model
{
    public class MaGiamGia
    {
        public int idMa { get; set; }
        public string code { get; set; }
        public string? mota { get; set; }
        public DateTime ngaybatdau { get; set; }
        public DateTime  ngayketthuc { get; set; }
        public double  giagiam { get; set; }
        public int  trangthai { get; set; }


    }
}
