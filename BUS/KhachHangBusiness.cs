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
    public class KhachHangBusiness:IKhachHangBusiness
    {
        private IKhachHangRepository _dal;
        public KhachHangBusiness(IKhachHangRepository _dal)
        {
            this._dal = _dal;
        }
        public List<KhachHang> getALLKH()
        {
            return _dal.getALLKH();
        }
        public bool createKH(KhachHang kh)
        {
            return _dal.createKH(kh);
        }
    }
}
