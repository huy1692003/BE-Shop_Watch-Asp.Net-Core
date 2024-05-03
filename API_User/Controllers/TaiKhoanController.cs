using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
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
        [HttpPost]
        public IActionResult Login([FromBody] AuthenticateModel user)
        {
            var tk = tk_Bus.Login(user.Username, user.Password,user.role);
            if (tk != null)
            {
                return Ok(new { taikhoan = tk.TenTaiKhoan, email = tk.Email, tk.Token });
            }
            return NotFound("Thông tin tài khoản hoặc mật khẩu không chính xác !");
        }
        [Route("Create_TaiKhoan")]
        [HttpGet]
        public async Task<IActionResult> Create_TaiKhoan(string username, string password)
        {
            if (tk_Bus.Create_TaiKhoan(username, password, 2))
            {
                return Ok("Đăng kí Thành Công");
            }
            return NotFound("Có lỗi khi đăng kí hãy xem lại tài khoản mật khẩu  !");
        }
        [Route("Update_TaiKhoan")]
        [HttpPut]
        public async Task<IActionResult> Update_TaiKhoan([FromBody] TaiKhoans tk)
        {
            if (tk_Bus.Update_TaiKhoan(tk))
            {
                return Ok("Cập Nhật Thành Công");
            }
            return BadRequest("Có lỗi khi cập nhật hãy xem lại dữ liệu !");
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
            return tk_Bus.GetInfo_User(username);
        }
    }
}
