var myApp=angular.module("angularjs_module",['ngRoute'])
myApp.controller("indexCtrl",function($scope,$http)
{
  $scope.user_Customer=JSON.parse(localStorage.getItem("user_Customer"))
  $scope.getAll_Cart=function()
  {
    if($scope.user_Customer)
    {
      $http(
        {
          method:"POST",
          url:"https://localhost:44329/api/GioHang/getALLSP_Cart?Tentk="+$scope.user_Customer.taikhoan
        }
      ).then(function(reponse)
      {
        $scope.listSP_Cart=reponse.data
        $scope.sldh=$scope.listSP_Cart.length
        console.log($scope.listSP_Cart)
      })
    }
    else{
      console.log("No user ! ")
    }
 
  }
  $scope.getAll_Cart()
  $scope.clickProduct=function(objSP)
  {
  
    localStorage.removeItem("objSP")
    if(objSP)
    {
      localStorage.setItem("objSP",JSON.stringify(objSP))   
         
    }
    
    
    // Cập nhật lượt xem
    $http(
        {
          method:"POST",
          url:"https://localhost:44329/api/SanPham/update_LuotXem/"+objSP.maSP
        }
      ).then(function(response)
      {
        console.log(response.data)
      })
     location.href="#!thongtinsp"
  }
 
  // Hiển thị đăng nhập nếu ng dùng chưa đăng nhập
 
  console.log($scope.user_Customer)
  if(!$scope.user_Customer)
  {
   
    $scope.showLogin=true;
   
  }
  // Đăng xuất tài khoản
  $scope.logout=function()
  {
    localStorage.removeItem('user_Customer')
    $scope.user_Customer=null;
    $scope.showLogin=true;
  }
  // Lấy thông tin chi tiết tài khoản
  $scope.inforUser_detail=function(user_name)
  {
    $scope.show_myInfor=true
    $http(
      {
        method:"GET",
        url:"https://localhost:44329/api/TaiKhoan/GetInFo_TaiKhoan?username="+user_name
      }
    ).then(function(reponse)
    {
      console.log(reponse.data)
      $scope.hoten=reponse.data.hoTen
      $scope.diachi=reponse.data.diaChi
      $scope.email=reponse.data.email
      $scope.sdt=reponse.data.soDienThoai
      $scope.anhdaidien=reponse.data.anhDaiDien
    })
  }

  // cập nhật thông tin tài khoản
  $scope.update_infor_user=function(user_name)
  {
     var avatar=document.getElementById("fileImage")
     var file_Img=avatar.files[0]
     console.log(file_Img)
     if(file_Img)
     {
      var formdata=new FormData()
      formdata.append('file',file_Img)
        $http(
          {
            method:"POST",
            url:"https://localhost:44329/api/UploadFile/upload",
            data:formdata,
            headers:{
              'Content-Type':undefined
            }          

          }
        ).then(function(reponse)
        {
                  $scope.linkImageNew='/image'+reponse.data.filePath
                  $http(
                    {
                      method:"PUT",
                      url:"https://localhost:44329/api/TaiKhoan/Update_TaiKhoan",
                      data:{
                        "tenTaiKhoan": user_name,
                        "matKhau": "string",
                        "email": $scope.email,
                        "maLoaiTaiKhoan": 0,
                        "hoTen": $scope.hoten,
                        "diaChi": $scope.diachi,
                        "soDienThoai": $scope.sdt,
                        "anhDaiDien": $scope.linkImageNew,
                        "token": "string"
                      }
                    }
                  ).then(function(reponse)
                  {
                    alert(reponse.data)
                  }).catch(function(error){alert("Có lỗi r hãy thử lại :(((")})
        })
     }
    //  Nếu ng dùng k chọn ảnh mới thì sẽ lấy ảnh cũ
     else
     {
        $http(
          {
            method:"PUT",
            url:"https://localhost:44329/api/TaiKhoan/Update_TaiKhoan",
            data:{
              "tenTaiKhoan": user_name,
              "matKhau": "string",
              "email": $scope.email,
              "maLoaiTaiKhoan": 0,
              "hoTen": $scope.hoten,
              "diaChi": $scope.diachi,
              "soDienThoai": $scope.sdt,
              "anhDaiDien": $scope.anhdaidien,
              "token": "string"
            }
          }
        ).then(function(reponse)
        {
          alert(reponse.data)
        }).catch(function(error)
        {
          alert("Có lỗi r hãy thử lại :(((")
        })
     }
  }


  // Hàm tìm kiếm sản phẩm
  $scope.txtSearchTenSanPham='', 
  $scope.txtSearchGiaTien='';
  $scope.listSP_Search=[]

  
  $scope.clickSearch=function()
  {
    
    if($scope.txtSearchTenSanPham!=''||$scope.txtSearchGiaTien!='')
    {
    location.href='#!timkiem'   
    }
    else{
      alert("Hãy nhập tên sản phẩm hoặc chọn giá tiền cần tìm !")
    }
  }
  $scope.getThuongHieu = () => {
    $http({
          method: "GET",
          url: "http://localhost:8888/customer/ThuongHieu/getALL_ThuongHieu"
      }).then((response)=>{
         $scope.listTH=response.data;
      }).catch((error)=>{
         console.log("Lỗi : "+error)})
        }

$scope.getThuongHieu();
$scope.searchProduct_TH=function(th)
{
  localStorage.setItem('search_TH',JSON.stringify(th))
  location.href='#!thuonghieu'
 

}

// Lấy danh sách danh mục sản phẩm
$scope.getAll_TheLoaiSP=function()
{
  $http(
    {
      method:"GET",
      url:"http://localhost:8888/customer/TheLoai/getALL_TheLoai"
    }
  ).then(function(reponse)
  {
    $scope.listTheLoai=reponse.data
    console.log($scope.listTheLoai)
  })
}
$scope.getAll_TheLoaiSP()

// searchDanhMuc
$scope.search_Danhmuc=function(theloai)
{
localStorage.setItem('searchTheloai',JSON.stringify(theloai))
window.location.href='#!danhmucsp'
}


// Hiển thị form đơn hàng
$scope.show_donhang=function()
{
  $scope.show_qldh=$scope.show_qldh==true?false:true
  $scope.getDonHang("Chưa xác nhận")
}

$scope.getDonHang=function(state)
{
  var trangthai = {
    'Chưa xác nhận': 0,
    'Đã xử lý': 1,
    'Đã hủy': 2 };
   var set_trangthai=trangthai[state];
   $scope.showHuydon=set_trangthai===2?false:true
   
      $http(
        {
          method:"POST",
          url:"http://localhost:8888/customer/DonHang/get_HDB",
          data:{
            "tentaikhoan":$scope.user_Customer.taikhoan,
            "trangthai":set_trangthai
          }
        }
      ).then(function(reponse)
      {
        $scope.listDH=reponse.data.data
        console.log("list don hàng")
        console.log($scope.listDH)
      }).catch(function(error)
      {
        console.log(error.data)
      })

}

// Cập nhật trạng thái đơn hàng
$scope.huydonhang=function(maHD)
{
  var check=confirm("Bạn có chắc muốn hủy đơn hàng này không ?")
  if(check)
  {
    $http(
      {
        method:"POST",
        url:"http://localhost:8888/customer/DonHang/update_statusHDB"+ maHD +','+2
      }
    ).then(function(reponse)
    {
      alert("Hủy thành công đơn hàng !")
    })
  }
 
}






})



myApp.config(($routeProvider)=>{
  $routeProvider.when('/trangchu', {
           templateUrl: 'trangchu.html',
           controller: 'trangchuCtrl'      
        }).when(
          '/thongtinsp',
          {
            templateUrl:'thongtinsp.html',
            controller:'thongtinspCtrl'
          }
        ).when(
          '/giohang',
          {
            templateUrl:'giohang.html',
            controller:'giohangCtrl'
          }
        ).when(
          '/timkiem',
          {
            templateUrl:'timkiem.html',
            controller:'timkiemCtrl'
          }
        ).when(
          '/danhmucsp',
          {
            templateUrl:'danhmucsp.html',
            controller:'danhmucspCtrl'
          }
        ).when(
          '/thuonghieu',
          {
            templateUrl:'thuonghieu.html',
            controller:'thuonghieuCtrl'
          }
        ).otherwise({ redirectTo: '/trangchu' }); // Đặt trang chính là '/'
  
       
  })