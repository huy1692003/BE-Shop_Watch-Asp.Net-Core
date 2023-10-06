using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
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
        [Route("User_CreateHDB")]
        [HttpPost]
        public IActionResult Create_HDB([FromBody]HoaDonBan hdb)
        {
            if(hdb_Bus.Create_HDB(hdb))
            {
                return Ok("Tạo đơn hàng thành công");
            }    
            return BadRequest("Tạo đơn hàng thất bại hãy thử lại !");
        }
        public IActionResult Delete_HDB(int Mahdb)
        {
            if (hdb_Bus.Delete_HDB(Mahdb))
            {
                return Ok("Hủy đơn hàng thành công");
            }
            return BadRequest("Hủy đơn hàng thất bại hãy thử lại !");
        }

    }
}
