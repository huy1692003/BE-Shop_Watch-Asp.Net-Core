using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;



namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhanVienController : ControllerBase
    {
        private INhanVienBusiness _nhanVienBusiness;
        public NhanVienController(INhanVienBusiness nhanVienBusiness) 
        {
            _nhanVienBusiness = nhanVienBusiness;
        }
        [Route("get-byid/{id}")]
        [HttpGet]
        public NhanVien GetNVbyID(string id)
        {
            return _nhanVienBusiness.GetNV_byID(id);
        }
        [Route("create-nhanvien")]
        [HttpPost]
        public NhanVien CreateNV([FromBody] NhanVien nv)
        {
            _nhanVienBusiness.Create_NV(nv);
            return nv;
        }
        [Route ("update_nhanvien")]
        [HttpPut]
        public NhanVien Update_NV([FromBody] NhanVien nv)
        {
            _nhanVienBusiness.Update_NV(nv);
            return nv;
        }
        [Route("delete_nhanvien")]
        [HttpDelete]
        public IActionResult Delete_NV([FromBody] string manv)
        {
            _nhanVienBusiness.Delete_NV(manv);
            return Ok();
        }
        
    }
}
