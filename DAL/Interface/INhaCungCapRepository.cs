using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.Interface
{
    public partial interface INhaCungCapRepository
    {
        bool Create_NCC(NhaCungCap ncc);
        NhaCungCap GetNCC_byID(int MaNCC);
        bool Update_NCC(NhaCungCap ncc);
        bool Delete_NCC(string MaNCC);
    }
}
