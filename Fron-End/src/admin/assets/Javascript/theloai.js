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
              url: "http://localhost:8888/TheLoai/GetAll_TheLoai",
              headers: { "Authorization": 'Bearer ' + $scope.user.token }
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
            url: "http://localhost:8888/TheLoai/Create_TheLoai",
            headers: { "Authorization": 'Bearer ' + $scope.user.token },
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
                url: 'http://localhost:8888/TheLoai/Delete_TheLoai/' + x.maLoai,
                headers: { "Authorization": 'Bearer ' + $scope.user.token }
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
            url: "http://localhost:8888/TheLoai/Update_TheLoai",
            headers: { "Authorization": 'Bearer ' + $scope.user.token },
            data:$scope.objTheLoai
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getTheLoais();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }
})
    
























