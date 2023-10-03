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
    public class LoaiTaiKhoanBusiness:ILoaiTaiKhoanBusiness
    {
        private ILoaiTaiKhoanRepository ltk_dal;
        public LoaiTaiKhoanBusiness(ILoaiTaiKhoanRepository ltk_dal)
        {
            this.ltk_dal = ltk_dal;
        }
        public bool Create_LoaiTaiKhoan(LoaiTaiKhoans tk)
        {
            return ltk_dal.Create_LoaiTaiKhoan(tk);
        }
        public List<LoaiTaiKhoans> GetAll_LoaiTK()
        {
            return ltk_dal.GetAll_LoaiTK();
        }
        public bool Update_LoaiTK(LoaiTaiKhoans LoaiTK)
        {
            return ltk_dal.Update_LoaiTK(LoaiTK);
        }
        public bool Delete_LoaiTK(int id)
        {
            return ltk_dal.Delete_LoaiTK(id);
        }
    }

}
