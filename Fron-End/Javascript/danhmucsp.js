var x=document.querySelector('.xemthems');
x.style.display="none"

function xemthemsp(a)
{
  if(document.querySelector('.xemthems').style.display=="none")
  {
    document.querySelector('.xemthems').style.display="block";
   
    a.innerText="Ẩn Bớt"
  }
  else{
    document.querySelector('.xemthems').style.display="none"
    a.innerText='Xem Thêm'
  } 
  
   
 
}
if(localStorage.getItem('slgh')===null)
{
localStorage.setItem('slgh',0)
}
function slgh()
{
var slgh=localStorage.getItem('slgh');
document.querySelector('.sldh').innerText=slgh;
}
slgh();

// chuyển giá tiền sang định dạng 000.000.00
var a=document.querySelectorAll('.gia')
for (var x of a) {
  x.innerText=parseFloat(x.innerText).toLocaleString("de-DE")+"đ"
}

// Lấy dữ liệu gửi lên bộ nhớ web khi người dùng click vào 1 sản phẩm
function laydulieu(x)
{
  var nodecha=x.parentElement.parentElement;
  var linkimg=x.src;
  var tensp=nodecha.children[1].innerText;
  var giasp=nodecha.children[2].children[0].innerText;
  localStorage.setItem("linkimgtt",linkimg)
  localStorage.setItem("tensptt",tensp)
  localStorage.setItem("giasptt",giasp)

}
