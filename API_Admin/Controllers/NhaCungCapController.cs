using BUS.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DAL;
using Data_Model;

namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhaCungCapController : ControllerBase
    {
        private INhaCungCapBusiness NCCBusiness;
        public NhaCungCapController(INhaCungCapBusiness business)
        {
            NCCBusiness = business;
        }
        [Route("GetNCC_byID/{MaNCC}")]
        [HttpGet]
        public NhaCungCap GetNhaCungCap_byMa(int MaNCC)
        {
            return NCCBusiness.GetNCC_byID(MaNCC);
        }
        [Route("getALL_NCC")]
        [HttpGet]
        public List<NhaCungCap> getALL_NCC()
        {
            return NCCBusiness.getALL_NCC();
        }
        
        [Route("Create_NhaCungCap")]
        [HttpPost]
        public IActionResult Create_NCC([FromBody] NhaCungCap ncc)
        {
            bool check=NCCBusiness.Create_NCC(ncc);
            if(check)
            {
                return Ok("Thêm thành công");
            }
            return BadRequest("Thêm thất bại");
        }
        [Route("Update_NhaCungCap")]
        [HttpPut]
        public IActionResult Update_NCC([FromBody] NhaCungCap ncc)
        {
            bool check = NCCBusiness.Update_NCC(ncc);
            if (check)
            {
                return Ok("Sửa thành công");
            }
            return BadRequest("Sửa thất bại");
        }
        [Route("Delete_NhaCungCap/{id}")]
        [HttpDelete]
        public IActionResult Delete_NCC(string id)
        {
            bool check = NCCBusiness.Delete_NCC(id);
            if (check)
            {
                return Ok("Xóa thành công");
            }
            return BadRequest("Xóa thất bại");
        }
    }
}
