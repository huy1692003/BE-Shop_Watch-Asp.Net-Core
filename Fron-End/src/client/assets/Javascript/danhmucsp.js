myApp.controller("danhmucspCtrl",function($scope,$http)
{
  $scope.search_TL=JSON.parse(localStorage.getItem('searchTheloai'))
 
  $scope.getSP_byTL=function()
  {
    $http(
      {
        method:"POST",
        url:"http://localhost:8888/customer/SanPham/search_SP",
        data:{
          page: 1,              // Set the initial page value
          pageSize: 18,        
          giatien:$scope.txtSearchGiaTien,
          maTheLoai:$scope.search_TL.maLoai   // Set the initial page size
          
        }
      }
    ).then(function(reponse)
    {
      $scope.listSP_byTL=reponse.data.data
      console.log($scope.listSP_byTL)
    })
  }
  $scope.getSP_byTL()

})