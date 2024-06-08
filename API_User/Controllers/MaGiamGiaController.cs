using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MaGiamGiaController : ControllerBase
    {
        private IMaGiamGiaBusiness _bus;
        public MaGiamGiaController(IMaGiamGiaBusiness _bus)
        {
            this._bus = _bus;
        }
        [HttpGet("getMGG")]
        public List<MaGiamGia> getMaGiamGia()
        {
            return _bus.getMaGiamGia(-1);// lấy tất cả mã giảm giá
        }

        [HttpGet("useMGG/{code}")]
        public IActionResult useMGG(string code)
        {
            MaGiamGia? mgg = _bus.useMaGiamGia(code);
            if(mgg != null) {

                return Ok(new { voucher = mgg });
            }
            return NotFound();

        }
    }
}
