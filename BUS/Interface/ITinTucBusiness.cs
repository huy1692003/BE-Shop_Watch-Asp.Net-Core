using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.Interface
{
    public interface ITinTucBusiness
    {
        bool create_TinTuc(TinTuc tt);
        bool update_TinTuc(TinTuc tt);
        bool delete_TinTuc(int id);

        bool show_TinTuc(int id, int status);

        bool update_View(int id);
        List<TinTuc> searchNews(out int total, int pageIndex, int pageSize, string Tieude,int trangthai);
        TinTuc? getDetail_News(int id);
    }
}
