using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BUS.KhachHangBusiness;
using DAL;
using Data_Model;
using DAL.Interface;

namespace BUS
{
    public class KhachHangBusiness : IKhachHangBusiness
    {
        private IKhachHangRepository _res;
        public KhachHangBusiness(IKhachHangRepository res)
        {
            _res = res;
        }
        public KhachHang GetKH_byID(string id)
        {
            return _res.GetKH_byID(id);
        }
        public bool Create_KH(KhachHang kh)
        {
            return _res.Create_KH(kh);
        }
        public bool Delete_KH(string MaKH)
        {
            return _res.Delete_KH(MaKH);
        }
        public bool Update_KH(KhachHang model)
        {
            return (_res.Update_KH(model));
        }
        public List<KhachHang> getAll_KH()
        { return _res.getAll_KH();}
    }

}
