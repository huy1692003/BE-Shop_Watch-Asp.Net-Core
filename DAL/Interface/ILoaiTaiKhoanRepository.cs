using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.Interface
{
    public partial interface ILoaiTaiKhoanRepository
    {
        bool Create_LoaiTaiKhoan(LoaiTaiKhoans tk);
        List<LoaiTaiKhoans> GetAll_LoaiTK();
        bool Update_LoaiTK(LoaiTaiKhoans LoaiTK);
        bool Delete_LoaiTK(int id);
    }
}
