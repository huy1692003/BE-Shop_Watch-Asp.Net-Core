using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Search.Models;

namespace API_BanHang.Controllers
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

        [Route("search_SP")]
        [HttpPost]
        public IActionResult SearchSanPham([FromBody] Dictionary<string, object> ch)
        {
            try
            {
                int page = ch.ContainsKey("page") ? Convert.ToInt32(ch["page"].ToString()) : 1;
                int pageSize = ch.ContainsKey("pageSize") ? Convert.ToInt32(ch["pageSize"].ToString()) : 10;
                string tenSanPham = ch.ContainsKey("tenSanPham") ? Convert.ToString(ch["tenSanPham"].ToString()) : "";
                string tenTheLoai = ch.ContainsKey("tenTheLoai") ? Convert.ToString(ch["tenTheLoai"].ToString()) : "";
                string tenThuongHieu = ch.ContainsKey("tenThuongHieu") ? Convert.ToString(ch["tenThuongHieu"].ToString()) : "";
                string giatien = ch.ContainsKey("giatien") ? Convert.ToString(ch["giatien"].ToString()) : "";

                int total = 0;
                var data = sp_Bus.SearchSP(page, pageSize, out total, tenSanPham, tenTheLoai, tenThuongHieu, giatien);

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



        [Route("create_SP")]
        [HttpPost]
    public IActionResult Create_SanPham([FromBody]SanPham sp)
        {
            bool check = sp_Bus.Create_SanPham(sp);
            if(check)
            {
                return Ok("Thêm thành công");
            }
            return BadRequest("Thêm thất bại");
        }
        [Route("Delete_SP")]
        [HttpDelete]
        public IActionResult Delete_SanPham(int id)
        {
            bool check = sp_Bus.Delete_SanPham(id);
            if (check)
            {
                return Ok("Xóa thành công");
            }
            return BadRequest("Xóa thất bại");
        }
        [Route("UpdateSP_Info")]
        [HttpPut]
        public IActionResult Update_Info_SanPham(SanPham sp)
        {
            bool check = sp_Bus.Update_Info_SanPham(sp);
            if (check)
            {
                return Ok("Sửa thành công");
            }
            return BadRequest("Sửa thất bại");
        }
        [Route("UpdateSP_Slban")]
        [HttpPut]
        public IActionResult Update_SLdaban_New(int id, int sldaban)
        {
            bool check = sp_Bus.Update_SLdaban_New(id,sldaban);
            if (check)
            {
                return Ok("Sửa sk thành công");
            }
            return BadRequest("Sửa sl thất bại");
        }
    }
}
