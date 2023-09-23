using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Model;
using DAL;

namespace BUS.Interface
{
  public partial interface INhanVienBusiness
    {
        bool Create_NV(NhanVien nv);
        NhanVien GetNV_byID(string MaNV);
        bool Update_NV(NhanVien nv);
        bool Delete_NV(string MaNV);
    }
}
