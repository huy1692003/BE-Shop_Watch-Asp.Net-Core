using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.Interface
{
    public partial interface IKhachHangRepository
    {
        bool Create_KH(KhachHang KH);
        KhachHang GetKH_byID(string MaKH);
        bool Update_KH(KhachHang kh);
        bool Delete_KH(string MaKH);
    }
}
