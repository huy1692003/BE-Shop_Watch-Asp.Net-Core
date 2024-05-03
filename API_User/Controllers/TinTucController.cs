using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_User.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TinTucController : ControllerBase
    {
        private ITinTucBusiness _bus;
        public TinTucController(ITinTucBusiness _bus)
        {
            this._bus = _bus;
        }
        [Route("search_News")]
        [HttpPost]

        public IActionResult SearchNews([FromBody] Dictionary<string, object> ch)
        {
            try
            {
                int page = ch.ContainsKey("page") ? Convert.ToInt32(ch["page"].ToString()) : 1;
                int pageSize = ch.ContainsKey("pageSize") ? Convert.ToInt32(ch["pageSize"].ToString()) : 10;
                string tieude = ch.ContainsKey("tieude") ? Convert.ToString(ch["tieude"].ToString()) : "";
                int trangthai = 1;

                int total = 0;
                var data = _bus.searchNews(out total, page, pageSize, tieude,trangthai);

                return Ok(new
                {
                    TotalItems = total,
                    Data = data,
                    Page = page,
                    PageSize = pageSize
                });
            }
            catch (Exception ex)
            {
                return BadRequest($"Lỗi: {ex.Message}");
            }
        }
        [HttpGet("getDetail_News/{id}")]
        public IActionResult getDetail_News(int id)
        {
            TinTuc tmp=_bus.getDetail_News(id);
            if(tmp!=null)
            {
                return Ok(tmp);
            }
            return NotFound();
        }

        [HttpPut("updateView/{id}")]
        public IActionResult updateView_News(int id)
        {
           if(_bus.update_View(id))
            {
                return Ok(true);
            }
            return BadRequest();
        }
    }
}
