myAdmin.controller('sanphamCtrl', function ($scope,$http) {
    // Khởi tạo
   
    $scope.page=1;
    $scope.pageSize=9;
    $scope.txtSearchTenSanPham='';
    $scope.txtSearchThuongHieu='';
    $scope.txtSearchTheloai='';
    $scope.txtSearchGiaTien='';  
    $scope.listItem = [];
    $scope.totalItems = 0;   
    $scope.clickSearch=()=>{
        $scope.searchParameters = {
            page: $scope.page,              // Set the initial page value
            pageSize: $scope.pageSize,
            tenSanPham:$scope.txtSearchTenSanPham,
            tenThuongHieu:$scope.txtSearchThuongHieu,
            tenTheLoai:$scope.txtSearchTheloai ,  // Set the initial page size
            giatien: $scope.txtSearchGiaTien
        };
        $scope.getProducts();      
        
    }
    
    $scope.getProducts = function () {
        $http({
            method: 'POST',
            url: 'https://localhost:44334/api/SanPham/search_SP',
            data: $scope.searchParameters // Send the search parameters as the request body
        }).then(function (response) {
            $scope.listItem = response.data.data;          
            $scope.totalItems = response.data.totalItems;            
            console.log($scope.listItem)
        }).catch(function (error) {
            console.error('Lỗi:', error);
        });
        
        
    };


    // Các form chức năng thêm sửa xóa sản phẩm
    $scope.screen_shadow=true;
    $scope.addSPShow=false;
    $scope.editSPShow=false;
    $scope.detailSPShow=false;
    $scope.exitForm=()=>{
        $scope.screen_shadow=true;
        $scope.addSPShow=false;
        $scope.editSPShow=false;
        $scope.detailSPShow=false;
    }
    // model
    $scope.MaSP=1;
    $scope.TenSP="";
    $scope.MaTH=1;
    $scope.maLoai=1;
    $scope.giaBan=10000;
    $scope.imageSP='anh.jpg';
    $scope.Mota="";
    $scope.sldaban=0;
    $scope.trangthai="Còn Hàng"
    $scope.listTH={};
    $scope.listTheLoai={};
    // Lấy danh sách thể loại
    $scope.getTheLoai = () => {
      $http({
            method: "GET",
            url: "https://localhost:44334/api/TheLoai/GetAll_TheLoai"
        }).then((response)=>{
           $scope.listTheLoai=response.data;
        }).catch((error)=>{
           console.log("Lỗi : "+error)
        })}
        
    $scope.getThuongHieu = () => {
      $http({
            method: "GET",
            url: "https://localhost:44334/getALL_ThuongHieu"
        }).then((response)=>{
           $scope.listTH=response.data;
        }).catch((error)=>{
           console.log("Lỗi : "+error)})}

          

// Sử dụng hàm getTheLoai bằng cách sử dụng await

    $scope.getTheLoai();   
    $scope.getThuongHieu();  
        // hàm
    $scope.editSP=(x)=>{
        $scope.screen_shadow=false;
    }
    $scope.showAddSP=()=>{
        $scope.screen_shadow=false;
        $scope.addSPShow=true;
        console.log($scope.listTheLoai)  
    }
    // Thêm sp
    $scope.objSP={        
             maSP: $scope.MaSP,
             maTH: $scope.MaTH,
             tenMH: $scope.TenSP,
             maLoai: $scope.maLoai,
             soLuongton: $scope.sldaban,
             giaBan: $scope.giaBan,
             image_SP: $scope.imageSP,
             mota: $scope.Mota,
             sldaban: $scope.sldaban,
             trangthai: $scope.trangthai          
    }
    $scope.addSP=()=>{   
        console.log($scope.objSP)  
       
        $http({
            method:"POST",
            url:'https://localhost:44334/api/SanPham/create_SP',
            data: $scope.objSP
        }).then((result)=>{
            alert("Thông báo : "+result.data)
        }).catch((error)=>{alert("Có lỗi khi thêm sản phẩm : "+ error)})

    }
    $scope.detailSP=(x)=>{
        $scope.screen_shadow=false;
    }
    $scope.deleteSP=(x)=>{
        if (confirm("Bạn có chắc chắn muốn xóa?")) {
            // Người dùng đã nhấn nút "OK", thực hiện hành động xóa ở đây
            console.log("Hành động xóa đã được thực hiện.");
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
        console.log(parseInt($scope.totalItems/$scope.pageSize))
        $scope.clickSearch()
        if($scope.page===parseInt($scope.totalItems/$scope.pageSize)){
        $scope.pageafter=true;
     }
       
     
    }
    
    // chuyển trang trước

     $scope.page_prev=()=>{
     $scope.pageafter=false       
        $scope.page-=1;
        if($scope.page===1){  $scope.pageprev=true;  }       
        $scope.clickSearch()
     
    }
 });