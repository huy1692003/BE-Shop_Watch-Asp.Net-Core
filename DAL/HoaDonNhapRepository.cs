using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace DAL
{
    public class HoaDonNhapRepository:IHoaDonNhapRepository
    {
        private IDatabaseHelper db;
        public HoaDonNhapRepository(IDatabaseHelper database ) {
            db=database;
        }
        public bool create_HDN(HoaDonNhap hdn)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_CreateHDN",
                        "@maNCC ", hdn.MaNCC,
                       "@TenTK", hdn.TenTaiKhoan,
                       "@GhiChu", hdn.GhiChu,
                       "@methodPay", hdn.methodPay,
                       "@ngaynhap", DateTime.Now,
                       "@list_json_chitietHDN", hdn.ChiTietHoaDonNhap != null ? MessageConvert.SerializeObject(hdn.ChiTietHoaDonNhap) : null);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }
        public HoaDonNhap? getDetail_HDN_byID(int Ma_HDN)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_getDetail_HDN","@maHDN" ,Ma_HDN);
                      
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                HoaDonNhap? a=dt.ConvertTo<HoaDonNhap>().ToList().SingleOrDefault();
                a.ChiTietHoaDonNhap = JsonConvert.DeserializeObject<List<ChiTietHoaDonNhap>>(dt.Rows[0]["listchitiethdn"].ToString()) != null ? JsonConvert.DeserializeObject<List<ChiTietHoaDonNhap>>(dt.Rows[0]["listchitiethdn"].ToString()) : null;
                return a;
              
            }
            catch (Exception ex) { throw ex; }
        }
        public bool update_HDN(HoaDonNhap hdn)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateHDN",
               "@maHDN", hdn.MaHD,
               "@MaNCC", hdn.MaNCC,
               "@GhiChu", hdn.GhiChu,
               "@methodPay", hdn.methodPay,
               "@list_json_chitietHDN", hdn.ChiTietHoaDonNhap != null ? MessageConvert.SerializeObject(hdn.ChiTietHoaDonNhap) : null);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }
        public bool delete_HDN(int MaHDN)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_DeleteHDN","@maHDN" ,MaHDN );
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(dt.ToString() + msgError);
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }
        public List<HoaDonNhap> getListHDN(out int total, int page, int pageSize, string time_begin, string time_end, string tentaikhoan)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_GetHoaDonNhap",
                    "@page_index", page,
                    "@page_size", pageSize,                   
                    "@searchTime_begin", time_begin,
                    "@searchTime_end", time_end,
                    "@tentaikhoan", tentaikhoan);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<HoaDonNhap>().ToList();
            }
            catch (Exception ex) { throw ex; }

        }
    }
}
