using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.Interface
{
    public partial interface ISanPhamRepository
    {
        bool Create_SP(LoaiTaiKhoan nv);
        LoaiTaiKhoan GetSP_byID(string MaSP);
        bool Update_SP(SanPham sp);
        bool Delete_SP(string MaSP);
    }
}
