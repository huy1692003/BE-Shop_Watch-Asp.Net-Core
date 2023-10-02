using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;



namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        private IKhachHangBusiness _KhachHangBusiness;
        public KhachHangController(IKhachHangBusiness khachHangBusiness) 
        {
            _KhachHangBusiness = khachHangBusiness;
        }
        [Route("get-byid/{id}")]
        [HttpGet]
        public KhachHang GetNVbyID(string id)
        {
            return _KhachHangBusiness.GetKH_byID(id);
        }
        [Route("create-KhachHang")]
        [HttpPost]
        public IActionResult CreateNV([FromBody] KhachHang nv)
        {
            _KhachHangBusiness.Create_KH(nv);
            return Ok("Thêm thành công");
        }
        [Route ("update_KhachHang")]
        [HttpPut]
        public IActionResult Update_NV([FromBody] KhachHang nv)
        {
            _KhachHangBusiness.Update_KH(nv);
            return Ok("Cập nhật thành công");
        }
        [Route("delete_KhachHang")]
        [HttpDelete]
        public IActionResult Delete_NV([FromBody] string makh)
        {
            _KhachHangBusiness.Delete_KH(makh);
            return Ok();
        }
    }
}
