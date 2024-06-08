using BUS;
using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GioHangController : ControllerBase
    {
        private IGioHangBusiness bus_GH;
        public GioHangController(IGioHangBusiness bus_GH)
        {
            this.bus_GH = bus_GH;
        }
        [HttpPost("add_toCart")]
        public IActionResult add_toCart(GioHang obj)
        {
            var check=bus_GH.add_toCart(obj);
            if(check)
            {
                return Ok(true);
            }
            return NotFound();
        }
        [HttpDelete("delete_toCart/{maGH}")]
        public IActionResult deleteCart(int maGH)
        {
            var check = bus_GH.deleteCart(maGH);
            if (check)
            {
                return Ok(true);
            }
            return NotFound();
        }
        [HttpPut("update_SLCart/{maGH}/{sl}")]
        public IActionResult updateSL(int maGH,int sl)
        {
            var check = bus_GH.update_SL(maGH,sl);
            if (check)
            {
                return Ok(true);
            }
            return NotFound();
        }
        [Route("getALLSP_Cart")]
        [HttpGet]
        public List<GioHang> getALLSP_Cart(string Tentk)
        {
            return bus_GH.getALl_Cart_byTenTK(Tentk);
        }    
    }
}
