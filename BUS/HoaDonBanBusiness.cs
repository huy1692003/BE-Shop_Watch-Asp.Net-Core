using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BUS.HoaDonBanBusiness;
using DAL;
using Data_Model;
using DAL.Interface;

namespace BUS
{
    public class HoaDonBanBusiness : IHoaDonBanBusiness
    {
        private IHoaDonBanRepository _res;
        public HoaDonBanBusiness(IHoaDonBanRepository res)
        {
            _res = res;
        }
        public HoaDonBan GetNV_byID(string id)
        {
            return _res.GetNV_byID(id);
        }
        public bool Create_NV(HoaDonBan model)
        {
            return _res.Create_NV(model);
        }
        public bool Delete_NV(string MaNV)
        {
            return _res.Delete_NV(MaNV);
        }
        public bool Update_NV(HoaDonBan model)
        {
            return (_res.Update_NV(model));
        }
    }

}
