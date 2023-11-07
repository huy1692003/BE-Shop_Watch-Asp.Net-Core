using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonBanController : ControllerBase
    {

        private IHoaDonBanBusiness hdb_Bus;
        public HoaDonBanController(IHoaDonBanBusiness hdb_Bus)
        {
            this.hdb_Bus = hdb_Bus;
        }
        [Route("User_DeleteHDB")]
        [HttpDelete]
        public IActionResult Delete_HDB(int Mahdb)
        {
            if (hdb_Bus.Delete_HDB(Mahdb))
            {
                return Ok("Hủy đơn hàng thành công");
            }
            return BadRequest("Hủy đơn hàng thất bại hãy thử lại !");
        }
        [Route("update_StatusHDB/{MaHD},{trangthai}")]
        [HttpPut]
        public IActionResult update_StatusHDB(int MaHD, int trangthai)
        {
            if (hdb_Bus.update_StatusHDB(MaHD,trangthai))
            {
                return Ok(true);
            }
            return BadRequest(false);
        }
        [Route("get_HDB")]
        [HttpPost]
        public IActionResult get_HDB([FromBody] Dictionary<string,object> d)
        {
            try
            {
                int page = d.ContainsKey("page") ? Convert.ToInt32(d["page"].ToString()) : 1;
                int pageSize = d.ContainsKey("pageSize") ? Convert.ToInt32(d["pageSize"].ToString()) : 10;
                int trangthai = d.ContainsKey("trangthai") ? Convert.ToInt32(d["trangthai"].ToString()) :0;
                string? time_begin = d.ContainsKey("time_begin") ? Convert.ToString(d["time_begin"].ToString()) :"";
                string? time_end = d.ContainsKey("time_end") ? Convert.ToString(d["time_end"].ToString()) : "";
                string? tentaikhoan = d.ContainsKey("tentaikhoan") ? Convert.ToString(d["tentaikhoan"].ToString()) : "";

                int total = 0;
                var data = hdb_Bus.getHoaDonBan(out total, page, pageSize, trangthai, time_begin, time_end, tentaikhoan);
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
