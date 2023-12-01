myAdmin.controller('loaitaikhoanCtrl', function ($scope,$http) {
    // Khởi tạo

    $scope.maLoai=1;
    $scope.tenLoai;
    $scope.mota;
  
    $scope.listLTK={};
    $scope.addLTKShow=false;
    $scope.screen_shadow=false;
    $scope.editLTKShow=false;
   
    $scope.objLoaiTK={
        maLoaiTaiKhoan:$scope.maLoai,
        tenLoai:$scope.tenLoai,
        mota: $scope.mota
     
      },
    
      $scope.exitForm=()=>{
        $scope.screen_shadow=false;
        $scope.addLTKShow=false;
        $scope.editLTKShow=false;
        $scope.maLoai=1;
        $scope.tenLoai=null;
        $scope.mota=null;
        
      }
        
      


    $scope.showAddLTK=()=>{
        $scope.addLTKShow=true;
        $scope.screen_shadow=true;

    }
    $scope.reloadData=()=>        
        $scope.objLoaiTK={
            maLoaiTaiKhoan:$scope.maLoai,
            tenLoai:$scope.tenLoai,
            mota: $scope.mota
            
          }
 
    $scope.getLoaiTKs = () => {
        $http({
              method: "GET",
              url: "http://localhost:8888/LTK/GetAll_LoaiTK"
          }).then((response)=>{
             $scope.listLTK=response.data;
          }).catch((error)=>{
             console.log("Lỗi : "+error)})
            }

    $scope.getLoaiTKs();


    $scope.addLTK=()=>{       
        $scope.reloadData();
        console.log($scope.objLoaiTK);
        $http({
            method: "POST",
            url: "http://localhost:8888/LTK/Create_LoaiTaiKhoan",
            data:$scope.objLoaiTK
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getLoaiTKs();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }  

    $scope.deleteLTK = (x) => {   
        console.log(x)           
        if (confirm("Bạn có chắc chắn muốn xóa")) {
            $http({
                method: "DELETE",
                url: 'http://localhost:8888/LTK/Delete_LoaiTK/' + x.maLoaiTaiKhoan
            }).then((result) => {
                alert("Thông báo: " + result.data);
                $scope.getLoaiTKs();
            }).catch((error) => {
                alert("Thông báo: " + error);
            });
        } else {
            // Người dùng đã nhấn nút "Cancel", không thực hiện hành động xóa
            console.log("Hành động xóa đã bị hủy bỏ.");
        }
    }     
    $scope.showeditLTK=(x)=>{
        $scope.screen_shadow=true;
        $scope.editLTKShow=true;        
        $scope.maLoai=x.maLoaiTaiKhoan;
        $scope.tenLoai=x.tenLoai;
        $scope.mota=x.mota;
     
        
       
    }
   
    $scope.editLTK=()=>{
        
        
        $scope.reloadData();
        console.log($scope.objLoaiTK);
        $http({
            method: "PUT",
            url: "http://localhost:8888/LTK/Update_LoaiTK",
            data:$scope.objLoaiTK
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getLoaiTKs();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }
})
    
























