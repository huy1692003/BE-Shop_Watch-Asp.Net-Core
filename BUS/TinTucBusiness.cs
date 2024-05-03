using BUS.Interface;
using Data_Model;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Interface;

namespace BUS
{
    public class TinTucBusiness : ITinTucBusiness
    {
        private ITinTucRepository _res;
        public TinTucBusiness(ITinTucRepository _res)
        {
            this._res = _res;

        }
        public bool create_TinTuc(TinTuc tt)
        {
            return _res.create_TinTuc(tt);
        }
        public bool update_TinTuc(TinTuc tt)
        {
            return _res.update_TinTuc(tt);
        }
        public bool delete_TinTuc(int id)
        {
            return _res.delete_TinTuc(id);
        }

        public bool show_TinTuc(int id, int status)
        {
            return _res.show_TinTuc(id, status);
        }

        public bool update_View(int id)
        {
            return _res.update_View(id);
        }
        public List<TinTuc> searchNews(out int total, int pageIndex, int pageSize, string Tieude, int trangthai)
        {
            return _res.searchNews(out total, pageIndex, pageSize, Tieude,trangthai);
        }
        public TinTuc? getDetail_News(int id)
        {
            return _res.getDetail_News(id);
        }
    }
}
