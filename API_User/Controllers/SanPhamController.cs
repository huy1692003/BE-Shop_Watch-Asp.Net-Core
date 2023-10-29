using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness sp_Bus;
        public SanPhamController(ISanPhamBusiness sp_Bus)
        {
            this.sp_Bus = sp_Bus;
        }
        [Route("search_SP")]
        [HttpPost]
        public IActionResult SearchSanPham([FromBody] Dictionary<string, object> ch)
        {
            try
            {
                int page = ch.ContainsKey("page") ? Convert.ToInt32(ch["page"].ToString()) : 1;
                int pageSize = ch.ContainsKey("pageSize") ? Convert.ToInt32(ch["pageSize"].ToString()) : 10;
                string tenSanPham = ch.ContainsKey("tenSanPham") ? Convert.ToString(ch["tenSanPham"].ToString()) : "";
                string tenTheLoai = ch.ContainsKey("tenTheLoai") ? Convert.ToString(ch["tenTheLoai"].ToString()) : "";
                string tenThuongHieu = ch.ContainsKey("tenThuongHieu") ? Convert.ToString(ch["tenThuongHieu"].ToString()) : "";
                string giatien = ch.ContainsKey("giatien") ? Convert.ToString(ch["giatien"].ToString()) : "";

                int total = 0;
                var data = sp_Bus.SearchSP(page, pageSize, out total, tenSanPham, tenTheLoai, tenThuongHieu, giatien);

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
