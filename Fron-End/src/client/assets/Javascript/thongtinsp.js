
myApp.controller("thongtinspCtrl",function($scope,$http)
{
    
    $scope.objSP=JSON.parse(localStorage.getItem("objSP"))
    console.log($scope.objSP)
    
    $scope.clickProductx=function(objSP)
    {
      localStorage.removeItem("objSP")
      if(objSP)
      {
        localStorage.setItem("objSP",JSON.stringify(objSP))   
           
      }     
      location.reload();
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
        
    }
    $scope.getSanPham_TuongTu = function () {
        $http({
            method: 'POST',
            url: 'http://localhost:8888/customer/SanPham/search_SP',
            data: {
                page:1,
                pageSize:12,
                maTheLoai:$scope.objSP.maLoai,
                maThuongHieu:$scope.maTH
            } // Send the search parameters as the request body
        }).then(function (response) {
            $scope.listSP= response.data.data;          
            $scope.totalItems = response.data.totalItems;                   
           
        }).catch(function (error) {
            console.error('Lỗi:', error);
        });
        
        
    };
    $scope.getSanPham_TuongTu();
    $scope.add_toCart=function(x)
    {
        if($scope.user_Customer)
        {
            $http(
                {
                    method:"POST",
                    url:"https://localhost:44329/api/GioHang/add_toCart",
                    data:{
                        "maGH": 0,
                        "maSP": x.maSP,
                        "tenSP": x.tenMH,
                        "anhSP": x.image_SP,
                        "soluong": 0,
                        "giaban": x.giaBan,
                        "tongtien": 0,
                        "taiKhoan": $scope.user_Customer.taikhoan
                      }
                }
            ).then(function()
                {
                    alert("Đã thêm vào giỏ hàng")
                    $scope.getAll_Cart()
                })
        }
       else{
        alert("Hãy đăng nhập để sử dụng chức năng này !")
       }
        
    }
    $scope.muangay=function(x)
    {
        if($scope.user_Customer)
        {
            $http(
                {
                    method:"POST",
                    url:"https://localhost:44329/api/GioHang/add_toCart",
                    data:{
                        "maGH": 0,
                        "maSP": x.maSP,
                        "tenSP": x.tenMH,
                        "anhSP": x.image_SP,
                        "soluong": 0,
                        "giaban": x.giaBan,
                        "tongtien": 0,
                        "taiKhoan": $scope.user_Customer.taikhoan
                      }
                }
            ).then(function()
                {
                    alert("Bạn sẽ được chuyển hàng sang trang mua hàng hãy nhấn Ok !")
                    location.href="#!giohang"
                    $scope.getAll_Cart()
                })
        }
       else{
        alert("Hãy đăng nhập để sử dụng chức năng này !")
       }
    }
})





