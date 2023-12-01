myApp.controller("thuonghieuCtrl",function($scope,$http)
{
  $scope.search_TH=JSON.parse(localStorage.getItem('search_TH'))
  
  $scope.getSP_byTH=function()
  {
    $http(
      {
        method:"POST",
        url:"http://localhost:8888/customer/SanPham/search_SP",
        data:{
          page: 1,              // Set the initial page value
          pageSize: 18,       
          giatien:$scope.txtSearchGiaTien,
          maThuongHieu:$scope.search_TH.maTH   // Set the initial page size
          
        }
      }
    ).then(function(reponse)
    {
      $scope.listSP_byTH=reponse.data.data
     
    })
  }
  $scope.getSP_byTH()

})