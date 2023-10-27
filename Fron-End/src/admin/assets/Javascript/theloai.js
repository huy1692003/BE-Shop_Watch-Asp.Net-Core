myAdmin.controller('theloaiCtrl', function ($scope,$http) {
    // Khởi tạo

    $scope.maLoai=1;
    $scope.tenLoai;
    $scope.ghiChu;
  
    $scope.listTL={};
    $scope.addTLShow=false;
    $scope.screen_shadow=false;
    $scope.editTLShow=false;
   
    $scope.objTheloai={
        maLoai:$scope.maLoai,
        tenLoai:$scope.tenLoai,
        ghichu: $scope.ghiChu
     
      },
    
      $scope.exitForm=()=>{
        $scope.screen_shadow=false;
        $scope.addTLShow=false;
        $scope.editTLShow=false;
        $scope.maLoai=1;
        $scope.tenLoai=null;
        $scope.ghichu=null;
        
      }
        
      


    $scope.showAddTL=()=>{
        $scope.addTLShow=true;
        $scope.screen_shadow=true;

    }
    $scope.reloadData=()=>        
        $scope.objTheLoai={
            maLoai:$scope.maLoai,
            tenLoai:$scope.tenLoai,
            ghichu: $scope.ghiChu
            
          }
 
    $scope.getTheLoais = () => {
        $http({
              method: "GET",
              url: "https://localhost:44334/api/TheLoai/GetAll_TheLoai"
          }).then((response)=>{
             $scope.listTL=response.data;
          }).catch((error)=>{
             console.log("Lỗi : "+error)})
            }

    $scope.getTheLoais();


    $scope.addTL=()=>{       
        $scope.reloadData();
        console.log($scope.objTheLoai);
        $http({
            method: "POST",
            url: "https://localhost:44334/api/TheLoai/Create_TheLoai",
            data:$scope.objTheLoai
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getTheLoais();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }  

    $scope.deleteTL = (x) => {   
        console.log(x)           
        if (confirm("Bạn có chắc chắn muốn xóa")) {
            $http({
                method: "DELETE",
                url: 'https://localhost:44334/api/TheLoai/Delete_TheLoai/' + x.maLoai
            }).then((result) => {
                alert("Thông báo: " + result.data);
                $scope.getTheLoais();
            }).catch((error) => {
                alert("Thông báo: " + error);
            });
        } else {
            // Người dùng đã nhấn nút "Cancel", không thực hiện hành động xóa
            console.log("Hành động xóa đã bị hủy bỏ.");
        }
    }     
    $scope.showeditTL=(x)=>{
        $scope.screen_shadow=true;
        $scope.editTLShow=true;
        $scope.maLoai=x.maLoai;
        $scope.tenLoai=x.tenLoai;
        $scope.ghiChu=x.ghichu;
     
        
       
    }
   
    $scope.editTL=()=>{
        
        
        $scope.reloadData();
        console.log($scope.objTheLoai);
        $http({
            method: "PUT",
            url: "https://localhost:44334/api/TheLoai/Update_TheLoai",
            data:$scope.objTheLoai
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getTheLoais();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }
})
    
























