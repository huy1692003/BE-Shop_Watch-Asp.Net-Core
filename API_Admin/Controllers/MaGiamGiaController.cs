using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Admin.Controllers
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
        [HttpGet("getMGG/{status}")]
        public List<MaGiamGia> getMaGiamGia(int status)
        {
            return _bus.getMaGiamGia(status);
        }

        [HttpPost("createMGG")]
        public IActionResult createMGG(MaGiamGia mgg)
        {
            bool check=_bus.createMGG(mgg);
            if (check)
            {
                return Ok(new { message= "Thêm thành công"});
            }
            return NotFound();
        }
        [HttpPut("updateMGG")]
        public IActionResult updateMGG(MaGiamGia mgg)
        {
            bool check = _bus.updateMGG(mgg);
            if (check)
            {
                return Ok(new { message = "Sửa thành công" });
            }
            return NotFound();
        }
        [HttpPut("refreshStatusMGG")]
        public IActionResult refreshStatusMGG()
        {
            bool check = _bus.refreshStatusMGG();
            if (check)
            {
                return Ok(true);
            }
            return NotFound();
        }

        [HttpDelete("deleteMGG/{id}")]
        public IActionResult deteleMGG(int id)
        {
            bool check = _bus.deteleMGG(id);
            if (check)
            {
                return Ok(new { message = "Xóa thành công" });
            }
            return NotFound();
        }
    }
}
