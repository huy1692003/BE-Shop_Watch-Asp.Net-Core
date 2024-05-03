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
        [Route("search_SP")]
        [HttpPost]
        public IActionResult SearchSanPham([FromBody] Dictionary<string, object> ch)
        {
            try
            {
                int page = ch.ContainsKey("page") ? Convert.ToInt32(ch["page"].ToString()) : 1;
                int pageSize = ch.ContainsKey("pageSize") ? Convert.ToInt32(ch["pageSize"].ToString()) : 10;
                string tenSanPham = ch.ContainsKey("tenSanPham") ? Convert.ToString(ch["tenSanPham"].ToString()) : "";
                int MaTheLoai = ch.ContainsKey("maTheLoai") ? Convert.ToInt32(ch["maTheLoai"].ToString()) : -1;
                int MaThuongHieu = ch.ContainsKey("maThuongHieu") ? Convert.ToInt32(ch["maThuongHieu"].ToString()) : -1;
                string giatien = ch.ContainsKey("giatien") ? Convert.ToString(ch["giatien"].ToString()) : "";

                int total = 0;
                var data = sp_Bus.SearchSP(page, pageSize, out total, tenSanPham, MaTheLoai, MaThuongHieu, giatien);

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
        [HttpPost("update_LuotXem/{maSP}")]
        public IActionResult UpdateLuotXem(int maSP)
        {
            return Ok(sp_Bus.UpdateLuotXem(maSP));
        }
        [HttpGet("detail_Prd/{maSP}")]
        public IActionResult getDetail_prd(int maSP)
        {
            SanPham sp=sp_Bus.getDetailProduct(maSP);
            if(sp!=null)
            {
                return Ok(sp);
            }
            return BadRequest(false);
        }
        [HttpGet("getPrd_BestSelling")]
        public IActionResult getPrd_BestSelling()
        {
            List<SanPham> Prd_BestSelling_Men = sp_Bus.getPrd_BestSelling(maTL: 17);
            List<SanPham> Prd_BestSelling_women = sp_Bus.getPrd_BestSelling(maTL: 18);
            List<SanPham> Prd_BestSelling_couples = sp_Bus.getPrd_BestSelling(maTL: 19);
            return Ok(
                new
                {
                    BestSelling_Men= Prd_BestSelling_Men,
                    BestSelling_Women = Prd_BestSelling_women,
                    BestSelling_couples= Prd_BestSelling_couples

                }
               );            

        }
    }
}
