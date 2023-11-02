var myAdmin=angular.module("myAdmin",['ngRoute'])
myAdmin.controller("homeCtrl",($scope,$location)=>{
   var currentDate = new Date();
   var daysOfWeek = ['Chủ nhật', 'Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy'];
   var dayOfWeek = daysOfWeek[currentDate.getUTCDay()]; 
   // Lấy ngày
   var dayOfMonth = currentDate.getUTCDate(); 
   // Lấy tháng
   var monthNames = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
   var month = monthNames[currentDate.getUTCMonth()]; 
   // Lấy năm
   var year = currentDate.getUTCFullYear(); 
   // Gán vào biến time
   $scope.timenow = `${dayOfWeek}, ${dayOfMonth} ${month} ${year}`;
 

  
});
//////Tạo config để load trang khác
myAdmin.config(($routeProvider)=>{
$routeProvider.when('/thongke', {
         templateUrl: 'thongke.html',
         controller: 'thongkeCtrl'
     }).when('/sanpham',{
         templateUrl:"sanpham.html",
         controller:'sanphamCtrl'
      })
      .when('/theloai',{
         templateUrl:"theloai.html",
         controller:'theloaiCtrl'
      })
      .when('/thuonghieu',{
         templateUrl:"thuonghieu.html",
         controller:'thuonghieuCtrl'
      })
      .when('/nhacungcap',{
         templateUrl:"nhacungcap.html",
         controller:'nhacungcapCtrl'
      })
      .when('/loaitaikhoan',{
         templateUrl:"loaitaikhoan.html",
         controller:'loaitaikhoanCtrl'
      })
      .when('/hoadonban',{
         templateUrl:"hoadonban.html",
         controller:'hoadonbanCtrl'
      })
      .when('/hoadonnhap',{
         templateUrl:"hoadonnhap.html",
         controller:'hoadonnhapCtrl'
      }).otherwise({ redirectTo: '/thongke' }); // Đặt trang chính là '/'

     
})

// chuyển trang



function check_activePage(a)
{  
document.querySelectorAll('.check_color').forEach(x=>x.style.color='white')
a.style.color='blue'
   
}

function resetForm(a)
{
  a.reset()
}

