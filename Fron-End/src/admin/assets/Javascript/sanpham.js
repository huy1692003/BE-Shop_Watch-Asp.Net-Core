myAdmin.controller('sanphamCtrl', function ($scope,$http) {
    // Khởi tạo   
    $scope.page=1;
    $scope.pageSize=8;   
    $scope.listItem = [];
    $scope.totalItems = 0;  
    $scope.objSP={} ,
    $scope.txtSearchTenSanPham='',
    $scope.txtSearchTheloai='',
    $scope.txtSearchThuongHieu='',
    $scope.txtSearchGiaTien='',  

    $scope.clickSearch=()=>{
        $scope.pageafter=false;
        $scope.searchParameters = {
            page: $scope.page,              // Set the initial page value
            pageSize: $scope.pageSize,
            tenSanPham:$scope.txtSearchTenSanPham,
            maThuongHieu:$scope.txtSearchThuongHieu==''?0:$scope.txtSearchThuongHieu,
            maTheLoai:$scope.txtSearchTheloai==''?0:$scope.txtSearchTheloai ,  // Set the initial page size
            giatien: $scope.txtSearchGiaTien
        };   
        $scope.getProducts();       
        
    }
    
    $scope.getProducts = function () {
        $http({
            method: 'POST',
            url: 'http://localhost:8888/SanPham/search_SP',
            headers: { "Authorization": 'Bearer ' + $scope.user.token },
            data: $scope.searchParameters // Send the search parameters as the request body
        }).then(function (response) {
            $scope.listItem = response.data.data;          
            $scope.totalItems = response.data.totalItems;                      
            if($scope.page * $scope.pageSize >= $scope.totalItems||$scope.totalItems<$scope.pageSize)
            {
               $scope.pageafter=true;
            }
            console.log($scope.totalItems)
        }).catch(function (error) {
            console.error('Lỗi:', error);
        });
        
        
    };
   // Các form chức năng thêm sửa xóa sản phẩm  
    $scope.exitForm=()=>{
        v=$scope
        v.screen_shadow=false;
        $scope.addSPShow=false;
        $scope.editSPShow=false;
        $scope.detailSPShow=false;
        $scope.MaSP=1;
        $scope.TenSP=null;
        $scope.MaTH=null;
        $scope.maLoai=null;
        $scope.giaBan=null;
        $scope.imageSP="";
        $scope.Mota=null;
        $scope.sldaban=0;
        $scope.soLuongton=null;
    }
    // model
    $scope.MaSP=1;
    $scope.TenSP;
    $scope.MaTH;
    $scope.maLoai;
    $scope.giaBan;
    $scope.imageSP="";
    $scope.Mota;
    $scope.sldaban=0;
    $scope.soLuongton;
    $scope.trangthai="Còn Hàng"
    $scope.listTH={};
    $scope.listTheLoai={};
    // Lấy danh sách thể loại
    $scope.getTheLoai = () => {
      $http({
            method: "GET",
            url: "http://localhost:8888/TheLoai/GetAll_TheLoai",
            headers: { "Authorization": 'Bearer ' + $scope.user.token }

        }).then((response)=>{
           $scope.listTheLoai=response.data;
        }).catch((error)=>{
           console.log("Lỗi : "+error)
        })}
        
    $scope.getThuongHieu = () => {
      $http({
            method: "GET",
            url: "http://localhost:8888/ThuongHieu/getALL_ThuongHieu",
            headers: { "Authorization": 'Bearer ' + $scope.user.token }
        }).then((response)=>{
           $scope.listTH=response.data;
        }).catch((error)=>{
           console.log("Lỗi : "+error)})}

          
    $scope.screen_shadow=false;
    $scope.editSPShow=false;
    $scope.addSPShow=false;
  
    $scope.getTheLoai();   
    $scope.getThuongHieu();  
        // hàm
    $scope.editSP=()=>{    
        var img=document.getElementById("fileInputedit")
        var dataImg=img.files[0]
        $scope.reloadSP();
        console.log(dataImg)   
        if(dataImg)
        {
            var formData = new FormData();
            formData.append('file', dataImg);
            $http({
                method: 'POST',
                url: 'http://localhost:8888/UploadFile/upload',
                data: formData,
                headers: { 'Content-Type': undefined }
            }).then(function(response)
            {
                $scope.imageSP='/image'+response.data.filePath
                $scope.reloadSP();
                $http({
                    method:"PUT",
                    url:"http://localhost:8888/SanPham/UpdateSP_Info",
                    headers: { "Authorization": 'Bearer ' + $scope.user.token },
                    data:$scope.objSP
                }).then((response)=>{alert("Thông báo :"+response.data),$scope.getProducts()}).catch((error)=>{alert("Thông báo :" + error)})  

            })
        }
        else
        {
            $http({
                method:"PUT",
                url:"http://localhost:8888/SanPham/UpdateSP_Info",
                headers: { "Authorization": 'Bearer ' + $scope.user.token },
                data:$scope.objSP
            }).then((response)=>{alert("Thông báo :"+response.data),$scope.getProducts()}).catch((error)=>{alert("Thông báo :" + error)})  
        }  
        
    }
    $scope.showAddSP=()=>{
        $scope.screen_shadow=true;
        $scope.addSPShow=true;
        console.log($scope.listTheLoai)  
    }
    $scope.showeditSP=(x)=>{
        console.log(x)
        $scope.screen_shadow=true;
        $scope.editSPShow=true; 
        $scope.MaSP=x.maSP;
        $scope.TenSP=x.tenMH;
        $scope.MaTH=x.maTH;
        $scope.maLoai=x.maLoai;
        $scope.giaBan=x.giaBan;
        $scope.imageSP=x.image_SP;
        $scope.Mota=x.mota;
        $scope.sldaban=x.sldaban;
        $scope.soLuongton=x.soLuongton;
        $scope.trangthai="Còn Hàng" 
       
    }

    // Thêm sp
    $scope.reloadSP=()=>{
        $scope.objSP={        
            maSP: $scope.MaSP,
            maTH: $scope.MaTH,
            tenMH: $scope.TenSP,
            maLoai: $scope.maLoai,
            soLuongton: 0,
            giaBan: $scope.giaBan,
            image_SP: $scope.imageSP,
            mota: $scope.Mota,
            luotxem:0,
            sldaban: $scope.sldaban,
            trangthai: $scope.trangthai}  
    }     

    $scope.addSP=()=>{              
        var fileInput = document.getElementById('fileInput');
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
                url: 'http://localhost:8888/UploadFile/upload',
                data: formData,
                headers: { 'Content-Type': undefined }
            })
            .then(function (response) 
            {
                 $scope.imageSP = '/image' + response.data.filePath;
                 $scope.reloadSP() ; 
                 $http({
                     method:"POST",
                     url:'http://localhost:8888/SanPham/create_SP',
                     headers: { "Authorization": 'Bearer ' + $scope.user.token },
                     data: $scope.objSP
                 }).then((result)=>{
                     alert("Thông báo : "+result.data);
                   
                 }).catch((error)=>
                    {alert("Có lỗi khi thêm sản phẩm hãy xem lại dữ liệu đã nhập đầy đủ hay chưa ?")
                          console.log("Lỗi :" + error)})
                 
            })     
         
         };
       
    }

    $scope.detailSP=(x)=>{
        $scope.screen_shadow=false;
    }


    
    $scope.deleteSP = (x) => {              
        if (confirm("Bạn có chắc chắn muốn xóa")) {
            $http({
                method: "DELETE",
                url: 'http://localhost:8888/SanPham/Delete_SP/' + x.maSP,
                headers: { "Authorization": 'Bearer ' + $scope.user.token }
            }).then((result) => {
                alert("Thông báo: " + result.data);
                $scope.getProducts();
            }).catch((error) => {
                alert("Thông báo: " + error);
            });
        } else {
            // Người dùng đã nhấn nút "Cancel", không thực hiện hành động xóa
            console.log("Hành động xóa đã bị hủy bỏ.");
        }
    }
  

    $scope.pageafter=false;
    $scope.pageprev=true;
    $scope.clickSearch();
    
    // chuyển trang sau
    $scope.page_after=()=>{
        $scope.pageprev=false;        
        $scope.page+=1;
        $scope.clickSearch()
        console.log($scope.page * $scope.pageSize)
         if($scope.page * $scope.pageSize >= $scope.totalItems)
         {
            $scope.pageafter=true;
         }

    }
    
    // chuyển trang trước

     $scope.page_prev=()=>{
     $scope.pageafter=false       
        $scope.page-=1;
        if($scope.page<=1){ 
            $scope.page=1;
             $scope.pageprev=true;  }       
        $scope.clickSearch()
     
    }
});