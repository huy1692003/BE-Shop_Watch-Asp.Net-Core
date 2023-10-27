// Hiệu Ứng CHuyển Ảnh
var imgs=['Ảnh/banner1.webp','Ảnh/banner2.jpg','Ảnh/banner3.png']
var i=1
setInterval(() => {
  
  if(i===imgs.length){i=0}
  document.querySelector('.banner>img').src=imgs[i]
  i++

   
},3000)
// Hiệu ứng chuyển danh mục sản phẩm
var donghonam={linkhref:"HTML/donghonam.html", linkanh :"Ảnh/donghonam.jpg"}
var donghonu={linkhref:"HTML/donghonu.html", linkanh :"Ảnh/donghonu.jpg"}
var donghodoi={linkhref:"HTML/donghodoi.html", linkanh :"Ảnh/donghodoi.jpg"}
var donghotrangtri={linkhref:"HTML/donghotrangtri.html", linkanh :"Ảnh/donghotrangtri.jpg"}
var listdmsp=[donghonam,donghonu,donghodoi,donghotrangtri]
var sp=0
//  listvitrianh
 var phantu1={classsp:".linkadmsp1",linkimg:".anhdmsp1"}
 var phantu2={classsp:".linkadmsp2",linkimg:".anhdmsp2"}
 var phantu3={classsp:".linkadmsp3",linkimg:".anhdmsp3"}
 var listphantu=[phantu1,phantu2,phantu3]
var j=0;
setInterval(function delayanh()
{ document.querySelector(`${listphantu[j].classsp}`).href=listdmsp[sp].linkhref;
  document.querySelector(`${listphantu[j].linkimg}`).src=listdmsp[sp].linkanh;  
  j++;
  sp++;
  if(j>2){j=0}
  if(sp>3){sp=0}
},1500)
// ...................................
var a=document.querySelectorAll('.gia')
for (var x of a) {
  x.innerText=parseFloat(x.innerText).toLocaleString("de-DE")+"đ"
}
// .....................................



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




//  lấy dữ liệu gửi lên localstorage
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

