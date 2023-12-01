using BUS.Interface;
using DAL.Interface;
using Data_Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_BanHang.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TheLoaiController : ControllerBase
    {
        private ITheLoaiBusiness tl_Bus;
        public TheLoaiController(ITheLoaiBusiness tl_Bus)
        {
            this.tl_Bus = tl_Bus;
        }
        [Route("GetAll_TheLoai")]
        [HttpGet]
         public List<TheLoai> GetAll_TheLoai()
        {
            return tl_Bus.GetAll_TheLoai();
        }
        [Route("Create_TheLoai")]
        [HttpPost]
        public IActionResult Create_TheLoai([FromBody]TheLoai tl)
        {
            bool checksucces = tl_Bus.Create_TheLoai(tl);
            if(checksucces)
            {
                return Ok("Thêm thành công");
            }
            return BadRequest("Thêm thất bại");
                
        }
        [Route("Delete_TheLoai/{id}")]
        [HttpDelete]
        public IActionResult Delete_TheLoai(int id)
        {
            bool checksucces = tl_Bus.Delete_TheLoai(id);
            if (checksucces)
            {
                return Ok("Xóa thành công");
            }
            return BadRequest("Xóa thất bại");
        }
        [Route("Update_TheLoai")]
        [HttpPut]
        public IActionResult Update_TheLoai([FromBody]TheLoai tl)
        {
            bool checksucces = tl_Bus.Update_TheLoai(tl);
            if (checksucces)
            {
                return Ok("Sửa thành công");
            }
            return BadRequest("Xóa thất bại");
        }
        [Route("GetTheLoai_byName/{Name}")]
        [HttpGet]
        public List<TheLoai> Get_TheLoai_byName(string name)
        {
            return tl_Bus.Get_TheLoai_byName(name);
        }
        
    }
}
