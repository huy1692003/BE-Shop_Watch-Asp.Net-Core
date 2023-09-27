using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;



namespace API_BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonBanController : ControllerBase
    {
        private IHoaDonBanBusiness _HoaDonBanBusiness;
        public HoaDonBanController(IHoaDonBanBusiness HoaDonBanBusiness) 
        {
            _HoaDonBanBusiness = HoaDonBanBusiness;
        }
        [Route("get-byid/{id}")]
        [HttpGet]
        public HoaDonBan GetHDBbyID(string id)
        {
            return _HoaDonBanBusiness.GetHDB_byID(id);
        }
        [Route("create-HoaDonBan")]
        [HttpPost]
        public HoaDonBan CreateHDB([FromBody] HoaDonBan HDB)
        {
            _HoaDonBanBusiness.Create_HDB(HDB);
            return HDB;
        }
        [Route ("update_HoaDonBan")]
        [HttpPut]
        public HoaDonBan Update_HDB([FromBody] HoaDonBan HDB)
        {
            _HoaDonBanBusiness.Update_HDB(HDB);
            return HDB;
        }
        [Route("delete_HoaDonBan")]
        [HttpDelete]
        public IActionResult Delete_HDB([FromBody] string maHDB)
        {
            _HoaDonBanBusiness.Delete_HDB(maHDB);
            return Ok();
        }
        
    }
}
