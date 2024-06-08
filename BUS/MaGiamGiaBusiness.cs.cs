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
    public class MaGiamGiaBusiness:IMaGiamGiaBusiness
    {
        private IMaGiamGiaRespository _dal;

        public MaGiamGiaBusiness(IMaGiamGiaRespository _dal)
        {
            this._dal = _dal;
        }
        public List<MaGiamGia> getMaGiamGia(int status)
        {
           return _dal.getMaGiamGia(status);
        }
        public bool createMGG(MaGiamGia mgg)
        {
            return _dal.createMGG(mgg);
        }
       public  bool updateMGG(MaGiamGia mgg)
        {
            return _dal.updateMGG(mgg);
        }
        public bool refreshStatusMGG()
        {
            return _dal.refreshStatusMGG();
        }
        public bool deteleMGG(int id)
        {
            return _dal.deteleMGG(id);
        }
        public MaGiamGia? useMaGiamGia(string code)
        {
            return _dal.useMaGiamGia(code);
        }
    }
}
