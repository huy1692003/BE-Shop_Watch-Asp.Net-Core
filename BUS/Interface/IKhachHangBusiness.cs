using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Model;
using DAL;

namespace BUS.Interface
{
  public partial interface IKhachHangBusiness
    {
        bool Create_KH(KhachHang kh);
        KhachHang GetKH_byID(string MaKH);
        bool Update_KH(KhachHang kh);
        bool Delete_KH(string MaKH);
        List<KhachHang> getAll_KH();
    }
}
