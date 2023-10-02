using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BUS.Interface;
using DAL;
using Data_Model;
using DAL.Interface;

namespace BUS
{
    public class TheLoaiBusiness : INhaCungCapBusiness
    {
        private INhaCungCapRepository _res;
        public TheLoaiBusiness(INhaCungCapRepository res)
        {
            _res = res;
        }
        public NhaCungCap GetNCC_byID(int MaNCC)
        {
            return _res.GetNCC_byID(MaNCC);
        }
        public bool Create_NCC(NhaCungCap ncc)
        {
            return _res.Create_NCC(ncc);
        }
        public bool Delete_NCC(string MaNCC)
        {
            return _res.Delete_NCC(MaNCC);
        }
        public bool Update_NCC(NhaCungCap model)
        {
            return _res.Update_NCC(model);
        }
    }

}
