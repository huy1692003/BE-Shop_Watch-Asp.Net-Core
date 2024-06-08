using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhanVienController : ControllerBase
    {
        private INhanVienBusiness _bus;
        private ITaiKhoanBusiness _busTK;
        public NhanVienController(INhanVienBusiness _bus, ITaiKhoanBusiness busTK)
        {
            this._bus = _bus;
            _busTK = busTK;
        }

        [HttpGet("getAll-NV")]
        public IActionResult getAllNV()
        {
            List<NhanVien> list = _bus.getAllNV();
            return list.Count > 0 ? Ok(list) : NotFound();
        }

        [HttpPost("create-NV")]
        public IActionResult createNV(NhanVien nv)
        {
            bool check = _bus.createNV(nv);
            if (check)
            {
                return Ok(true);
            }
            return BadRequest();
        }

        [HttpPut("update-NV")]

        public IActionResult updateNV(NhanVien nv)
        {
            bool check = _busTK.Update_TaiKhoan(nv);
            if (check)
            {
                return Ok("Update success");
            }
            return BadRequest("Có lỗi khi cập nhật thông tin hãy xem lại dữ liệu !");

        }

        [HttpDelete("delete-NV/(tentk)")]
        public IActionResult deleteNV(string tentk)
        {
            bool check = _busTK.Delete_TaiKhoan(tentk);
            if(check)
            {
                return Ok("Delete success");
            }
            return NotFound();
        }


    }
}
