using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ThuongHieuController : ControllerBase
    {
        private IThuongHieuBusiness thBUS;
        public ThuongHieuController(IThuongHieuBusiness thBUS)
        {
            this.thBUS = thBUS;
        }

        [Route("getALL_ThuongHieu")]
        [HttpGet]
        public List<ThuongHieu> GetAll_ThuongHieu()
        {
            return thBUS.GetAll_ThuongHieu();
        }
    }
}
