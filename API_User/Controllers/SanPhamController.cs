using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
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
    }
}
