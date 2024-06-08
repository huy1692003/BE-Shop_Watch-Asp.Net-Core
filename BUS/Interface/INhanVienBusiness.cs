using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
    public interface INhanVienBusiness
    {
        List<NhanVien> getAllNV();
        bool createNV(NhanVien nv);

    }
}
