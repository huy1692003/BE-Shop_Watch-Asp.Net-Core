using DAL;
using DAL.Interface;
using DataAccessLayer;
using BUS;
using BUS.Interface;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});
// Add services to the container.
builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();
builder.Services.AddTransient<IKhachHangRepository, KhachHangRepository>();
builder.Services.AddTransient<IKhachHangBusiness, KhachHangBusiness>();
builder.Services.AddTransient<INhaCungCapRepository, NhaCungCapRepository>();
builder.Services.AddTransient<INhaCungCapBusiness, NhaCungCapBusiness>();
builder.Services.AddTransient<IThuongHieuRepository, ThuongHieuRepository>();
builder.Services.AddTransient<IThuongHieuBusiness, ThuongHieuBusiness>();
builder.Services.AddTransient<ITheLoaiRepository, TheLoaiRepository>();
builder.Services.AddTransient<ITheLoaiBusiness, TheLoaiBusiness>();
builder.Services.AddTransient<ILoaiTaiKhoanRepository, LoaiTaiKhoanRepository>();
builder.Services.AddTransient<ILoaiTaiKhoanBusiness, LoaiTaiKhoanBusiness>();
builder.Services.AddTransient<ITaiKhoanRepository,TaiKhoanRepository>();
builder.Services.AddTransient<ITaiKhoanBusiness,TaiKhoanBusiness>();
builder.Services.AddTransient<ISanPhamRepository, SanPhamRepository>();
builder.Services.AddTransient<ISanPhamBusiness, SanPhamBusiness>();
builder.Services.AddTransient<IHoaDonBanRepository, HoaDonBanRepository>();
builder.Services.AddTransient<IHoaDonBanBusiness, HoaDonBanBusiness>();




// Add services to the container.

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

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
