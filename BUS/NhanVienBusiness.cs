using BUS.Interface;
using DAL.Interface;
using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class NhanVienBusiness:INhanVienBusiness
    {
        private INhanVienRepository _res;
        public NhanVienBusiness(INhanVienRepository _res)
        {
            this._res = _res;
        }
        public List<NhanVien> getAllNV()
        {
            return _res.getAllNV();
        }
        public bool createNV(NhanVien nv)
        {
            return _res.createNV(nv);
        }

    }
}
