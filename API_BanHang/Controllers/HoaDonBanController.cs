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
        [Route("ConFirm_HDB")]
        [HttpPut]
        public IActionResult ConFirm_HDB(int Mahdb)
        {
            if (hdb_Bus.ConFirm_HDB(Mahdb))
            {
                return Ok("Xác nhận đơn hàng thành công");
            }
            return BadRequest("Xác nhận đơn hàng thất bại hãy thử lại !");
        }
    }
}
