using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
 public class ThuongHieuRepository:IThuongHieuRepository
    {
        private IDatabaseHelper db;
        public ThuongHieuRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
        public List<ThuongHieu> GetAll_ThuongHieu()
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getAll_ThuongHieu");
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return dt.ConvertTo<ThuongHieu>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public bool Create_ThuongHieu(ThuongHieu th)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemThuongHieu",
                 "@TenThuongHieu",th.TenThuongHieu,
                 "@MoTa",th.MoTa,
                 "@HinhAnh",th.HinhAnh);
                if (string.IsNullOrEmpty(dt.ToString())||!string.IsNullOrEmpty(msgError))                {
                   
                    throw new Exception(dt.ToString()+msgError);
                }
                
                return true;

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public bool Delete_ThuongHieu(int id)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_XoaThuongHieu", "@MaTH", id);
                if (string.IsNullOrEmpty(dt.ToString()) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return true;
                
            }catch(Exception ex) { throw ex; }
        }
        public bool Update_ThuongHieu(ThuongHieu th)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SuaThuongHieu",
                    "@MaTH",th.MaTH,
                 "@TenThuongHieu", th.TenThuongHieu,
                 "@MoTa", th.MoTa,
                 "@HinhAnh", th.HinhAnh);
                if(string.IsNullOrEmpty(dt.ToString())||!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return true;
            }
            catch(Exception ex) { throw ex;}

        }
        public List<ThuongHieu> Get_ThuongHieu_byName(string Name)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_TimKiemThuongHieu"
                    , "@TenThuongHieu", Name);
                if(!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return dt.ConvertTo<ThuongHieu>().ToList();

            }catch(Exception ex) { throw ex; }
        }
    }
}
