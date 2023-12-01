using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interface
{
    public interface  IGioHangRepository
    {
        bool add_toCart(GioHang gioHang);
        bool deleteCart(int maGH);
        bool update_SL(int maGH,int sl);
        List<GioHang> getALl_Cart_byTenTK(string tentk);
    }
}
