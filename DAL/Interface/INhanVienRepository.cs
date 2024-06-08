using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
    public interface INhanVienRepository
    {
        List<NhanVien> getAllNV();
        bool createNV(NhanVien nv);
    }
}
