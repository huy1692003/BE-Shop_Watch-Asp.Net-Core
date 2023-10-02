using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class LoaiTaiKhoanRepository:ILoaiTaiKhoanRepository
    {
        private IDatabaseHelper db;
        public LoaiTaiKhoanRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
       public bool Create_LoaiTaiKhoan(LoaiTaiKhoans nv);
        public List<LoaiTaiKhoans> GetAll_LoaiTK();
        public bool Update_LoaiTK(LoaiTaiKhoans LoaiTK);
      public  bool Delete_LoaiTK(int id);
    }    

}
