using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
    internal interface IHoaDonNhapRepository
    {
        bool Create_HDN(HoaDonNhap HDN);
        HoaDonNhap GetHDN_byID(int Ma_HDN);
        bool Update_HDN(HoaDonNhap HDN);
        bool Delete_HDN(string MaHDN);
    }
}
