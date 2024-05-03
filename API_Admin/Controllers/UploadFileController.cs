using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;

namespace API_Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadFileController : ControllerBase
    {
        private readonly string _path;

        public UploadFileController(IConfiguration configuration)
        {
            _path = configuration["AppSettings:path"];
        }

        [HttpPost("upload")]
        public IActionResult Upload(IFormFile file)
        {
            try
            {
                if (file == null || file.Length == 0)
                    return BadRequest("Không tìm thấy tệp hoặc tệp trống.");

                var date = DateTime.Now;
                var filePath = $"{date.Ticks}{Path.GetExtension(file.FileName)}";
                var fullPath = Path.Combine(_path, filePath);

                Directory.CreateDirectory(Path.GetDirectoryName(fullPath));
                using (var fileStream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(fileStream);
                }

                return Ok(new { filePath });
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Lỗi: " + ex.Message);
            }
        }
    }
}
