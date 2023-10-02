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
    public class ThuongHieuBusiness : IThuongHieuBusiness
    {
        private IThuongHieuRepository thDAL;
        public ThuongHieuBusiness(IThuongHieuRepository th)
        {
            this.thDAL = th;
        }
        public List<ThuongHieu> GetAll_ThuongHieu()
        {
          return thDAL.GetAll_ThuongHieu();
            
        }
        public bool Create_ThuongHieu(ThuongHieu th)
        {
            return thDAL.Create_ThuongHieu(th);
        }
        public bool Delete_ThuongHieu(int id)
        {
            return thDAL.Delete_ThuongHieu(id);
        }
        public  bool Update_ThuongHieu(ThuongHieu th)
        {
            return thDAL.Update_ThuongHieu(th);
        }
        public List<ThuongHieu> Get_ThuongHieu_byName(string Name)
        {
            return thDAL.Get_ThuongHieu_byName(Name);
        }
    
    }

}
