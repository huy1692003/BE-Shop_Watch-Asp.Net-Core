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
            return BadRequest(false);
        }
        [HttpDelete("delete_toCart/{maGH}")]
        public IActionResult deleteCart(int maGH)
        {
            var check = bus_GH.deleteCart(maGH);
            if (check)
            {
                return Ok(true);
            }
            return BadRequest(false);
        }
        [HttpPut("update_SLCart/{maGH}/{sl}")]
        public IActionResult updateSL(int maGH,int sl)
        {
            var check = bus_GH.update_SL(maGH,sl);
            if (check)
            {
                return Ok(true);
            }
            return BadRequest(false);
        }
        [Route("getALLSP_Cart")]
        [HttpPost]
        public List<GioHang> getALLSP_Cart(string Tentk)
        {
            return bus_GH.getALl_Cart_byTenTK(Tentk);
        }    
    }
}
