// trang thông tin sp
var i=-1;
var imgs=["../Ảnh/Chi Tiết SP/anh1.jpg","../Ảnh/Chi Tiết SP/anh2.jpg","../Ảnh/Chi Tiết SP/anh3.jpg"];
function chuyenleft() {
    if(i<=0){i=imgs.length-1}
    else{
        i--;
    }
    document.querySelector(".imagesp").src=imgs[i];

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

function chuyenright() {
    if(i==imgs.length-1){i=0}
    else{
        i++;
    }
    document.querySelector(".imagesp").src=imgs[i];

}
var VND = document.querySelector(".giatien");
var vndtg=parseFloat(VND.innerText).toLocaleString('de-DE')
VND.innerText=vndtg;

//lấy dữ liệu từ click sản  phẩm ở trang chủ
var imglinktt=localStorage.getItem('linkimgtt');
var Tensptt=localStorage.getItem('tensptt');
var Giasptt=localStorage.getItem('giasptt');
document.querySelector(".imagesp").src=imglinktt;
document.querySelector(".content1").innerText=Tensptt;
document.querySelector(".giatien").innerText=Giasptt;



// //////
// Khởi tạo list sản phẩm toàn cục
var listsps=[]

if(localStorage.getItem('listspcha')==null)
{
    var listsps=[]
    localStorage.setItem('listspcha',JSON.stringify(listsps))
    
}
function Muangay()
{
    window.location.href="giohang.html"
    ThemvaoGH()
    alert('Bạn sẽ được chuyển tiếp đến trang đặt hàng')
}


// Truyền dữ liệu vào bộ nhớ localStorage
function ThemvaoGH() {
   // Lấy thông tin sản phẩm
   var slgh=document.querySelector('.sldh');
   slgh.innerText=parseInt(slgh.innerText)+1;   
   var imgSP = document.querySelector(".imagesp").src;
   var Tensp = document.querySelector(".content1").innerText;
   var GiaSP = document.querySelector(".giatien").innerHTML;
   var objectSP={
    imgSPx:imgSP,
    Tenspx:Tensp,
    GiaSPx:GiaSP}    
    var ListSP=JSON.parse(localStorage.getItem('listspcha'));
    ListSP.push(objectSP)
    localStorage.setItem('listspcha',JSON.stringify(ListSP))
   
   
   // Lưu thông tin sản phẩm vào local storage
   localStorage.setItem("slgh",slgh.innerText)
   // Chuyển đến trang giỏ hàng
   alert("Thêm sản phẩm thành công")
 
}
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





