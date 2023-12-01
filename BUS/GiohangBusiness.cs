using BUS.Interface;
using DAL.Interface;
using Data_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
   public class GiohangBusiness:IGioHangBusiness
    {
        private IGioHangRepository res;
        public GiohangBusiness(IGioHangRepository res)
        {
            this.res = res;
        }

        public bool add_toCart(GioHang gioHang)
        {
            return res.add_toCart(gioHang);
        }
        public bool deleteCart(int maGH)
        {
            return res.deleteCart(maGH);
        }
        public bool update_SL(int maGH, int sl)
        {
            return res.update_SL(maGH, sl);
        }
        public List<GioHang> getALl_Cart_byTenTK(string tentk)
        {
            return res.getALl_Cart_byTenTK(tentk);
        }

    }
}
