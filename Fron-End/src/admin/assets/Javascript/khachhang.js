myAdmin.controller('khachhangCtrl', function ($scope,$http) {
    // Khởi tạo

    $scope.maTH=1;
    $scope.tenThuongHieu=null;
    $scope.moTa=null;
    $scope.hinhAnh=null;
    $scope.listTH={}
    $scope.addTHShow=false;
    
    $scope.screen_shadow=false;
    $scope.objThuongHieu={
        maTH:$scope.maTH,
        tenThuongHieu:$scope.tenThuongHieu,
        moTa: $scope.moTa,
        hinhAnh: $scope.hinhAnh
      },
    
      $scope.exitForm=()=>{
        $scope.screen_shadow=false;
        $scope.addTHShow=false;
        $scope.editTHShow=false;
        $scope.maTH=1;
        $scope.tenThuongHieu=null;
        $scope.moTa=null;
        $scope.hinhAnh=null;
      }
        
      


    $scope.showAddTH=()=>{
        $scope.addTHShow=true;
        $scope.screen_shadow=true;

    }
    $scope.reloadData=()=>        
        $scope.objThuongHieu={
            maTH:$scope.maTH,
            tenThuongHieu:$scope.tenThuongHieu,
            moTa: $scope.moTa,
            hinhAnh: $scope.hinhAnh
          }
    angular.element(document.querySelector('#fileInput')).on('change', function(e) {
            // Lấy tệp đã chọn
            var selectedFile = e.target.files[0];
            // Kiểm tra xem tệp đã chọn có tồn tại không
            if (selectedFile) {
                $scope.hinhAnh = selectedFile.name; // Cập nhật biến $scope.selectedFileName với tên tệp đã chọn
            } else {
                $scope.hinhAnh = ''; // Nếu không có tệp được chọn, đặt biến $scope.selectedFileName về rỗng
            }
    
            $scope.$apply(); // Áp dụng các thay đổi vào phạm vi AngularJS
        });
          
    
    $scope.getThuongHieu = () => {
        $http({
              method: "GET",
              url: "https://localhost:44334/getALL_ThuongHieu"
          }).then((response)=>{
             $scope.listTH=response.data;
          }).catch((error)=>{
             console.log("Lỗi : "+error)})
            }

    $scope.getThuongHieu();


    $scope.addTH=()=>{
        console.log($scope.hinhAnh);
        $scope.reloadData();
        console.log($scope.objThuongHieu);
        $http({
            method: "POST",
            url: "https://localhost:44334/Create_ThuongHieu",
            data:$scope.objThuongHieu
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getThuongHieu();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }  

    $scope.deleteTH = (x) => {              
        if (confirm("Bạn có chắc chắn muốn xóa")) {
            $http({
                method: "DELETE",
                url: 'https://localhost:44334/Delete_ThuongHieu_byID/' + x.maTH
            }).then((result) => {
                alert("Thông báo: " + result.data);
                $scope.getThuongHieu();
            }).catch((error) => {
                alert("Thông báo: " + error);
            });
        } else {
            // Người dùng đã nhấn nút "Cancel", không thực hiện hành động xóa
            console.log("Hành động xóa đã bị hủy bỏ.");
        }
    }     
    $scope.showeditSP=(x)=>{
        $scope.screen_shadow=true;
        $scope.editTHShow=true;
        $scope.maTH=x.maTH;
        $scope.tenThuongHieu=x.tenThuongHieu;
        $scope.moTa=x.moTa;
        $scope.hinhAnh=x.hinhAnh; 
       
        
       
    }
    angular.element(document.querySelector('#fileInputedit')).on('change', function(e) {
        // Lấy tệp đã chọn
        var selectedFile = e.target.files[0];
        // Kiểm tra xem tệp đã chọn có tồn tại không
        if (selectedFile) {
            $scope.hinhAnh = selectedFile.name; // Cập nhật biến $scope.selectedFileName với tên tệp đã chọn
        } else {
            $scope.hinhAnh = ''; // Nếu không có tệp được chọn, đặt biến $scope.selectedFileName về rỗng
        }

        $scope.$apply(); // Áp dụng các thay đổi vào phạm vi AngularJS
    });

    $scope.editTH=()=>{
        
        console.log($scope.objThuongHieu);
        $scope.reloadData();
        $http({
            method: "PUT",
            url: "https://localhost:44334/Update_ThuongHieu",
            data:$scope.objThuongHieu
        }).then((response)=>{
          alert("Thông báo :"+response.data);
          $scope.getThuongHieu();
        }).catch((error)=>{
           alert("Lỗi : "+error)})
    }
})
    
























