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
    public class SanPhamBusiness : ISanPhamBusiness
    {
        private ISanPhamRepository sp_Dal;
        public SanPhamBusiness(ISanPhamRepository sp_Dal)
        {
            this.sp_Dal = sp_Dal;
        }

        public List<SanPham> GetSP_TheoTen(string TenSP)
        {
            return sp_Dal.GetSP_TheoTen(TenSP);
        }
        public bool Create_SanPham(SanPham sp)
        {
            return sp_Dal.Create_SanPham(sp);
        }
        public bool Delete_SanPham(int id)
        {
            return sp_Dal.Delete_SanPham(id);
        }
        public bool Update_Info_SanPham(SanPham sp)
        {
            return sp_Dal.Update_Info_SanPham(sp);
        }
        public bool Update_SLdaban_New(int id, int sldaban)
        {
            return sp_Dal.Update_SLdaban_New(id, sldaban);
        }

    }

}
