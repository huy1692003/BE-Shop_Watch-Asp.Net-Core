myAdmin.controller('hoadonbanCtrl', function($scope, $http)  {
    $scope.page = 1;
    $scope.txtSearchTrangThai = 0;
    $scope.txtSearchtime_begin = '';
    $scope.txtSearchtime_end = '';
    $scope.txtSearchTenTaiKhoan = '';
    $scope.listItem = [];
    $scope.totalItems = 0;
    $scope.objHDB = {};
    
    $scope.pageafter = false;
    $scope.pageprev = true;
    
    $scope.clickSearch = () => {
        $scope.searchParameters = {
            page: $scope.page,
            pageSize: $scope.pageSize,
            trangthai: $scope.txtSearchTrangThai,
            time_begin: $scope.txtSearchtime_begin,
            time_end: $scope.txtSearchtime_end,
            tentaikhoan: $scope.txtSearchTenTaiKhoan
        };
        console.log($scope.searchParameters);
        $scope.getHoaDons();
    };
    $scope.update_statusHDB=(x,y)=>{
        var confirmTB=Number(y)==1?confirm("Bạn có muốn xác nhận đơn hàng không ? "):confirm("Bạn có muốn hủy đơn hàng không ? ")
        if(confirmTB)
           {
                $http(
                    {
                        method:"PUT",
                        url:"http://localhost:8888/HoaDonBan/update_StatusHDB/"+Number(x.maHD)+','+Number(y),
                        headers: { "Authorization": 'Bearer ' + $scope.user.token }
                    }
                ).then(function(response)
                {
                    Number(y)==1?alert("Xác nhận thành công đơn hàng"):alert("Hủy thành công đơn hàng")
                    $scope.clickSearch();
                }).catch(function(error){                   
                    Number(y)==1?console.log('Lỗi xác nhận đơn hàng : '+error): console.log('Lỗi hủy đơn hàng : '+error)
                })
            }
        else
            {
                Number(y)==1?alert("Hủy bỏ lựa chọn xác nhận đơn hàng !"):alert("Hủy bỏ lựa chọn hủy đơn hàng !")
            }           
               
    }
   

    $scope.exitForm=()=>{
       
        $scope.screen_shadow=false;
        
        $scope.detailSPshow=false;
    }

    $scope.showListDH=(x)=>
    {
        $scope.pageafter=false;
        $scope.txtSearchTrangThai=Number(x);
        console.log($scope.txtSearchTrangThai);
        $scope.clickSearch();          
        x==0?$scope.hideConfirmHDB=false:$scope.hideConfirmHDB=true
        $scope.hideCancelHDB=false
        if(Number(x)==2)
        {
            $scope.hideCancelHDB=true
        }
        
        

    } 
   
    $scope.getHoaDons = () => {
        $http({
            method: 'POST',
            url: 'http://localhost:8888/HoaDonBan/search_HDB',
            headers: { "Authorization": 'Bearer ' + $scope.user.token },
            data: $scope.searchParameters,
            headers:{
                "Authorization":"Bearer "+$scope.user.token,
                'Content-Type': 'application/json'
            }
        }).then((response) => {
            $scope.listItem = response.data.data;
            $scope.totalItems = response.data.totalItems     
            if($scope.totalItems<=$scope.pageSize)
            {
              $scope.pageafter=true
            }
        }).catch((error) => {
            console.error('Lỗi:', error);
        });
    };

    $scope.page_after = () => {
        $scope.pageprev = false;
        $scope.page += 1;
        $scope.clickSearch();
        console.log($scope.page * $scope.pageSize);
        if ($scope.page * $scope.pageSize >= $scope.totalItems) {
            $scope.pageafter = true;
        }
    };

    $scope.page_prev = () => {
        $scope.pageafter = false;
        $scope.page -= 1;
        if ($scope.page <= 1) {
            $scope.page = 1;
            $scope.pageprev = true;
        }
        $scope.clickSearch();
    };

    // Khởi tạo tìm kiếm khi controller được load
    $scope.clickSearch();

    $scope.getDetail_oderByID=(x)=>
    {        
        $scope.screen_shadow=true;
        $scope.detailSPshow=true;        
        $http(
            {
                method:"POST",
                url:"http://localhost:8888/HoaDonBan/getdetail_HDB/"+x.maHD,
                headers: { "Authorization": 'Bearer ' + $scope.user.token }
            }
        ).then(function(response){
          $scope.inforHDB=response.data;
          console.log($scope.inforHDB)          
        })
    }
});
function hdb_active(x)
{
    document.querySelector('.hdb_active').classList.remove('hdb_active');
    x.classList.add('hdb_active')
}
