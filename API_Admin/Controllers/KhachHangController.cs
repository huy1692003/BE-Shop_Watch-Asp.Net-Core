using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        IKhachHangBusiness _bus;
        private ITaiKhoanBusiness _busTK;
        public KhachHangController(IKhachHangBusiness _bus,ITaiKhoanBusiness _busTK)
        {
            this._bus = _bus;
            this._busTK = _busTK;
        }
        [HttpGet("getALLKH")]
        public List<KhachHang> getALLKH()
        {
            List <KhachHang> list = _bus.getALLKH();
            return list;

        }
        [HttpPost("create-KH")]
        public IActionResult createKH(KhachHang kh) {
            bool check=_bus.createKH(kh);
            if(check)
            {
                return Ok(true);
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpPut("update-KH")]

        public IActionResult updateKH(NhanVien nv)
        {
            bool check = _busTK.Update_TaiKhoan(nv);
            if (check)
            {
                return Ok("Update success");
            }
            return BadRequest("Có lỗi khi cập nhật thông tin hãy xem lại dữ liệu !");

        }
    }
}
