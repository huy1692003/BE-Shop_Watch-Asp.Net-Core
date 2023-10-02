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
    public class TheLoaiBusiness : ITheLoaiBusiness
    {
        private ITheLoaiRepository tlDAL;
        public TheLoaiBusiness(ITheLoaiRepository tlDAL)
        {
            this.tlDAL = tlDAL;
        }

        public List<TheLoai> GetAll_TheLoai()
        {
            return tlDAL.GetAll_TheLoai();
        }
        public bool Create_TheLoai(TheLoai tl)
        {
            return tlDAL.Create_TheLoai(tl);
        }
        public bool Delete_TheLoai(int id)
        {
            return tlDAL.Delete_TheLoai(id);
        }
        public bool Update_TheLoai(TheLoai tl)
        {
            return tlDAL.Update_TheLoai(tl);
        }
        public List<TheLoai> Get_TheLoai_byName(string name)
        {
            return tlDAL.Get_TheLoai_byName(name);
        }

    }

}
