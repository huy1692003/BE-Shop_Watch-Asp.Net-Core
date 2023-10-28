myAdmin.controller('khachhangCtrl', function ($scope,$http) {
    // Khởi tạo

    $scope.maKH=1;
    $scope.tenKhachHang=null;
    $scope.diaChi=null;
    $scope.ngaysinh=null;
    $scope.dienThoai=null;
    $scope.listKH={}
    $scope.addKHShow=false;
    
    $scope.screen_shadow=false;
    $scope.objKH={
         maKH: $scope.maKH,
         tenKhachHang: $scope.tenKhachHang,
         diaChi : $scope.diaChi,
         dienThoai:$scope.dienThoai,
         ngaysinh: $scope.ngaysinh
      },
    
    $scope.exitForm=()=>
    {
        $scope.screen_shadow=false;
        $scope.addNCCShow=false;
        $scope.editNCCShow=false;
        $scope.maKH=1;
        $scope.tenKhachHang=null;
        $scope.diaChi=null;
        $scope.ngaysinh=null;
        $scope.dienThoai=null;
    }  
    $scope.showAddKH=()=>{
        $scope.addKHShow=true;
        $scope.screen_shadow=true;

    }
    $scope.reloadData=()=>{    
        $scope.objKH={
            maKH: $scope.maKH,
            tenKhachHang: $scope.tenKhachHang,
            diaChi : $scope.diaChi,
            dienThoai:$scope.dienThoai,
            ngaysinh: $scope.ngaysinh
         }       
    }
   
   $scope.getKHs = () => {
        $http({
              method: "GET",
              url: "https://localhost:44334/api/KhachHang/get-AllKH"
          }).then((response)=>{
             $scope.listKH=response.data;
          }).catch((error)=>{
             console.log("Lỗi : "+error)})
            }

    $scope.getKHs();


    $scope.addNCC=()=>{
      
        console.log($scope.objNCC);
        $scope.reloadData();
        $http({
            method: "POST",
            url: "https://localhost:44334/api/NhaCungCap/Create_NhaCungCap",
            data:$scope.objNCC
        }).then((response)=>{
           alert("Thông báo :"+response.data);
           $scope.getNCCs();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }  

    $scope.deleteNCC = (x) => {              
        if (confirm("Bạn có chắc chắn muốn xóa")) {
            $http({
                method: "DELETE",
                url: 'https://localhost:44334/api/NhaCungCap/Delete_NhaCungCap/' + x.maNCC
            }).then((result) => {
                alert("Thông báo: " + result.data);
                $scope.getNCCs();
            }).catch((error) => {
                alert("Thông báo: " + error);
            });
        } else {
            // Người dùng đã nhấn nút "Cancel", không thực hiện hành động xóa
            alert("Hành động xóa đã bị hủy bỏ.");
        }
    }     
    $scope.showeditNCC=(x)=>{
        $scope.screen_shadow=true;
        $scope.editNCCShow=true;
        $scope.maNCC=x.maNCC;
        $scope.tenNCC=x.tenNCC;
        $scope.diaChi=x.diaChi;
        $scope.email=x.email;
        $scope.soDienThoai=x.soDienThoai;
        console.log($scope.soDienThoai)
       
        
       
    }
   

    $scope.editNCC=()=>{
        
        console.log($scope.objNCC);
        $scope.reloadData();
        $http({
            method: "PUT",
            url: "https://localhost:44334/api/NhaCungCap/Update_NhaCungCap",
            data:$scope.objNCC
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getNCCs();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }
})
    
























