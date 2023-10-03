using BUS;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BUS.Interface;

namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiTaiKhoanController : ControllerBase
    {
        private ILoaiTaiKhoanBusiness ltk_Bus;
        public LoaiTaiKhoanController(ILoaiTaiKhoanBusiness ltk_Bus)
        {
            this.ltk_Bus = ltk_Bus;
        }
        [Route("Create_LoaiTaiKhoan")]
        [HttpPost]
        public IActionResult Create_LoaiTaiKhoan([FromBody]LoaiTaiKhoans tk)
        {
            bool checkSucces = ltk_Bus.Create_LoaiTaiKhoan(tk);
            if (checkSucces)
            {
                return Ok("Thêm thành công loại tài khoản có tên : " + tk.TenLoai);
            }
            return BadRequest("Thêm thất bại");
        }
        [Route("GetAll_LoaiTK")]
        [HttpGet]
        public List<LoaiTaiKhoans> GetAll_LoaiTK()
        {
            return ltk_Bus.GetAll_LoaiTK();
        }
        [Route("Update_LoaiTK")]
        [HttpPut]
        public IActionResult Update_LoaiTK([FromBody]LoaiTaiKhoans ltk)
        {
            bool checkSucces = ltk_Bus.Update_LoaiTK(ltk);
            if (checkSucces)
            {
                return Ok("Sửa thành công loại tài khoản có mã : " + ltk.MaLoaiTaiKhoan);
            }
            return BadRequest("Sửa thất bại");
        }
        [Route("Delete_LoaiTK/{id}")]
        [HttpDelete]
        public IActionResult Delete_LoaiTK(int id)
        {
            bool checkSucces = ltk_Bus.Delete_LoaiTK(id);
            if (checkSucces)
            {
                return Ok("Xóa thành công loại tài khoản có mã : " + id);
            }
            return BadRequest("Xóa thất bại");
        }
    }
}
