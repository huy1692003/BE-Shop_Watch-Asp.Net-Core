using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BUS.NhanVienBusiness;
using DAL;
using Data_Model;
using DAL.Interface;

namespace BUS
{
    public class NhanVienBusiness : INhanVienBusiness
    {
        private INhanVienRepository _res;
        public NhanVienBusiness(INhanVienRepository res)
        {
            _res = res;
        }
        public NhanVien GetNV_byID(string id)
        {
            return _res.GetNV_byID(id);
        }
        public bool Create_NV(NhanVien model)
        {
            return _res.Create_NV(model);
        }
        public bool Delete_NV(string MaNV)
        {
            return _res.Delete_NV(MaNV);
        }
        public bool Update_NV(NhanVien model)
        {
            return (_res.Update_NV(model));
        }
    }

}
