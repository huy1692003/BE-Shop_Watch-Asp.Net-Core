using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
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
    }
}
