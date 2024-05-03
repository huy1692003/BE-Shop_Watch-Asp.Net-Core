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
    public class TinTucRepository : ITinTucRepository
    {
        private IDatabaseHelper _db;
        public TinTucRepository(IDatabaseHelper db)
        {
            _db = db;
        }

        public List<TinTuc> searchNews(out int total, int pageIndex, int pageSize, string Tieude,int trangthai =-1)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _db.ExecuteSProcedureReturnDataTable(out msgError, "sp_search_tintuc",
                    "@page_index ", pageIndex,
                    "@page_size", pageSize,
                    "@tieude", Tieude,
                    "@trangthai",trangthai

                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (pageSize != 0)
                {
                    if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["RecordCount"];
                }
                return dt.ConvertTo<TinTuc>().ToList();

            }
            
            catch (Exception e)
            {
                throw e;
            }
        }


        public bool create_TinTuc(TinTuc tt)
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_createNews",
                    "@tieude", tt.TieuDe,
                    "@noidung", tt.NoiDung,
                    "@hinhanh", tt.HinhAnh,
                    "@tentaikhoan", tt.TenTaiKhoan);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public bool update_TinTuc(TinTuc tt)
        {

            string msgError = "";
            try
            {
                var data = _db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateNews",
                "@id", tt.MaTinTuc,
                "@tieude", tt.TieuDe,
                "@noidung", tt.NoiDung,
                "@hinhanh", tt.HinhAnh);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool delete_TinTuc(int id)
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_deleteNews",
                    "@id", id);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool show_TinTuc(int id, int status)
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateStatusNews",
                    "@id", id, "@trangthai", status);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool update_View(int id)
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateView_News",
                    "@id", id);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public TinTuc? getDetail_News(int id)
        {
            string msgError = "";
            try
            {
                var data = _db.ExecuteSProcedureReturnDataTable(out msgError, "sp_detail_News",
                    "@id", id);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return data.ConvertTo<TinTuc>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }    

    }
}
