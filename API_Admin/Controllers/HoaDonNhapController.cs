using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace API_Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonNhapController : ControllerBase
    {

        private IHoaDonNhapBusiness hdn_bus;
        public HoaDonNhapController(IHoaDonNhapBusiness hdn_bus)
        {
            this.hdn_bus = hdn_bus;
        }

        [Route("create_HDN")]
        [HttpPost]
        public IActionResult createHDN(HoaDonNhap a)
        {
            bool check = hdn_bus.create_HDN(a);
            if (check)
            {
                return Ok(true);
            }
            return BadRequest(false);
        }
        [Route("update_HDN")]
        [HttpPut]
        public IActionResult updateHDN(HoaDonNhap a)
        {
            bool check = hdn_bus.update_HDN(a);
            if (check)
            {
                return Ok(true);
            }
            return BadRequest(false);
        }
        [Route("delete_HDN/{id}")]
        [HttpDelete]
        public IActionResult DeleteHDN(int id)
        {
            bool check = hdn_bus.delete_HDN(id);
            if (check)
            {
                return Ok(true);
            }
            return BadRequest(false);
        }
        [Route("getDetail_HDN/{MaHD}")]
        [HttpPost]
        public IActionResult getDetail_HDN(int MaHD)
        {
            var objHDN = hdn_bus.getDetail_HDN_byID(MaHD);
            if (objHDN!=null)
            {
                return Ok(objHDN);
            }
            return BadRequest(false);
        }
        [Route("getList_HDN")]
        [HttpPost]
        public IActionResult getList_HDN([FromBody] Dictionary<string, object> d)
        {
            try
            {
                int page = d.ContainsKey("page") ? Convert.ToInt32(d["page"].ToString()) : 1;
                int pageSize = d.ContainsKey("pageSize") ? Convert.ToInt32(d["pageSize"].ToString()) : 10;               
                string? time_begin = d.ContainsKey("time_begin") ? Convert.ToString(d["time_begin"].ToString()) : "";
                string? time_end = d.ContainsKey("time_end") ? Convert.ToString(d["time_end"].ToString()) : "";
                string? tentaikhoan = d.ContainsKey("tentaikhoan") ? Convert.ToString(d["tentaikhoan"].ToString()) : "";
                int total = 0;
                var data = hdn_bus.getListHDN(out total, page, pageSize, time_begin, time_end, tentaikhoan);
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
