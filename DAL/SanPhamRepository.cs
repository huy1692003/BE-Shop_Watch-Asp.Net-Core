using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SanPhamRepository : ISanPhamRepository
    {
        private IDatabaseHelper db;
        public SanPhamRepository(IDatabaseHelper db)
        {
            this.db = db;
        }

        public List<SanPham>? SearchSP(int pageIndex, int pageSize, out int total, string TenSanPham, int MaTheLoai, int MaThuongHieu, string giatien)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_search_sanpham",
                    "@page_index ", pageIndex,
                    "@page_size", pageSize,
                    "@ten_sanpham", TenSanPham,
                    "@gia_tien", giatien,
                    "@ma_theloai ", MaTheLoai == -1 ? "" : MaTheLoai,
                    "@ma_thuonghieu", MaThuongHieu == -1 ? "" : MaThuongHieu
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (pageSize != 0)
                {
                    if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["RecordCount"];
                }


                return convertListSP(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham>? convertListSP(DataTable data)
        {
            List<SanPham> list = new List<SanPham>();

            foreach (DataRow row in data.Rows)
            {
                SanPham sanPham = new SanPham();

                // Gán các thuộc tính từ dữ liệu trong mỗi hàng của DataTable
                sanPham.MaSP = row.Field<int?>("MaSP");
                sanPham.MaTH = row.Field<int?>("MaTH");
                sanPham.TenMH = row.Field<string?>("TenMH");
                sanPham.MaLoai = row.Field<int?>("MaLoai");
                sanPham.soLuongton = row.Field<int?>("soLuongton");
                sanPham.GiaBan = row.Field<double?>("GiaBan");
                sanPham.mota = row.Field<string?>("mota");
                sanPham.sldaban = row.Field<int?>("sldaban");
                sanPham.luotxem = row.Field<int?>("luotxem");
                sanPham.trangthai = row.Field<string?>("trangthai");
                sanPham.chatlieuday = row.Field<string?>("chatlieuday");
                sanPham.chatlieuvo = row.Field<string?>("chatlieuvo");
                sanPham.mausac = row.Field<string?>("mausac");
                sanPham.giaNhap = row.Field<double?>("giaNhap");

                // Gán danh sách hình ảnh
                string imageDataJson = row.Field<string>("anhSP");
                sanPham.anhSP = !string.IsNullOrEmpty(imageDataJson) ? JsonConvert.DeserializeObject<string[]>(imageDataJson) : null;

                list.Add(sanPham);
            }

            return list;
        }


        public bool Create_SanPham(SanPham sp)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThemSanPham",
                    "@maTH", sp.MaTH,
                    "@tenMH", sp.TenMH,
                    "@maLoai", sp.MaLoai,
                    "anhSP", sp.anhSP != null ? MessageConvert.SerializeObject(sp.anhSP) : null,
                    "@moTa", sp.mota,
                    "@chatlieuday", sp.chatlieuday,
                    "@chatlieuvo", sp.chatlieuvo,
                    "@mausac", sp.mausac

                   );
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError) == true ? true : false;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public bool Delete_SanPham(int id)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_XoaSanPham", "@MaSP", id);
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
                    "@soLuongTon", sp.soLuongton,
                    "@GiaBan", sp.GiaBan,
                    "@anhSP", sp.anhSP != null ? MessageConvert.SerializeObject(sp.anhSP) : null,
                    "@mota", sp.mota,
                    "@chatlieuday", sp.chatlieuday,
                    "@chatlieuvo", sp.chatlieuvo,
                    "@mausac", sp.mausac);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError) == true ? true : false;
            }
            catch (Exception ex)
            {
                throw new Exception(msgError, ex);
            }
        }

        public bool Update_SLdaban_New(int id, int sldaban)
        {


            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SuaSLDaBanSanPham",
                     "@MaSP", id,
                     "@SoLuongDaBan", sldaban
                    );
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return string.IsNullOrEmpty(msgError) == true ? true : false;

            }
            catch (Exception ex) { throw new Exception(msgError, ex); }
        }
        public bool UpdateLuotXem(int maSP)
        {
            string msgError = "";
            var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_UpdateLuotXem", "@maSP", maSP);
            if (!string.IsNullOrEmpty(msgError))
            {
                throw new Exception(msgError.ToString());
            }
            return string.IsNullOrEmpty(msgError);
        }

        public SanPham? getDetailProduct(int maSP)
        {
            string msgError = "";

            try
            {
                DataTable dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getDetailPrd", "@masp", maSP);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }

                return convertListSP(dt).FirstOrDefault();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPham>? getPrd_BestSelling(int maTL = -1, int maTH = -1)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getPrd_BestSelling", "@maloai", maTL == -1 ? "" : maTL, "@math", maTH == -1 ? "" : maTH);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);

                return convertListSP(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
