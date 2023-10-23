myAdmin.controller('sanphamCtrl', function ($scope,$http) {
    // Khởi tạo
    $scope.totalItem = 'huy';
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
        $scope.searchProducts();
    }
    $scope.searchProducts = function () {
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
   
    $scope.clickSearch()
    
 });