function hdb_active(x)
{
const y=document.querySelector(".hdb_active");
y.classList.remove("hdb_active"); 
x.classList.add("hdb_active")
} 
myAdmin.controller('hoadonbanCtrl',($scope,$http)=>{

  

    $scope.page=1;
    $scope.pageSize=5;
    $scope.txtSearchTrangThai=0;
    $scope.txtSearchtime_begin="";
    $scope.txtSearchtime_end='';
    $scope.txtSearchTenTaiKhoan='';  
    $scope.listItem = [];
    $scope.totalItems = 0;  
    $scope.objHDB={} 
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


















    $scope.pageafter=false;
    $scope.pageprev=true;
    $scope.clickSearch();
    // chuyển trang sau
    $scope.page_after=()=>{
     $scope.pageprev=false;        
        $scope.page+=1;
        console.log(parseInt($scope.totalItems/$scope.pageSize))
        $scope.clickSearch()
        if($scope.page>parseInt($scope.totalItems/$scope.pageSize)){
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
})


