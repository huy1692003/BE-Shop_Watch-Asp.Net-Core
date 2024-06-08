using BUS.Interface;
using BUS;
using DAL.Interface;
using DAL;
using DataAccessLayer;
using Data_Model;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});
// Add services to the container.
builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();
builder.Services.AddTransient<INhaCungCapRepository, NhaCungCapRepository>();
builder.Services.AddTransient<INhaCungCapBusiness, NhaCungCapBusiness>();
builder.Services.AddTransient<IThuongHieuRepository, ThuongHieuRepository>();
builder.Services.AddTransient<IThuongHieuBusiness, ThuongHieuBusiness>();
builder.Services.AddTransient<ITheLoaiRepository, TheLoaiRepository>();
builder.Services.AddTransient<ITheLoaiBusiness, TheLoaiBusiness>();
builder.Services.AddTransient<ILoaiTaiKhoanRepository, LoaiTaiKhoanRepository>();
builder.Services.AddTransient<ILoaiTaiKhoanBusiness, LoaiTaiKhoanBusiness>();
builder.Services.AddTransient<ITaiKhoanRepository, TaiKhoanRepository>();
builder.Services.AddTransient<ITaiKhoanBusiness, TaiKhoanBusiness>();
builder.Services.AddTransient<ISanPhamRepository, SanPhamRepository>();
builder.Services.AddTransient<ISanPhamBusiness, SanPhamBusiness>();
builder.Services.AddTransient<IHoaDonBanRepository, HoaDonBanRepository>();
builder.Services.AddTransient<IHoaDonBanBusiness, HoaDonBanBusiness>();
builder.Services.AddTransient<IHoaDonNhapRepository, HoaDonNhapRepository>();
builder.Services.AddTransient<IHoaDonNhapBusiness, HoaDonNhapBusiness>();
builder.Services.AddTransient<IGioHangRepository, GioHangRepository>();
builder.Services.AddTransient<IGioHangBusiness, GiohangBusiness>();
builder.Services.AddTransient<ITinTucRepository, TinTucRepository>();
builder.Services.AddTransient<ITinTucBusiness, TinTucBusiness>();
builder.Services.AddTransient<IMaGiamGiaRespository, MaGiamGiaRespository>();
builder.Services.AddTransient<IMaGiamGiaBusiness, MaGiamGiaBusiness>();


// Add services to the container.


// configure strongly typed settings objects
IConfiguration configuration = builder.Configuration;
var appSettingsSection = configuration.GetSection("AppSettings");
builder.Services.Configure<AppSettings>(appSettingsSection);

// configure jwt authentication
var appSettings = appSettingsSection.Get<AppSettings>();
var key = Encoding.ASCII.GetBytes("Khao bi mat cua ban");
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors("AllowAll");
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
