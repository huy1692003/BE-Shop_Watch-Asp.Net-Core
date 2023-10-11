function checkuser()
{
 var gethienthi= document.querySelector('.hienthiadmin')
 var getlogin= document.querySelector('.login') 
 
 var taikhoan=document.getElementById('taikhoan').value;
 var matkhau=document.getElementById('matkhau').value;
 if(taikhoan===""||matkhau==="")
 {
    alert("Tài khoản hoặc mật khẩu không được bỏ trống")
 }
 else if(taikhoan==="admin"&&matkhau==="123")
 {
    alert("Đăng nhập thành công")
    getlogin.style.display="none"
    gethienthi.style.display="block";

 }
 else{
    alert("Thông tin tài khoản hoặc mật khẩu không chính xác")
 }
}

//

function checkedicon(a)
{  
//   parentElenment :thẻ cha
//   children: thẻ con[thứ i]
   var thecha=a.parentElement;   
   var ul=thecha.children[2]   
   // Tìm kiềm xem trong this có chứa class tên iconchecked ko
   if(a.classList.contains("iconchecked"))
   {
      a.classList.remove('iconchecked')
      ul.style.display="none"     

   }
   else
   {
      a.classList.add("iconchecked")
      ul.style.display="block"
   }
   
   
}
