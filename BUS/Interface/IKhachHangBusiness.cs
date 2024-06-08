using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
    public interface IKhachHangBusiness
    {
        List<KhachHang> getALLKH();
        bool createKH(KhachHang kh);
    }
}
