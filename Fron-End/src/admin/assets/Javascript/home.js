var myAdmin=angular.module("myAdmin",['ngRoute'])
myAdmin.controller("homeCtrl",($scope,$location)=>{
   $scope.user=JSON.parse(localStorage.getItem("user_admin"))
   console.log($scope.user)
   if(!$scope.user)
   {
      location.href='./login.html'
   }
   $scope.clickSetting=function()
   {
      $scope.showSetting=$scope.showSetting==false?true:false;
      console.log($scope.showSetting)
   }
   $scope.logout=function()
   {
      var check=confirm("Bạn có chắc chắn muốn đăng xuất không ?")
      if(check)
      {
      $scope.user=null;
      localStorage.removeItem("user")
      location.href='./login.html'
      }
   }
   

  
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




function resetForm(a)
{
  a.reset()
}

