using BUS.Interface;
using DAL.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TinTucController : ControllerBase
    {
        private ITinTucBusiness _bus;
        public TinTucController(ITinTucBusiness _bus)
        {
            this._bus= _bus;
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
                int trangthai = -1;

                int total = 0;
                var data = _bus.searchNews(out total,page,pageSize, tieude,trangthai);

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

        [HttpPost("createNews")]
        
        public IActionResult createNews(TinTuc tt)
        {
            if(_bus.create_TinTuc(tt))
            {
                return Ok(true);
            }   
            return BadRequest("Dữ liệu không hợp lệ");
            
        }


        [HttpPut("updateNews")]
        public IActionResult updateNews(TinTuc tt)
        {
            if (_bus.update_TinTuc(tt))
            {
                return Ok(true);
            }
            return BadRequest("Dữ liệu không hợp lệ");

        }
        [HttpDelete("deleteNews/{id}")]
        public  IActionResult deleteNews(int id)
        {
            if (_bus.delete_TinTuc(id))
            {
                return Ok(true);
            }
            return NotFound("Không thấy dữ liệu");

        }
        [HttpPut("updateView_News/{id}")]
        public IActionResult updateView_News(int id)
        {
            if (_bus.update_View(id))
            {
                return Ok(true);
            }
            return NotFound("Không thấy dữ liệu");

        }
        [HttpPut("updateStatus_News/{id}/{status}")]
        public IActionResult updateStatus_News(int id,int status)
        {
            if (_bus.show_TinTuc(id,status))
            {
                return Ok(true);
            }
            return NotFound("Không thấy dữ liệu");

        }

    }
}
