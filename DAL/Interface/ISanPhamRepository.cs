using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
    public interface ISanPhamRepository
    {
        List<SanPham> GetSP_TheoTen(string TenSP);
        bool Create_SanPham(SanPham tl);
        bool Delete_SanPham(int id);
        bool Update_Info_SanPham(SanPham th);
        bool Update_SLdaban_New(int id, int sldaban);
     
    }
}
