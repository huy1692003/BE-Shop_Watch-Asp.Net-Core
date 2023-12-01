using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BUS;
using BUS.Interface;
using Data_Model;
using Microsoft.AspNetCore.Authorization;

namespace API_Admin.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ThongKeController : ControllerBase
    {
        private IThongkeBusiness bus_tk;
        public ThongKeController(IThongkeBusiness bus_tk)
        {
            this.bus_tk = bus_tk;
        }
        [HttpGet("getHDB_CXN")]
        public List<HoaDonBan> getHDB_CXN()
        {
            return bus_tk.getHDB_CXN();
        }
        [HttpGet("getListKH_muanhieu")]
        public List<thongke.KhachHangMuaNhieu> getListKH_muanhieu()
        {
            return bus_tk.getListKH_muanhieu();
        }
        [HttpGet("getListSP_BanChay")]
        public List<thongke.SanPhamBanChay> getListSP_BanChay()
        {
            return bus_tk.getListSP_BanChay();
        }
        [HttpPost("getListHDB_Date")]
        public IActionResult getListHDB_Date(string time_start, string time_end)
        {
            float doanhthu = bus_tk.getListHDB_Date(time_start, time_end).Sum(s => s.ThanhTien);
            return Ok(new { listDHB = bus_tk.getListHDB_Date(time_start, time_end), tongdoanhthu = doanhthu });
            
        }
        [HttpGet("showDoanhThu")]
        public List<thongke.DoanhThuNam> showDoanhThu()
        {
            return bus_tk.showDoanhThu();
        }

    }
}
