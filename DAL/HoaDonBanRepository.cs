using DAL.Interface;
using Data_Model;
using DataAccessLayer;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HoaDonBanRepository : IHoaDonBanRepository
    {
        private IDatabaseHelper db;
        public HoaDonBanRepository(IDatabaseHelper dbHelper)
        {
            db = dbHelper;
        }
        public bool Create_HDB(HoaDonBan hdb)
        {

            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_CreateDonHangBan",
                    "@TrangThai", 0,
                    "@NgayTao", DateTime.Now,
                    "@TenKH", hdb.TenKH,
                    "@Diachi", hdb.Diachi,
                    "@Email", hdb.Email,
                    "@SDT", hdb.SDT,
                    "@DiaChiGiaoHang", hdb.DiaChiGiaoHang,
                    "@ThoiGianGiaoHang", DateTime.Now.AddDays(2),
                    "@tentaikhoan", hdb.TenTaiKhoan,
                    "@methodPay",hdb.methodPay,
                    "@list_json_chitietHDB", hdb.ChiTietHoaDonBan != null ? MessageConvert.SerializeObject(hdb.ChiTietHoaDonBan) : null);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }
        public bool Delete_HDB(int MaHD)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_Delete_DonHangBan", "@MaHD", MaHD);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }
        public bool update_StatusHDB(int MaHD, int trangthai)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateStatus_HDB", "@MaHD", MaHD, "@trangthai", trangthai);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }
        public List<HoaDonBan> getHoaDonBan(out int total, int page, int pageSize, int trangthai, string time_begin, string time_end, string tentaikhoan)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_GetHoaDonban",
                    "@page_index", page,
                    "@page_size", pageSize,
                    "@trangthai", trangthai,
                    "@searchTime_begin", time_begin,
                    "@searchTime_end", time_end,
                    "@tentaikhoan", tentaikhoan);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<HoaDonBan>().ToList();
            }
            catch (Exception ex) { throw ex; }

        }

        public HoaDonBan? getDetail_HoaDonBan(int MaHD)
        {
            string msgError = "";
            try
            {
                var dt = db.ExecuteSProcedureReturnDataTable(out msgError, "sp_GetDetailDH", "@MaHD", MaHD);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                HoaDonBan? a= dt.ConvertTo<HoaDonBan>().ToList().FirstOrDefault();                 
                string? json = (dt.Rows[0]["ChiTietHoaDonBanJson"]).ToString();
                List<ChiTietHoaDonBan>? chiTietHoaDonList = JsonConvert.DeserializeObject<List<ChiTietHoaDonBan>>(json)!=null? JsonConvert.DeserializeObject<List<ChiTietHoaDonBan>>(json):null; 
                a.ChiTietHoaDonBan= chiTietHoaDonList;
                return a;
                

            }
            catch (Exception ex) { throw ex; }

        }
        public bool updateDetail_HDB(HoaDonBanUpdate a)
        {
   
            string msgError = "";
            try
            {
                var dt = db.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_updateHDB",
                        "@maHD", a.MaHD,
                        "@TenKH", a.TenKH,
                        "@Diachi", a.Diachi,
                        "@Email", a.Email,
                        "@SDT", a.SDT,
                        "@DiaChiGiaoHang", a.DiaChiGiaoHang,
                        "@methodPay", a.methodPay,
                        "@list_json_chitietHDB", a.ChiTietHoaDonBan);

                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError + dt.ToString());
                }
                return string.IsNullOrEmpty(msgError) ? true : false;
            }
            catch (Exception ex) { throw ex; }
        }    
    }

}

