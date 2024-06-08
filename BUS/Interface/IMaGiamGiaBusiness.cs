using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
    public interface IMaGiamGiaBusiness
    {
        List<MaGiamGia> getMaGiamGia(int status);
        bool createMGG(MaGiamGia mgg);
        bool updateMGG(MaGiamGia mgg);
        bool refreshStatusMGG();
        bool deteleMGG(int id);
        MaGiamGia? useMaGiamGia(string code);
    }
}
