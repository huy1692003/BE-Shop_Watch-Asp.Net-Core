using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {
        private IHoaDonBanBusiness hdb_bus;
        public DonHangController( IHoaDonBanBusiness hoaDonBanBusiness)
        {
            this.hdb_bus = hoaDonBanBusiness;
        }
        [HttpPost("create_hdb_byuser")]
        public IActionResult create_DonHangbyUser([FromBody] HoaDonBan hdb)
        {
            bool check=hdb_bus.Create_HDB(hdb);
            if (check)
            {
                return Ok(new { Message = "Tạo đơn hàng thành công", DonHang = hdb });
            }
            return BadRequest("Tạo đơn hàng thất bại hãy thử lại");
        }
        [Route("get_HDB")]
        [HttpPost]
        public IActionResult get_HDB([FromBody] Dictionary<string, object> d)
        {
            try
            {
                int page = d.ContainsKey("page") ? Convert.ToInt32(d["page"].ToString()) : 1;
                int pageSize = d.ContainsKey("pageSize") ? Convert.ToInt32(d["pageSize"].ToString()) : 10;
                int trangthai = d.ContainsKey("trangthai") ? Convert.ToInt32(d["trangthai"].ToString()) : 0;
                string? time_begin = d.ContainsKey("time_begin") ? Convert.ToString(d["time_begin"].ToString()) : "";
                string? time_end = d.ContainsKey("time_end") ? Convert.ToString(d["time_end"].ToString()) : "";
                string? tentaikhoan = d.ContainsKey("tentaikhoan") ? Convert.ToString(d["tentaikhoan"].ToString()) : "";

                int total = 0;
                var data = hdb_bus.getHoaDonBan(out total, page, pageSize, trangthai, time_begin, time_end, tentaikhoan);
                return Ok(new
                {
                    TotalItems = total,
                    Data = data,
                    Page = page,
                    PageSize = pageSize
                });
            }
            catch (Exception ex)
            {
                return BadRequest($"Lỗi: {ex.Message}");
            }
        }
    }
}
