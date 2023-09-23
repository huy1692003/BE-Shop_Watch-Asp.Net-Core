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
        public NhaCungCap GetNhaCungCap_byMa(string MaNCC)
        {
            return NCCBusiness.GetNCC_byID(MaNCC);
        }
        [Route("Create_NhaCungCap")]
        [HttpPost]
        public IActionResult Create_NCC([FromBody] NhaCungCap ncc)
        {
            NCCBusiness.Create_NCC(ncc);
            return Ok();
        }
        [Route("Update_NhaCungCap")]
        [HttpPut]
        public IActionResult Update_NCC([FromBody] NhaCungCap ncc)
        {
            NCCBusiness.Update_NCC(ncc);
            return Ok();
        }
        [Route("Delete_NhaCungCap")]
        [HttpDelete]
        public IActionResult Delete_NCC(string id)
        {
            NCCBusiness.Delete_NCC(id);
            return Ok();
        }
    }
}
