var myAdmin=angular.module("myAdmin",[])
myAdmin.controller("timeNow",($scope)=>{
   var currentDate = new Date();
   var daysOfWeek = ['Chủ nhật', 'Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy'];
   var dayOfWeek = daysOfWeek[currentDate.getUTCDay()]; 
   // Lấy ngày
   var dayOfMonth = currentDate.getUTCDate(); 
   // Lấy tháng
   var monthNames = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
   var month = monthNames[currentDate.getUTCMonth()]; 
   // Lấy năm
   var year = currentDate.getUTCFullYear(); 
   // Gán vào biến time
   $scope.timenow = `${dayOfWeek}, ${dayOfMonth} ${month} ${year}`;
})
function checkedicon(a)
{  
//   parentElenment :thẻ cha
//   children: thẻ con[thứ i]
   var thecha=a.parentElement;   
   var ul=thecha.children[2]   
   // Tìm kiềm xem trong this có chứa class tên iconchecked ko
   if(a.classList.contains("iconchecked"))
   {
      a.classList.remove('iconchecked')
      ul.style.display="none"     

   }
   else
   {
      a.classList.add("iconchecked")
      ul.style.display="block"
   }
   
   
}
myAdmin.controller('manage',($scope,$http)=>{
   $http.get("https://localhost:44334/api/TheLoai/GetAll_TheLoai")
   .then(function(response){
      $scope.content=response.data;
      console.log($scope.content)
   })
})
myAdmin.directive('rowSanpham', () => {
   return {
      template: `
         <table border="1" cellspacing="0" cellpadding="5" style="width: 93%;" class="table1">
            <tr style="background-color: rgb(54, 98, 246); color: white; text-align: center;">
               <td>STT</td>
               <td>Mã Loại</td>
               <td>Tên Loại</td>
               <td>Ghi chú</td>
            </tr>
            <tr ng-repeat="x in content">
               <td class="collumy">{{$index+1}}</td>
               <td class="collumy">{{x.maLoai}}</td>
               <td class="collumy">{{x.tenLoai}}</td>
               <td class="collumy">{{x.ghiChu}}</td>
            </tr>
         </table>
      `
   };
});
document.getElementById("rowSP").style.display='none'


// app.controller('myCtrl', function($scope, $http) {
//    $http.get("https://localhost:44334/api/TheLoai/GetAll_TheLoai")
//    .then(function(response) {
//        $scope.content = response.data;
//        console.log($scope.c)
//    }
// )});


