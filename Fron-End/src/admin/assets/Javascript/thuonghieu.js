myAdmin.controller('thuonghieuCtrl', function ($scope,$http) {
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
        var fileInput = document.getElementById('fileInput1');
        var file = fileInput.files[0];        
        if (!file) {
            alert('Vui lòng chọn ảnh!');
            
        }   
        else
        {
            var formData = new FormData();
            formData.append('file', file);
            $http({
                method: 'POST',
                url: 'https://localhost:44334/api/UploadFile/upload',
                data: formData,
                headers: { 'Content-Type': undefined }
            })
            .then(function (response) 
            {
                 $scope.hinhAnh = '/image' + response.data.filePath;
                 console.log($scope.hinhAnh)
                 $scope.reloadData();       
                 $http({
                     method: "POST",
                     url: "https://localhost:44334/Create_ThuongHieu",
                     data:$scope.objThuongHieu
                 }).then((response)=>{
                   alert("Thông báo :"+response.data);
                   $scope.getThuongHieu();
                 }).catch((error)=>{
                    alert("Lỗi : "+error)})                
                 
            })     
         
         };
       
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
   

    $scope.editTH=()=>{
        var fileInput = document.getElementById('fileInput2');
        var file = fileInput.files[0];        
        if (!file) {
            alert('Vui lòng chọn ảnh!');
            
        }   
        else
        {
            var formData = new FormData();
            formData.append('file', file);
            $http({
                method: 'POST',
                url: 'https://localhost:44334/api/UploadFile/upload',
                data: formData,
                headers: { 'Content-Type': undefined }
            })
            .then(function (response) 
            {
                 $scope.hinhAnh = '/image' + response.data.filePath;
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
                 
            })     
         
         };
       
       
      
    }
})
    
























