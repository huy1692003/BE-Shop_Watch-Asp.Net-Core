myApp.controller("timkiemCtrl",function($scope,$http)
{
    
  $scope.search_Product=function()
  {
      $http(
      {
        method:"POST",
        url:"http://localhost:8888/customer/SanPham/search_SP",
        data:{
          page: 1,              // Set the initial page value
          pageSize: 18,
          tenSanPham:$scope.txtSearchTenSanPham,  
          giatien: $scope.txtSearchGiaTien
        }
      }
    ).then(function(reponse)
    {
      $scope.listSP_Search=reponse.data.data
      
    })
  }
  $scope.search_Product();

})