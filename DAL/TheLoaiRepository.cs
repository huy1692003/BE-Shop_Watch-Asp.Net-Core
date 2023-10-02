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
    public class TheLoaiRepository:ITheLoaiRepository
    {
        private IDatabaseHelper db;
        public TheLoaiRepository(IDatabaseHelper db)
        {
            this.db = db;
        }
        public List<TheLoai> GetAll_TheLoai()
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_GetALl_TheLoai");
                if(!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return dt.ConvertTo<TheLoai>().ToList();

            }catch(Exception ex) { throw ex; }
            
        }
        
        public bool Create_TheLoai(TheLoai tl)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_ThemTheLoai",
                    "@TenLoai", tl.TenLoai,
                    "@GhiChu", tl.GhiChu);
                if(!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return true;
            }
            catch(Exception ex) { throw ex; }
        }
        public bool Delete_TheLoai(int id)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_XoaTheLoai", "@MaLoai", id);
                if(!string.IsNullOrEmpty(msgError)||(!string.IsNullOrEmpty(dt.ToString())&&dt!=null))
                {
                    throw new Exception(dt.ToString()+msgError);
                }
                return true;
            }
            catch (Exception ex) { throw ex; }
        }
        public bool Update_TheLoai(TheLoai tl)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemTheLoai",
                   "@MaLoai",tl.MaLoai,
                  "@TenLoai", tl.TenLoai,
                  "@GhiChu", tl.GhiChu);
                if ((dt != null && !string.IsNullOrEmpty(dt.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return true;
            }
            catch (Exception ex) { throw ex; }
        }
        public List<TheLoai> Get_TheLoai_byName(string name)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_TimKiemTheLoai","@TenLoai",name);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return dt.ConvertTo<TheLoai>().ToList();
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
