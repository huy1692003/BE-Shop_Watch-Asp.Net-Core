using BUS.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BUS.Interface;
using DAL;
using Data_Model;
using DAL.Interface;
using static System.Net.Mime.MediaTypeNames;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.Extensions.Configuration;

namespace BUS
{
    public class TaiKhoanBusiness : ITaiKhoanBusiness
    {
        private ITaiKhoanRepository tk_Dal;
        private string secret;
        public TaiKhoanBusiness(ITaiKhoanRepository tk_Dal,IConfiguration configuration)
        {
            this.tk_Dal = tk_Dal;
            secret = configuration["AppSettings:Secret"];
           
        }

        public TaiKhoans Login(string username, string password, int role)
        {

            var user = tk_Dal.Login(username, password,role);
            if (user == null)
                return null;
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.TenTaiKhoan.ToString()),
                    new Claim(ClaimTypes.Email, user.Email)
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            user.Token = tokenHandler.WriteToken(token);
            return user;
        }
        public bool Create_TaiKhoan(string username, string password,int ltk)
        {
            
                return tk_Dal.Create_TaiKhoan(username, password, ltk);
          
        }
        public bool Update_TaiKhoan(TaiKhoans tk)
        {
            if (tk_Dal.Update_TaiKhoan(tk))
            {
                return true;
            }
            return false;
        }
        public bool Delete_TaiKhoan(string tentk)
        {
            if (tk_Dal.Delete_TaiKhoan(tentk))
            {
                return true;
            }
            return false;
        }
        public bool DoiMatKhau(string username, string new_Password)
        {
            if (tk_Dal.DoiMatKhau(username,new_Password))
            {
                return true;
            }
            return false;
        }    
        public TaiKhoans GetInfo_User(string username)
        {
            if (tk_Dal.GetInfo_User(username)==null)
            {
                return null;
            }
            return tk_Dal.GetInfo_User(username);
        }
    }

}
