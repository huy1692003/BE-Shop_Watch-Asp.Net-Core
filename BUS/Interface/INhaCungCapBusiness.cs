using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Model;
using DAL;

namespace BUS.Interface
{
  public partial interface INhaCungCapBusiness
    {
        bool Create_NCC(NhaCungCap ncc);
        NhaCungCap GetNCC_byID(int MaNCC);
        bool Update_NCC(NhaCungCap ncc);
        bool Delete_NCC(string MaNCC);
        List<NhaCungCap> getALL_NCC();
    }
}
