using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
    public interface ITheLoaiRepository
    {
        List<TheLoai> GetAll_TheLoai();
        bool Create_TheLoai(TheLoai tl);
        bool Delete_TheLoai(int id);
        bool Update_TheLoai(TheLoai th);
        TheLoai Get_TheLoai_byID(int id);
    }
}
