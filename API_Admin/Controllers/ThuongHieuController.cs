using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Data_Model;
using BUS;
using BUS.Interface;
using Microsoft.AspNetCore.Authorization;

namespace API_BanHang.Controllers
{
    
    [Route("api/ThuongHieu")]
    [ApiController]
    public class ThuongHieuController : ControllerBase
    {
        private IThuongHieuBusiness thBUS;
        public ThuongHieuController(IThuongHieuBusiness thBUS)
        {
            this.thBUS = thBUS;
        }
        
        [Route("GetALL_TH")]
        [HttpGet]
        public List<ThuongHieu> GetAll_ThuongHieu()
        {
            return thBUS.GetAll_ThuongHieu();
        }
        [Route("Create_TH")]
        [HttpPost]
        public IActionResult Create_ThuongHieu([FromBody]ThuongHieu th)
        {
            bool checkSucces = thBUS.Create_ThuongHieu(th);
            if(checkSucces)
            {
                return Ok("Thêm Thành Công");
            }
            return BadRequest("Thêm thất bại");
        }
        [Route("Delete_TH/{id}")]
        [HttpDelete]
        public IActionResult Delete_ThuongHieu(int id)
        {
            bool checkSucces = thBUS.Delete_ThuongHieu(id);
            if (checkSucces)
            {
                return Ok("Xóa Thành Công");
            }
            return BadRequest("Xóa thất bại");
        }
        [Route("Update_TH")]
        [HttpPut]
        public IActionResult Update_ThuongHieu([FromBody]ThuongHieu th)
        {
            bool checkSucces = thBUS.Update_ThuongHieu(th);
            if (checkSucces)
            {
                return Ok("Cập nhật Thành Công");
            }
            return BadRequest("Cập nhật thất bại");
        }
        [Route("Get_ThuongHieu_byName/{name}")]
        [HttpGet]
        public List<ThuongHieu> Get_ThuongHieu_byName(string name)
        {
            return thBUS.Get_ThuongHieu_byName(name);
        }
    }
}
