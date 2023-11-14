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
    public class HoaDonNhapBusiness : IHoaDonNhapBusiness
    {
        private IHoaDonNhapRepository hdn_dal;
        public HoaDonNhapBusiness(IHoaDonNhapRepository repository)
        {
            hdn_dal= repository;
        }
        public bool create_HDN(HoaDonNhap HDN)
        {
            return hdn_dal.create_HDN(HDN);
        }
        public HoaDonNhap getDetail_HDN_byID(int Ma_HDN)
        {
            return hdn_dal.getDetail_HDN_byID(Ma_HDN);
        }
        public bool update_HDN(HoaDonNhap HDN)
        {
            return hdn_dal.update_HDN(HDN);
        }
        public bool delete_HDN(int MaHDN)
        {
            return hdn_dal.delete_HDN(MaHDN);
        }
        public List<HoaDonNhap> getListHDN(out int total, int page, int pageSize, string time_begin, string time_end, string tentaikhoan)
        {
            return hdn_dal.getListHDN(out total, page, pageSize, time_begin, time_end, tentaikhoan);
        }
    }

}
