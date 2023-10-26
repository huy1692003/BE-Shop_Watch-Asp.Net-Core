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

       public List<SanPham> SearchSP(int pageIndex, int pageSize, out int total, string TenSanPham, string TenTheLoai, string TenThuongHieu,string giatien)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_search_sanpham",
                    "@page_index ",pageIndex,
                    "@page_size",pageSize,
                    "@ten_sanpham",TenSanPham,
                    "@gia_tien",giatien,
                    "@ten_theloai ",TenTheLoai,
                    "@ten_thuonghieu",TenThuongHieu
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       public bool Create_SanPham(SanPham sp)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemSanPham",
                    "@MaTH", sp.MaTH,
                    "@TenMH", sp.TenMH,
                    "@MaLoai", sp.MaLoai,
                    "@SoLuongTon", sp.soLuongton,
                    "@GiaBan", sp.GiaBan,
                    "@Image_SP", sp.image_SP,
                    "@MoTa", sp.mota,
                    "@TrangThai", sp.trangthai);
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
                    "@MaLoai", sp.MaLoai,
                    "@SoLuongTon", sp.soLuongton,
                    "@GiaBan", sp.GiaBan,
                    "@Image_SP", sp.image_SP,
                    "@MoTa", sp.mota,
                    "@TrangThai", sp.trangthai);
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
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SuaSLDaBanSanPham",
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
