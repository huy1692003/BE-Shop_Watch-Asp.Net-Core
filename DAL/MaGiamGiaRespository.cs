using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class MaGiamGiaRespository : IMaGiamGiaRespository
    {
        private IDatabaseHelper db;
        public MaGiamGiaRespository(IDatabaseHelper dbHelper)
        {
            db = dbHelper;
        }
        public List<MaGiamGia> getMaGiamGia(int status)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getMaGiamGia", "@status", status == -1 ? "" : status);
                if ((dt != null && !string.IsNullOrEmpty(dt.ToString())) || !string.IsNullOrEmpty(msgError))
                {

                    throw new Exception(dt!.ToString() + msgError);
                }
                return dt!.ConvertTo<MaGiamGia>().ToList();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool createMGG(MaGiamGia mgg)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_createMagiamgia",
                "@code", mgg.code,
                "@mota", mgg.mota ?? "",
                "@ngaybatdau", mgg.ngaybatdau,
                "@ngayketthuc", mgg.ngayketthuc,
                "@giagiam", mgg.giagiam);
                if ((dt != null && !string.IsNullOrEmpty(dt.ToString())) || !string.IsNullOrEmpty(msgError))
                {

                    throw new Exception(dt.ToString() + msgError);
                }

                return string.IsNullOrEmpty(msgError) ? true : false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool updateMGG(MaGiamGia mgg)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateMagiamgia",
                "id", mgg.idMa,
                "@code", mgg.code,
                "@mota", mgg.mota ?? "",
                "@ngaybatdau", mgg.ngaybatdau,
                "@ngayketthuc", mgg.ngayketthuc,
                "@giagiam", mgg.giagiam);
                if ((dt != null && !string.IsNullOrEmpty(dt.ToString())) || !string.IsNullOrEmpty(msgError))
                {

                    throw new Exception(dt.ToString() + msgError);
                }

                return string.IsNullOrEmpty(msgError) ? true : false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool refreshStatusMGG()
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_refesh_StatusMGG");
                if (!string.IsNullOrEmpty(msgError))
                {

                    throw new Exception(dt?.ToString() + msgError);
                }

                return string.IsNullOrEmpty(msgError) ? true : false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool deteleMGG(int id)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_DeleteMGG",
                "id", id
                );
                if ((dt != null && !string.IsNullOrEmpty(dt.ToString())) || !string.IsNullOrEmpty(msgError))
                {

                    throw new Exception(dt.ToString() + msgError);
                }

                return string.IsNullOrEmpty(msgError) ? true : false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public MaGiamGia? useMaGiamGia(string code)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_useMaGiamGia", "@code", code);
                if ((dt != null && !string.IsNullOrEmpty(dt.ToString())) || !string.IsNullOrEmpty(msgError))
                {

                    throw new Exception(dt!.ToString() + msgError);
                }

                return dt!.Rows.Count > 0 ? dt!.ConvertTo<MaGiamGia>().ToList().FirstOrDefault():null;

            }
            catch (Exception ex)
            {
                throw ex;

            }
        }
    }
}
