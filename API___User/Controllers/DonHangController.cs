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
    }
}
