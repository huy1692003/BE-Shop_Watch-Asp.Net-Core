var getlistSPx=document.querySelectorAll('#listsp .sanpham');
 var values=document.getElementById('giohangtrong');
 

function testgiohang(getlistSP){
if(getlistSP.length==0)
{
    values.style.display='block';
    document.querySelector('.tinhtien').style.display='none';
    
}

else{
    values.style.display='none';
    document.querySelector('.tinhtien').style.display='block';
    
    
}
}
testgiohang(getlistSPx)


function deletesp(x)
{     
    x.parentElement.remove();
    testgiohang(document.querySelectorAll('#listsp .sanpham'));
    localStorage.setItem('slgh',parseInt(localStorage.getItem('slgh'))-1);
    slgh();
    tinhtong();
    var giohang=JSON.parse(localStorage.getItem('listspcha'));    
    var i=giohang.findIndex(sanphamm=>sanphamm.Tenspx==x.parentElement.children[0].innerText)
    giohang.splice(i,1)    
    localStorage.setItem('listspcha',JSON.stringify(giohang))
    console.log(localStorage.getItem('listspcha'))

}
// lấy dữ liệu từ localstoge
function slgh()
{
var slgh=localStorage.getItem('slgh');
document.querySelector('.sldh').innerText=slgh;
}
slgh();




// tạo một sản phẩm

function addsp() {
  
// 
var giohang=JSON.parse(localStorage.getItem('listspcha'));


    var listsp=document.getElementById('listsp');
    for(var i=0;i<giohang.length;i++)
    { var sanphamy=document.createElement("div")
      sanphamy.className="sanpham"
      sanphamy.innerHTML=`<p class="tensp">${giohang[i].Tenspx}</p>`+
                      `<p>Số lượng:<input type="text" value="1" maxlength="4" style="width: 27px;text-align: center;margin-left: 10px;margin-right:10px" class="soluongsp"> x <span id="giatrii">${giohang[i].GiaSPx}</span>đ</p>` +                 
                      `<img class="anhsp" src="${giohang[i].imgSPx}" alt="error">`+
                      `<button class="deletesp"onclick="deletesp(this)"><img src="../Ảnh/Icon/deletesp.png" alt=""></button>`
                       listsp.appendChild(sanphamy); 
     
    }
    
    tinhtong()
    testgiohang(document.querySelectorAll('#listsp .sanpham')); 
}
if(localStorage.getItem('listspcha')!=null&&localStorage.getItem('slgh')!=0){
    addsp()
}



// 
setInterval(() => {
    tinhtong();
}, 1000);
function tinhtong()

{  var sum=0;
    var ok= document.querySelectorAll('#listsp .sanpham')
   if(ok.length!=0){
    var sanphamxx=document.querySelectorAll(".sanpham");
    for (var x of sanphamxx) {
    //    
   var parseINT= parseInt((x.children[1].children[1].innerText).replace(/\./g, ""))
   sum+= ((x.children[1].children[0].value)*parseINT)
   document.getElementById('sotien').innerText=sum.toLocaleString('de-DE');
     }
    }
     
}
if(localStorage.getItem('slgh')===null)
{
localStorage.setItem('slgh',0)
}
// tính tổng

tinhtong();
function ktradathang()
{
  var inputs= document.querySelectorAll('.textinput');
  var testtt=true;
  for (var x of inputs)
   {
    if(x.value=="")
    {
        testtt=false
        
    }
    
  }
  if(!testtt){alert("Bạn không được để các ô dữ liệu trống")}
  else{
    alert("Đặt hàng thành công")
  }
}
// 



