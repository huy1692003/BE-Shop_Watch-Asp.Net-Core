using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness sp_Bus;
        public SanPhamController(ISanPhamBusiness sp_Bus)
        {
            this.sp_Bus = sp_Bus;
        }
        [Route("GetSP_byName")]
        [HttpGet]
        public List<SanPham> GetSP_TheoTen(string TenSP)
        {
            return sp_Bus.GetSP_TheoTen(TenSP);
        }
        [Route("Create_SP")]
        [HttpPost]
        public IActionResult Create_SanPham([FromBody]SanPham sp)
        {
            bool check = sp_Bus.Create_SanPham(sp);
            if(check)
            {
                return Ok("Thêm thành công");
            }
            return BadRequest("Thêm thất bại");
        }
        [Route("Delete_SP")]
        [HttpDelete]
        public IActionResult Delete_SanPham(int id)
        {
            bool check = sp_Bus.Delete_SanPham(id);
            if (check)
            {
                return Ok("Xóa thành công");
            }
            return BadRequest("Xóa thất bại");
        }
        [Route("UpdateSP_Info")]
        [HttpPut]
        public IActionResult Update_Info_SanPham(SanPham sp)
        {
            bool check = sp_Bus.Update_Info_SanPham(sp);
            if (check)
            {
                return Ok("Sửa thành công");
            }
            return BadRequest("Sửa thất bại");
        }
        [Route("UpdateSP_Slban")]
        [HttpPut]
        public IActionResult Update_SLdaban_New(int id, int sldaban)
        {
            bool check = sp_Bus.Update_SLdaban_New(id,sldaban);
            if (check)
            {
                return Ok("Sửa sk thành công");
            }
            return BadRequest("Sửa sl thất bại");
        }
    }
}
