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

        public List<SanPham> SearchSP(int pageIndex, int pageSize, out int total, string TenSanPham, int MaTheLoai, int MaThuongHieu, string giatien)
        {
            return sp_Dal.SearchSP(pageIndex, pageSize, out total, TenSanPham, MaTheLoai, MaThuongHieu, giatien);
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
        public bool UpdateLuotXem(int maSP)
        {
            return sp_Dal.UpdateLuotXem(maSP);
        }
        public SanPham getDetailProduct(int masp)
        {
            return sp_Dal.getDetailProduct(masp);
        }
        public List<SanPham>? getPrd_BestSelling(int maTL = -1, int maTH = -1)
        {
            return sp_Dal.getPrd_BestSelling(maTL, maTH);
        }
    }

}
