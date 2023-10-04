using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaiKhoanController : ControllerBase
    {
        private ITaiKhoanBusiness tk_Bus;
        public TaiKhoanController(ITaiKhoanBusiness tk_Bus)
        {
            this.tk_Bus = tk_Bus;
        }
        [Route("Login")]
        [HttpGet]
        public async Task <IActionResult> Login(string username, string password)
        {
            if(tk_Bus.Login(username,password))
            {
                return Ok("Đăng Nhập Thành Công");
            }
            return BadRequest("Thông tin tài khoản hoặc mật khẩu không chính xác !");
        }
        [Route("Create_TaiKhoan")]
        [HttpPost]
        public async Task<IActionResult> Create_TaiKhoan(string username, string password)
        {
            if (tk_Bus.Create_TaiKhoan(username, password,1))
            {
                return Ok("Đăng kí Thành Công");
            }
            return BadRequest("Có lỗi khi đăng kí hãy xem lại tài khoản mật khẩu  !");
        }
        [Route("Update_TaiKhoan")]
        [HttpPut]
        public async Task<IActionResult> Update_TaiKhoan([FromBody]TaiKhoans tk)
        {
            if (tk_Bus.Update_TaiKhoan(tk))
            {
                return Ok("Cập Nhật Thành Công");
            }
            return BadRequest("Có lỗi khi cập nhật hãy xem lại tài khoản mật khẩu  !");
        }
        [Route("Delete_TaiKhoan")]
        [HttpDelete]
        public async Task<IActionResult> Delete_TaiKhoan(string tk)
        {
            if (tk_Bus.Delete_TaiKhoan(tk))
            {
                return Ok("Xóa Thành Thành Công");
            }
            return BadRequest("Có lỗi khi xóa hãy xem lại tài khoản mật khẩu  !");
        }
        [Route("DoiMatKhau_TaiKhoan")]
        [HttpPut]
        public async Task<IActionResult> DoiMatKhau(string username, string new_Password)
        {
            if (tk_Bus.DoiMatKhau(username, new_Password))
            {
                return Ok("Đổi mật khẩu Thành Công");
            }
            return BadRequest("Có lỗi khi đổi mật khẩu hãy xem lại tài khoản mật khẩu  !");
        }
        [Route("GetInFo_TaiKhoan")]
        [HttpGet]
        public TaiKhoans GetInfo_User(string username)
        {            
          return  tk_Bus.GetInfo_User(username);
        }
    }
}
