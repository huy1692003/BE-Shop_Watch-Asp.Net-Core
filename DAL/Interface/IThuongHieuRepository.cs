using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Model;

namespace DAL.Interface
{
   public interface IThuongHieuRepository
    {
        List<ThuongHieu> GetAll_ThuongHieu();
        bool Create_ThuongHieu(ThuongHieu th);
        bool Delete_ThuongHieu(int id);
        bool Update_ThuongHieu(ThuongHieu th);
        List<ThuongHieu> Get_ThuongHieu_byName(string Name);
    }
}
