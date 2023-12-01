myApp.controller("trangchuCtrl",function($scope,$http)
{
 
  $scope.getProduct = function(x) {
    return $http({
      method: "POST",
      url: "https://localhost:44329/api/SanPham/search_SP",
      data: {
        page: 1,
        pageSize: 12,
        maTheLoai: x
      }
    }).then(function(response) {
      return response.data.data;
    }).catch(function(error) {
      console.log(error);
      return []; // Trả về một giá trị mặc định hoặc thực hiện xử lý lỗi khác tùy thuộc vào yêu cầu của bạn.
    });
  };
  
    
  

  // Đồng hồ nam
  $scope.getProduct(17).then(function(result) {
    $scope.listSP_Nam=result;
    console.log(result)
  })
  // Đồng hồ nữ
  $scope.getProduct(18).then(function(result) {
    $scope.listSP_Nu=result;
    console.log(result)
  })
  // Đồng hồ đôi
  $scope.getProduct(3).then(function(result) {
    $scope.listSP_Doi=result;
    console.log(result)
  })
  


  $scope.txtSearchTenSanPham='', 
  $scope.txtSearchGiaTien='';
 
})
  























// Hiệu Ứng CHuyển Ảnh
var imgss=['/image/banner1.webp','/image/banner2.jpg','/image/banner3.png']
var i=1
setInterval(() => {
  
  if(i===imgss.length){i=0}
  document.querySelector('.banner>img').src=imgss[i]
  i++

   
},3000)





