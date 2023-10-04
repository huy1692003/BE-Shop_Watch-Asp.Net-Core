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
    public class SanPhamRepository:ISanPhamRepository
    {
        private IDatabaseHelper db;
        public SanPhamRepository(IDatabaseHelper db)
        {
            this.db = db;
        }

       public List<SanPham>? GetSP_TheoTen(string TenSP)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_TimKiemSanPhamTheoTen", "@TenMH", TenSP);
                if(!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return dt.ConvertTo<SanPham>().ToList().Count>0?dt.ConvertTo<SanPham>().ToList():null;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
       public bool Create_SanPham(SanPham sp)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemSanPham",
                    "@MaTH", sp.MaTH,
                    "@TenMH", sp.TenMH,
                    "@MaLoai", sp.MaLoaiSP,
                    "@SoLuongTon", sp.SoLuongTon,
                    "@GiaBan", sp.GiaBan,
                    "@Image_SP", sp.Image_SP,
                    "@MoTa", sp.Mota,
                    "@TrangThai", sp.TrangThai);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError)==true?true:false;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
       public  bool Delete_SanPham(int id)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_XoaSanPham","@MaSP", id);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError) == true ? true : false;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
       public bool Update_Info_SanPham(SanPham sp)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SuaThongTinSanPham",
                     "@MaSP", sp.MaSP,
                    "@MaTH", sp.MaTH,
                    "@TenMH", sp.TenMH,
                    "@MaLoai", sp.MaLoaiSP,
                    "@SoLuongTon", sp.SoLuongTon,
                    "@GiaBan", sp.SoLuongTon,
                    "@Image_SP", sp.Image_SP,
                    "@MoTa", sp.Mota,
                    "@TrangThai", sp.TrangThai);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError) == true ? true : false;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
       public bool Update_SLdaban_New(int id, int sldaban)
        {


            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SuaThongTinSanPham",
                     "@MaSP",id,
                     "@SoLuongDaBan",sldaban
                    );
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError) == true ? true : false;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
    }
}
